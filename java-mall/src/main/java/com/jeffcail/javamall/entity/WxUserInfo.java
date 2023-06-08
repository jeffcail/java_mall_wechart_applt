package com.jeffcail.javamall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.jeffcail.javamall.config.CustomDateTimeSerialize;
import lombok.Data;

import java.util.Date;

/**
 * @ClassName WxUserInfo
 * @Description TODO
 * @Author cc
 * @Date 2023/6/8 2:39 下午
 * @Version 1.0
 */
@TableName("t_product_swiper_image")
@Data
public class WxUserInfo {

    private Integer id;

    private String openid;

    private String nickName;

    private String avatarUrl;

    @JsonSerialize(using = CustomDateTimeSerialize.class)
    private Date registerDate;

    @JsonSerialize(using = CustomDateTimeSerialize.class)
    private Date lastLoginDate;

    @TableField(select = false)
    private String code;

}
