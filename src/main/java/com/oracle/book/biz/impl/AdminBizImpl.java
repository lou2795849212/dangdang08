package com.oracle.book.biz.impl;

import com.oracle.book.biz.AdminBiz;
import com.oracle.book.dao.AdminDao;
import com.oracle.book.dao.impl.AdminDaoImpl;
import com.oracle.book.model.Admin;

public class AdminBizImpl implements AdminBiz {
    @Override
    public boolean findByNameAndPwd(Admin admin) {
        AdminDao adminDao=new AdminDaoImpl();
        return adminDao.findByNameAndPwd(admin);
    }
}
