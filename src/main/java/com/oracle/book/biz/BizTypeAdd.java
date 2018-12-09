package com.oracle.book.biz;

import java.util.List;

import com.oracle.book.model.BigType;

public interface BizTypeAdd {

	boolean save(String name);

	List<BigType> findAllBigType();
   
}
