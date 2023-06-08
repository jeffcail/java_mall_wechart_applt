package com.jeffcail.javamall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jeffcail.javamall.entity.OrderDetail;
import com.jeffcail.javamall.mapper.OrderDetailMapper;
import com.jeffcail.javamall.service.IOrderDetailService;
import org.springframework.stereotype.Service;

/**
 * @ClassName IOrderDetailServiceImpl
 * @Description TODO
 * @Author cc
 * @Date 2023/6/9 12:07 上午
 * @Version 1.0
 */
@Service("orderDetailService")
public class IOrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements IOrderDetailService {
}
