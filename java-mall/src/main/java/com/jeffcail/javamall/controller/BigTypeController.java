package com.jeffcail.javamall.controller;

import com.jeffcail.javamall.entity.BigType;
import com.jeffcail.javamall.result.R;
import com.jeffcail.javamall.service.IBigTypeService;
import org.springframework.beans.factory.annotation.Autowired;
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

}
