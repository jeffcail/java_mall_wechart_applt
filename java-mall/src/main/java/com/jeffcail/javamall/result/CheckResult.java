package com.jeffcail.javamall.result;

import io.jsonwebtoken.Claims;

/**
 * @ClassName CheckResult
 * @Description TODO
 * @Author cc
 * @Date 2023/6/8 11:02 下午
 * @Version 1.0
 */
public class CheckResult {

    private int errCode;

    private boolean success;

    private Claims claims;

    public int getErrCode() {
        return errCode;
    }

    public void setErrCode(int errCode) {
        this.errCode = errCode;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Claims getClaims() {
        return claims;
    }

    public void setClaims(Claims claims) {
        this.claims = claims;
    }
}
