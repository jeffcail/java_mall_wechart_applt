package com.jeffcail.javamall.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @ClassName ProductSwiperImage
 * @Description TODO
 * @Author cc
 * @Date 2023/6/8 12:29 上午
 * @Version 1.0
 */
@TableName("t_product_swiper_image")
@Data
public class ProductSwiperImage {

    private Integer id;

    private String image;

    private Integer sort;

    private Integer productId;

}
