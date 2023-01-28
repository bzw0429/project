package com.lc.demo.service.impl;

import com.lc.demo.bean.Admin;
import com.lc.demo.mapper.AdminMapper;
import com.lc.demo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin adminLogin(String AdminId, String AdminPass)
    {
        return adminMapper.selectAdminByIdAndPass(AdminId,AdminPass);
    }
}
