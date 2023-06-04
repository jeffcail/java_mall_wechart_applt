package com.jeffcail.javamall.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.jeffcail.javamall.config.CustomDateTimeSerialize;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @ClassName 产品表实体
 * @Description TODO
 * @Author cc
 * @Date 2023/6/4 9:30 下午
 * @Version 1.0
 */
@TableName("t_product")
@Data
public class Product {

    private Integer id; // 编号

    private String name; // 名称

    private BigDecimal price; // 价格

    private Integer stock; // 库存

    private String proPic = "default.jpg"; // 商品图片

    private boolean isSwiper = false; // 是否是轮播图片

    private boolean isHot = false; // 是否是热门图片

    private String swiperPic = "default.jpg"; // 善品轮播图

    private Integer swiperSort; // 录播排序

    private  Integer typeId; // 类别

    @JsonSerialize(using = CustomDateTimeSerialize.class)
    private Date hotDateTime; // 设置热门推荐日期时间

    private String productIntroImgs; // 商品介绍图片

    private String productParaImgs;  // 商品规格参数图片

    private String description; // 描述

}
