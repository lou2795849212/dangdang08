package com.oracle.book.dao;

import java.util.List;

import com.oracle.book.model.Book;

public interface BookAddDao {

	boolean save(Book book);

	List<Book> findAll(int currentPage, String name, int sid);

	int total(String name, int sid);

	int del(int id);

    Book find(int id);

    boolean update(Book book);
}
