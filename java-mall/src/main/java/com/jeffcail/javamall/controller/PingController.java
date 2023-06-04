package com.jeffcail.javamall.controller;

import com.jeffcail.javamall.result.R;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName PingController
 * @Description TODO
 * @Author cc
 * @Date 2023/6/4 7:53 下午
 * @Version 1.0
 */
@RestController
@RequestMapping("/api")
public class PingController {

    @GetMapping("/ping")
    R test() {
        return R.ok("pong...");
    }
}
