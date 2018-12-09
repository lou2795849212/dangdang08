package com.oracle.book.dao;

import com.oracle.book.model.Admin;

public interface AdminDao {
    boolean findByNameAndPwd(Admin admin);
}
