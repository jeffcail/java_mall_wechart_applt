package com.jeffcail.javamall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jeffcail.javamall.entity.Order;
import com.jeffcail.javamall.mapper.OrderMapper;
import com.jeffcail.javamall.service.IOrderService;
import org.springframework.stereotype.Service;

/**
 * @ClassName IOrderServiceImpl
 * @Description TODO
 * @Author cc
 * @Date 2023/6/9 12:03 上午
 * @Version 1.0
 */
@Service("orderService")
public class IOrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {
}
