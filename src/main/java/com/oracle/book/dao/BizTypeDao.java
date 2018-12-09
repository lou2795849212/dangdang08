package com.oracle.book.dao;

import java.util.List;

import com.oracle.book.model.BigType;

public interface BizTypeDao {

	boolean save(String name);

	List<BigType> findAll();

}
