package com.jeffcail.javamall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jeffcail.javamall.entity.Product;
import com.jeffcail.javamall.mapper.ProductMapper;
import com.jeffcail.javamall.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName IProductSeriviceImpl
 * @Description TODO
 * @Author cc
 * @Date 2023/6/4 9:56 下午
 * @Version 1.0
 */
@Service("productService")
public class IProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {

    @Autowired
    private ProductMapper productMapper;


}
