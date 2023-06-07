package com.jeffcail.javamall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jeffcail.javamall.entity.ProductSwiperImage;
import com.jeffcail.javamall.mapper.ProductSwiperImageMapper;
import com.jeffcail.javamall.service.IProductSwiperImageService;
import org.springframework.stereotype.Service;

/**
 * @ClassName IProductSwiperImageServiceImpl
 * @Description TODO
 * @Author cc
 * @Date 2023/6/8 12:32 上午
 * @Version 1.0
 */
@Service("iProductSwiperImageService")
public class IProductSwiperImageServiceImpl extends ServiceImpl<ProductSwiperImageMapper, ProductSwiperImage> implements IProductSwiperImageService {
}
