package com.oracle.book.biz;

import com.oracle.book.model.Admin;

public interface AdminBiz {
    boolean findByNameAndPwd(Admin admin);
}
