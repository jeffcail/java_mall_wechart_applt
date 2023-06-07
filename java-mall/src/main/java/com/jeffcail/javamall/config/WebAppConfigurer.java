package com.jeffcail.javamall.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @ClassName WebAppConfigurer
 * @Description TODO
 * @Author cc
 * @Date 2023/6/7 2:38 下午
 * @Version 1.0
 */
@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/image/swiper/**").
                addResourceLocations("file:/Users/cc/project/github/java/java_mall_wechat_applt/java-mall/swiperImgs/");
        registry.addResourceHandler("/image/bigType/**").
                addResourceLocations("file:/Users/cc/project/github/java/java_mall_wechat_applt/java-mall/bigTypeImages/");
        registry.addResourceHandler("/image/productImages/**").
                addResourceLocations("file:/Users/cc/project/github/java/java_mall_wechat_applt/java-mall/productImgs/");
    }
}
