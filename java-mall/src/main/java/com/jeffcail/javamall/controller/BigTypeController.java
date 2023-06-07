package com.jeffcail.javamall.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jeffcail.javamall.entity.BigType;
import com.jeffcail.javamall.entity.Product;
import com.jeffcail.javamall.entity.SmallType;
import com.jeffcail.javamall.result.R;
import com.jeffcail.javamall.service.IBigTypeService;
import com.jeffcail.javamall.service.IProductService;
import com.jeffcail.javamall.service.ISmallTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

/**
 * @ClassName BigTypeController
 * @Description TODO
 * @Author cc
 * @Date 2023/6/7 4:52 下午
 * @Version 1.0
 */
@RestController()
@RequestMapping("/api/bigType")
public class BigTypeController {

    @Autowired
    private IBigTypeService bigTypeService;

    @Autowired
    private ISmallTypeService smallTypeService;

    @Autowired
    private IProductService productService;

    /**
     * 商品大类
     * @return
     */
    @RequestMapping("/findAll")
    public R findAll() {
        List<BigType> bigTypeList = bigTypeService.list();
        HashMap<String, Object> map = new HashMap<>();
        map.put("message", bigTypeList);
        return R.ok(map);
    }

    @GetMapping("/findCategories")
    public R findCategories() {
        List<BigType> bigTypeList = bigTypeService.list();
        for (BigType bigType:bigTypeList) {
            List<SmallType> smallTypeList = smallTypeService.list(new QueryWrapper<SmallType>().
                    eq("bigTypeId", bigType.getId()));
            bigType.setSmallTypeList(smallTypeList);
            for (SmallType smallType:smallTypeList) {
                List<Product> productList = productService.list(new QueryWrapper<Product>().
                        eq("typeId", smallType.getId()));
                smallType.setProductList(productList);
            }
        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("message", bigTypeList);
        return R.ok(map);
    }

}
