package com.jeffcail.javamall.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @ClassName BigType
 * @Description TODO
 * @Author cc
 * @Date 2023/6/7 4:44 下午
 * @Version 1.0
 */
@TableName("t_bigtype")
@Data
public class BigType {

    private Integer id; // 编号

    private String name;

    private String remark;

    private String image;

}
