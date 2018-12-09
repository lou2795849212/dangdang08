package com.oracle.book.biz.impl;

import java.util.List;

import com.oracle.book.biz.BookBiz;
import com.oracle.book.dao.BookAddDao;
import com.oracle.book.dao.impl.BookAddDaoImpl;
import com.oracle.book.model.Book;

public class BookBizImpl implements BookBiz {

	@Override
	public boolean save(Book book) {
		BookAddDao bookAddDao=new BookAddDaoImpl();
		
		return bookAddDao.save(book);
	}
	@Override
	public List<Book> findAll(int currentPage,String name,int sid) {
		BookAddDao bookAddDao=new BookAddDaoImpl();
		return bookAddDao.findAll(currentPage,name,sid);
	}
	@Override
	public int totalRow(String name,int sid) {

			BookAddDao bookAddDao=new BookAddDaoImpl();
			return bookAddDao.total(name,sid);
	
	}
	@Override
	public int delById(int id) {
		BookAddDao bookAddDao=new BookAddDaoImpl();
		return bookAddDao.del(id);
	}

	@Override
	public Book find(int id) {
		BookAddDao bookAddDao=new BookAddDaoImpl();
		return bookAddDao.find(id);
	}

	@Override
	public boolean update(Book book) {
		BookAddDao bookAddDao=new BookAddDaoImpl();
		return bookAddDao.update(book);
	}
}
