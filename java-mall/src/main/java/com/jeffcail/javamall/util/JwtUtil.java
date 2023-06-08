package com.jeffcail.javamall.util;

import com.jeffcail.javamall.constant.WxUserConstant;
import com.jeffcail.javamall.result.CheckResult;
import io.jsonwebtoken.*;
import org.bouncycastle.util.encoders.Base64;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Date;

/**
 * @ClassName JwtUtil
 * @Description TODO
 * @Author cc
 * @Date 2023/6/8 10:46 下午
 * @Version 1.0
 */
public class JwtUtil {

    /**
     * 签发token
     * @param id
     * @param subject
     * @param ttlMills
     * @return
     */
    public static String generateToken(String id, String subject, long ttlMills) {
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        SecretKey secretKey = generateKey();
        JwtBuilder builder = Jwts.builder()
                .setId(id)
                .setSubject(subject) // 主体
                .setIssuer("jeffcail") // 签发人
                .setIssuedAt(now) // 签发时间
                .signWith(signatureAlgorithm, secretKey); // 签名算法及密钥
        if (ttlMills >= 0) {
            long expireMills = nowMillis + ttlMills;
            Date expireDate = new Date(expireMills);
            builder.setExpiration(expireDate); // 过期时间
        }
        return builder.compact();
    }


    /**
     * token 验证
     * @param token
     * @return
     */
    public static CheckResult validateToken(String token) {
        CheckResult checkResult = new CheckResult();
        Claims claims = null;

        try {
             claims = parseToken(token);
             checkResult.setSuccess(true);
             checkResult.setClaims(claims);
        } catch (ExpiredJwtException e) {
            checkResult.setErrCode(WxUserConstant.TOKEN_IS_EXPIRE);
            checkResult.setSuccess(false);
        } catch (SignatureException e) {
            checkResult.setErrCode(WxUserConstant.TOKEN_IS_FAIL);
            checkResult.setSuccess(false);
        } catch (Exception e) {
            checkResult.setErrCode(WxUserConstant.TOKEN_IS_FAIL);
            checkResult.setSuccess(false);
        }
        return checkResult;
    }

    private static SecretKey generateKey() {
        byte[] decode = Base64.decode(WxUserConstant.Jwt_Secret);
        return new SecretKeySpec(decode, 0, decode.length, "AES");
    }

    /**
     * 解析 token
     * @param token
     * @return
     * @throws Exception
     */
    public static Claims parseToken(String token) throws Exception {
        SecretKey secretKey = generateKey();
        return Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(token)
                .getBody();
    }

    public static void main(String[] args) throws InterruptedException {
        //小明失效 10s
        String sc = generateToken("1","小明", 60 * 60 * 1000);
        System.out.println(sc);
        System.out.println(validateToken(sc).getErrCode());
        System.out.println(validateToken(sc).getClaims().getId());
        System.out.println(validateToken(sc).getClaims().getSubject());
        //Thread.sleep(3000);
        System.out.println(validateToken(sc).getClaims());
        Claims claims = validateToken(sc).getClaims();
        String sc2 = generateToken(claims.getId(),claims.getSubject(), WxUserConstant.Jwt_Ttl);
        System.out.println(sc2);
    }

}
