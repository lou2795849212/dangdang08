package com.oracle.book.biz;

import java.util.List;

import com.oracle.book.model.SmallType;

public interface SimTypeAdd {

	boolean save(SmallType smallType);

	List<SmallType> findAllByBid(int bid);

	int findById(int sid);
}
