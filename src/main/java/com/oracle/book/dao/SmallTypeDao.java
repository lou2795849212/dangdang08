package com.oracle.book.dao;

import java.util.List;

import com.oracle.book.model.SmallType;

public interface SmallTypeDao {

	boolean save(SmallType smallType);

	List<SmallType> findAllByBid(int bid);

    int findById(int sid);
}
