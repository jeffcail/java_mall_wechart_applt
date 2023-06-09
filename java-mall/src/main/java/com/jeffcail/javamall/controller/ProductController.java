package com.jeffcail.javamall.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jeffcail.javamall.entity.Product;
import com.jeffcail.javamall.entity.ProductSwiperImage;
import com.jeffcail.javamall.result.R;
import com.jeffcail.javamall.service.IProductService;
import com.jeffcail.javamall.service.IProductSwiperImageService;
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

    @Autowired
    private IProductSwiperImageService iProductSwiperImageService;

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

     /**
     * 热门商品
     * @return
     */
     @GetMapping("/findHot")
     public R findHot() {
         Page<Product> page = new Page<>(0, 8);
         Page<Product> productPage = productService.page(page, new QueryWrapper<Product>().
                 eq("isHot", true).orderByAsc("hotDateTime"));
         List<Product> records = productPage.getRecords();
         Map<String, Object> map = new HashMap<>();
         map.put("message", records);
         return R.ok(map);
     }

     /**
     * 商品详情
     * @param id
     * @return
     */
     @GetMapping("/detail")
     public R detail(Integer id) {
         Product product = productService.getById(id);
         List<ProductSwiperImage> swiperImageList = iProductSwiperImageService.
                 list(new QueryWrapper<ProductSwiperImage>().eq("productId", product.getId()).orderByAsc("sort"));
         product.setProductSwiperImageList(swiperImageList);
         HashMap<String, Object> map = new HashMap<>();
         map.put("message", product);
         return R.ok(map);
     }

}
