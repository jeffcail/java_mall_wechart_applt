package com.jeffcail.javamall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.List;

/**
 * @ClassName SmallType
 * @Description TODO
 * @Author cc
 * @Date 2023/6/7 9:49 下午
 * @Version 1.0
 */
@TableName("t_smalltype")
@Data
public class SmallType {

    private Integer id;

    private String name;

    private String remark;

    private Integer bigTypeId;

    @TableField(select = false)
    private BigType bigType;

    @TableField(select = false)
    private List<Product> productList;

}
