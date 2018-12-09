package com.oracle.book.biz.impl;

import java.util.List;

import com.oracle.book.biz.BizTypeAdd;
import com.oracle.book.dao.BizTypeDao;
import com.oracle.book.dao.impl.BizTypeDaoimpl;
import com.oracle.book.model.BigType;

public class BizTypeAddImple implements BizTypeAdd {

	@Override
	public boolean save(String name) {
		
		BizTypeDao bizTypeDao=new BizTypeDaoimpl();
		return bizTypeDao.save(name);
	}

	@Override
	public List<BigType> findAllBigType() {
		BizTypeDao bizTypeDao=new BizTypeDaoimpl();
		return bizTypeDao.findAll();
	}

}
