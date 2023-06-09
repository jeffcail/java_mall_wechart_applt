package com.jeffcail.javamall.config;

import com.jeffcail.javamall.interceptor.JwtInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
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

        registry.addResourceHandler("/image/detail/**").
                addResourceLocations("file:/Users/cc/project/github/java/java_mall_wechat_applt/java-mall/productDetailImgs/");

        registry.addResourceHandler("/image/productParaImgs/**").
                addResourceLocations("file:/Users/cc/project/github/java/java_mall_wechat_applt/java-mall/productParaImgs/");

        registry.addResourceHandler("/image/productIntroImgs/**").
                addResourceLocations("file:/Users/cc/project/github/java/java_mall_wechat_applt/java-mall/productIntroImgs/");
    }

    public JwtInterceptor jwtInterceptor() {
        return new JwtInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] patterns = new String[]{"/api/wx/user/login", "/image/swiper/**", "/image/bigType/**", "/image/productImages/**",
        "/image/detail/**", "/image/productParaImgs/**", "/image/productIntroImgs/**", "/api/**"};
        registry.addInterceptor(jwtInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(patterns);
    }
}
