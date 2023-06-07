package com.jeffcail.javamall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jeffcail.javamall.entity.BigType;
import com.jeffcail.javamall.mapper.BigTypeMapper;
import com.jeffcail.javamall.service.IBigTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName IBigTypeServiceImpl
 * @Description TODO
 * @Author cc
 * @Date 2023/6/7 4:48 下午
 * @Version 1.0
 */
@Service("bigTypeService")
public class IBigTypeServiceImpl extends ServiceImpl<BigTypeMapper, BigType> implements IBigTypeService {

    @Autowired
    private BigTypeMapper bigTypeMapper;

}
