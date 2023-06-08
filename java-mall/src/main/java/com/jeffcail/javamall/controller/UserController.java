package com.jeffcail.javamall.controller;

import com.jeffcail.javamall.entity.WxUserInfo;
import com.jeffcail.javamall.properties.WxProperties;
import com.jeffcail.javamall.result.R;
import com.jeffcail.javamall.service.IWxUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

        return R.ok();
    }

}
