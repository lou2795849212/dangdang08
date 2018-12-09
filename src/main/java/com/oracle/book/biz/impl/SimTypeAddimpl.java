package com.oracle.book.biz.impl;

import java.util.List;

import com.oracle.book.biz.SimTypeAdd;
import com.oracle.book.dao.SmallTypeDao;
import com.oracle.book.dao.impl.SmallTypeDaoJdbcimple;
import com.oracle.book.model.SmallType;

public class SimTypeAddimpl implements SimTypeAdd {


	@Override
	public boolean save(SmallType smallType) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoJdbcimple();
		return smallTypeDao.save(smallType);
	}

	@Override
	public List<SmallType> findAllByBid(int bid) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoJdbcimple();
		return smallTypeDao.findAllByBid(bid);
	}

	@Override
	public int findById(int sid) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoJdbcimple();
		return smallTypeDao.findById(sid);
	}

}
