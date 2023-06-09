package com.jeffcail.javamall.interceptor;

import com.jeffcail.javamall.util.JwtUtil;
import com.jeffcail.javamall.util.StringUtil;
import io.jsonwebtoken.Claims;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName JwtInterceptor
 * @Description TODO
 * @Author cc
 * @Date 2023/6/9 12:35 下午
 * @Version 1.0
 */
public class JwtInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String path = request.getRequestURI();

        if (handler instanceof HandlerMethod) {
            String token = request.getHeader("token");
            if (StringUtil.isEmpty(token)) {
                throw new RuntimeException("缺少签名验证token");
            } else {
                Claims claims = JwtUtil.validateToken(token).getClaims();
                if (claims == null) {
                    throw new RuntimeException("鉴权失败");
                } else {
                    return true;
                }
            }
        }

        return true;
    }
}
