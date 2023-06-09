package com.jeffcail.javamall.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jeffcail.javamall.entity.Order;
import com.jeffcail.javamall.entity.OrderDetail;
import com.jeffcail.javamall.properties.WeixinpayProperties;
import com.jeffcail.javamall.result.R;
import com.jeffcail.javamall.service.IOrderDetailService;
import com.jeffcail.javamall.service.IOrderService;
import com.jeffcail.javamall.util.*;
import io.jsonwebtoken.Claims;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;

/**
 * @ClassName OderController
 * @Description TODO
 * @Author cc
 * @Date 2023/6/8 11:55 下午
 * @Version 1.0
 */
@RestController
@RequestMapping("/api/my/order")
public class OderController {

    @Autowired
    private IOrderDetailService orderDetailService;

    @Autowired
    private IOrderService orderService;

    @Autowired
    private WeixinpayProperties weixinpayProperties;

    /**
     * 创建订单,返回订单号
     * @param token
     * @return
     */
    @RequestMapping("/create")
    @Transactional
    public R create(@RequestBody Order order,
                    @RequestHeader(value = "token") String token) {
        // token 获取openid
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        System.out.println("token: " + token);
        System.out.println("order: " + order);
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        Claims claims = JwtUtil.validateToken(token).getClaims();
        if (claims != null) {
            System.out.println("openid=: " + claims.getId());
            order.setUserId(claims.getId());
        }

        // 添加订单到数据库
        order.setOrderNo("MALL"+ DateUtil.getCurrentDateStr());
        order.setCreateDate(new Date());

        OrderDetail[] goods = order.getGoods();
        orderService.save(order);

        // 添加订单详情
        for (int i = 0; i < goods.length; i++) {
            OrderDetail orderDetail = goods[i];
            orderDetail.setMId(order.getId());
            orderDetailService.save(orderDetail);
        }

        HashMap<String, Object> map = new HashMap<>();
        map.put("orderNo", order.getOrderNo());
        return R.ok(map);
    }

    @PostMapping("/prePay")
    public R prePay(@RequestBody String orderNo) throws Exception {
        System.out.println("orderNo: " + orderNo);
        Order order = orderService.getOne(new QueryWrapper<Order>().eq("orderNo", orderNo));

        Map<String, Object> map = new HashMap<>();
        map.put("appid", weixinpayProperties.getAppid());
        map.put("mch_id", weixinpayProperties.getMch_id());
        map.put("nonce_str", StringUtil.getRandomString(32));
        map.put("body", "小程序购买商品测试");
        map.put("out_trade_no", orderNo);
//        map.put("total_fee", order.getTotalPrice().movePointRight(2));
        map.put("total_fee", 1); // 模拟测试 1分钱
        map.put("spbill_create_ip", "127.0.0.1");
        map.put("notify_url", weixinpayProperties.getNotify_url());
        map.put("trade_type", "JAVAMALL");
        map.put("trade_type", "JAVAMALL");
        map.put("openid", order.getUserId());
        map.put("sign", sign(map));

        String xml = XmlUtil.genXml(map);
        HttpResponse response = HttpClient.sendXMLDataByPost(weixinpayProperties.getUrl().toString(), xml);
        String content = HttpClient.getHttpEntityContent(response);
        System.out.println(content);

        // xml 转 map
        // TODO
        Map resultMap = XmlUtil.doXMLParse(content);
        System.out.println("resultMap="+resultMap);

        if(resultMap.get("result_code").equals("SUCCESS")){
            Map<String,Object> payMap=new HashMap<>();
            payMap.put("appId",resultMap.get("appid"));
            payMap.put("timeStamp",System.currentTimeMillis()/1000+"");
            payMap.put("nonceStr",StringUtil.getRandomString(32));
            payMap.put("package","prepay_id="+resultMap.get("prepay_id"));
            payMap.put("signType","MD5");
            payMap.put("paySign",sign(payMap));
            payMap.put("orderNo",orderNo);

            return R.ok(payMap);

        }else{
            return R.error(500,"系统报错，请联系管理员");
        }

    }

    /**
     * 微信支付签名
     * @param map
     * @return
     */
    private String sign(Map<String, Object> map) {
        StringBuffer stringBuffer = new StringBuffer();
        String[] keyArr = (String[]) map.keySet().toArray(new String[map.keySet().size()]);
        Arrays.sort(keyArr);
        for (int i = 0, size = keyArr.length; i < size; ++i) {
           if ("sign".equals(keyArr[i])) {
               continue;
           }
           stringBuffer.append(keyArr[i] + "=" + map.get(keyArr[i]) + "&");
        }
        stringBuffer.append("key=" + weixinpayProperties.getKey());
        String sign = string2MD5(stringBuffer.toString());
        return sign;
    }

    /**
     * md5
     * @param str
     * @return
     */
    public String string2MD5(String str) {
        if (str == null || str.length() == 0) {
            return null;
        }
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f'};

        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(str.getBytes(StandardCharsets.UTF_8));

            byte[] digest = md5.digest();
            int length = digest.length;
            char buf[] = new char[length * 2];
            int k = 0;
            for (int i = 0; i < length; i++) {
                byte byte0 = digest[i];
                buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
                buf[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(buf).toUpperCase();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 订单查询 type值 0 全部订单  1 待付款  2 待收货 3 退款/退货
     * @param type
     * @return
     */
    @RequestMapping("/list")
    public R list(Integer type){
        System.out.println("type="+type);

        List<Order> orderList=null;
        Map<String,Object> resultMap=new HashMap<>();

        if(type==0){ // 全部订单查询
            orderList=orderService.list(new QueryWrapper<Order>().orderByDesc("id"));
        }else{
            orderList=orderService.list(new QueryWrapper<Order>().eq("status",type).orderByDesc("id"));
        }

        resultMap.put("orderList",orderList);
        return R.ok(resultMap);
    }


}
