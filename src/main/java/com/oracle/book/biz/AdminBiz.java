package com.oracle.book.biz;

import com.oracle.book.model.Admin;

public interface AdminBiz {
    /*毒贩夫妇*/
    boolean findByNameAndPwd(Admin admin);
}
