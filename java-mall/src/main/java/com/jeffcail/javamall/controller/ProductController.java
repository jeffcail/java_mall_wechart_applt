package com.jeffcail.javamall.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jeffcail.javamall.entity.Product;
import com.jeffcail.javamall.result.R;
import com.jeffcail.javamall.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName ProductController
 * @Description TODO
 * @Author cc
 * @Date 2023/6/4 9:58 下午
 * @Version 1.0
 */
@RestController
@RequestMapping("/api/product")
public class ProductController {

    @Autowired
    IProductService productService;

    /**
     * 轮播商品
     * @return
     */
    @GetMapping("/findSwiper")
    public R findSwiper() {
        List<Product> productList = productService.list(new QueryWrapper<Product>().
                        eq("isSwiper", true).
                        orderByAsc("swiperSort"));
        Map<String, Object> map = new HashMap<>();
        map.put("message", productList);
        return R.ok(map);
    }

}
