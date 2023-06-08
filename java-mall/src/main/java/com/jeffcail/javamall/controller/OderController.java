package com.jeffcail.javamall.controller;

import com.jeffcail.javamall.entity.Order;
import com.jeffcail.javamall.entity.OrderDetail;
import com.jeffcail.javamall.result.R;
import com.jeffcail.javamall.service.IOrderDetailService;
import com.jeffcail.javamall.service.IOrderService;
import com.jeffcail.javamall.util.DateUtil;
import com.jeffcail.javamall.util.JwtUtil;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;

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

}
