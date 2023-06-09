package com.jeffcail.javamall.exception;

import com.jeffcail.javamall.result.R;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName GlobalException
 * @Description TODO
 * @Author cc
 * @Date 2023/6/9 12:52 下午
 * @Version 1.0
 */
@ControllerAdvice
@ResponseBody
public class GlobalException {

    @ExceptionHandler(value = Exception.class)
    public R exceptionHandler(HttpServletRequest request, Exception e) {
        return R.error("服务开小差儿了，请联系管理员处理::🚀🚀🚀"+e.getMessage());
    }

}
