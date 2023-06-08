package com.jeffcail.javamall.constant;

/**
 * @ClassName WxUserConstant
 * @Description TODO
 * @Author cc
 * @Date 2023/6/8 10:51 下午
 * @Version 1.0
 */
public class WxUserConstant {


    public static final int TOKEN_IS_NOT = 4000;  // token不存在
    public static final int TOKEN_IS_EXPIRE = 4001; // token 已过期
    public static final int TOKEN_IS_FAIL = 4002; // token 无效token

    public static final String Jwt_Secret = "9677af3hc3a35e46a61n094d5jl9448f";
    public static final long Jwt_Ttl = 1000 * 60 * 60 * 24 * 7;
}
