package com.jeffcail.javamall.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jeffcail.javamall.constant.WxUserConstant;
import com.jeffcail.javamall.entity.WxUserInfo;
import com.jeffcail.javamall.properties.WxProperties;
import com.jeffcail.javamall.result.R;
import com.jeffcail.javamall.service.IWxUserInfoService;
import com.jeffcail.javamall.util.HttpClient;
import com.jeffcail.javamall.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;

/**
 * @ClassName UserController
 * @Description TODO
 * @Author cc
 * @Date 2023/6/8 2:36 下午
 * @Version 1.0
 */
@RestController
@RequestMapping("/api/wx/user")
public class UserController {

    @Autowired
    private IWxUserInfoService wxUserInfoService;

    @Autowired
    private WxProperties wxProperties;

    @Autowired
    private HttpClient httpClient;

    // 需要企业认证 拿到真实的 appid 和 secret，调用 code2Session接口 获取 openid
    // https://developers.weixin.qq.com/miniprogram/dev/OpenApiDoc/user-login/code2Session.html
    // 小程序登录
    // 接口应在服务器端调用，详细说明参见服务端API。
    // 接口英文名
    // code2Session
    @PostMapping("/login")
    public R wxLogin(@RequestBody WxUserInfo wxUserInfo) {
        System.out.println("***************************");
        System.out.println("wxUserInfo: " + wxUserInfo);
        System.out.println("***************************");

        String jscode2sessionUrl = wxProperties.getJscode2sessionUrl()+
                "?appid="+wxProperties.getAppid()+
                "&secret="+wxProperties.getSecret()+
                "&js_code="+wxUserInfo.getCode()+
                "&grant_type=authorization_code";

        System.out.println("***************************");
        System.out.println("jscode2sessionUrl:" + jscode2sessionUrl);
        System.out.println("***************************");

        String result = httpClient.sendHttpPost(jscode2sessionUrl);
        System.out.println("***************************");
        System.out.println("result:" + result);
        System.out.println("***************************");

        JSONObject jsonObject = JSON.parseObject(result);
        String openid = jsonObject.toString();
        System.out.println("***************************");
        System.out.println("openid: "+ openid);
        System.out.println("***************************");

        // 将用户写进数据库
        // 应该调用真实获取到的openid
        // WxUserInfo resWxUserInfo = wxUserInfoService.getOne(new QueryWrapper<WxUserInfo>().eq("openid", openid));
        // 模拟opendi
        WxUserInfo resWxUserInfo = wxUserInfoService.getOne(new QueryWrapper<WxUserInfo>().eq("openid", "dfasdfsdaadfasds"));
        if (null==resWxUserInfo) { // 新用户 写进数据库
            wxUserInfo.setOpenid(openid);
            wxUserInfo.setRegisterDate(new Date());
            wxUserInfo.setLastLoginDate(new Date());
            wxUserInfoService.save(wxUserInfo);

        } else { // 已经授权登陆过 更新登陆时间、用户昵称（微信昵称可能存在改的情况）
            resWxUserInfo.setNickName(wxUserInfo.getNickName());
            resWxUserInfo.setAvatarUrl(wxUserInfo.getAvatarUrl());
            resWxUserInfo.setLastLoginDate(new Date());
            wxUserInfoService.updateById(resWxUserInfo);
        }


        // 利用jwt生成token返回到前端
        String token = JwtUtil.generateToken(openid, wxUserInfo.getNickName(), WxUserConstant.Jwt_Ttl);
        HashMap<String, Object> map = new HashMap<>();
        map.put("token", token);
        return R.ok(map);
    }

}
