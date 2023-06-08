package com.jeffcail.javamall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jeffcail.javamall.entity.WxUserInfo;
import com.jeffcail.javamall.mapper.WxUserInfoMapper;
import com.jeffcail.javamall.service.IWxUserInfoService;
import org.springframework.stereotype.Service;

/**
 * @ClassName IWxUserInfoServiceImpl
 * @Description TODO
 * @Author cc
 * @Date 2023/6/8 2:45 下午
 * @Version 1.0
 */
@Service("wxUserInfoService")
public class IWxUserInfoServiceImpl extends ServiceImpl<WxUserInfoMapper, WxUserInfo> implements IWxUserInfoService {
}
