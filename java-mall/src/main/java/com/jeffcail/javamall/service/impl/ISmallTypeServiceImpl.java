package com.jeffcail.javamall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jeffcail.javamall.entity.SmallType;
import com.jeffcail.javamall.mapper.SmallTypeMapper;
import com.jeffcail.javamall.service.ISmallTypeService;
import org.springframework.stereotype.Service;

/**
 * @ClassName ISmallTypeServiceImpl
 * @Description TODO
 * @Author cc
 * @Date 2023/6/7 9:57 下午
 * @Version 1.0
 */
@Service("smallTypeService")
public class ISmallTypeServiceImpl extends ServiceImpl<SmallTypeMapper, SmallType> implements ISmallTypeService {
}
