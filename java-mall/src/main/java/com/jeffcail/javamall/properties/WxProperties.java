package com.jeffcail.javamall.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @ClassName WxProperties
 * @Description TODO
 * @Author cc
 * @Date 2023/6/8 2:58 下午
 * @Version 1.0
 */
@Component
@ConfigurationProperties(prefix = "weixin")
@Data
public class WxProperties {

    private String jscode2sessionUrl;

    private String appid;

    private String secret;

}
