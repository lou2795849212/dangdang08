package com.oracle.book.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oracle.book.dao.BookAddDao;
import com.oracle.book.model.Book;
import com.oracle.book.util.PageYeShu;
import com.oracle.book.util.DBUtil;

public class BookAddDaoImpl implements BookAddDao {

	@Override
	public boolean save(Book book) {
		
		Connection con=null;
		PreparedStatement st=null;
		
		
		  try {
			con=DBUtil.getCon();
			String sql="insert into t_book(name,price,author,cbs,cbDate,descri,sid,photo)values(?,?,?,?,?,?,?,?)";
			st=con.prepareStatement(sql);
			st.setString(1, book.getName());
			st.setDouble(2, book.getPrice());
			st.setString(3, book.getAuthor());
			st.setString(4, book.getCbs());
			st.setDate(5, new Date(book.getCbDate().getTime()));
			st.setString(6, book.getDescri());
			st.setInt(7, book.getSid());
			st.setString(8, book.getPhoto());
			int r=st.executeUpdate();
			if(r>0) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeFll(st, con);
		}
		
		
		
		
		
		return false;
	}

	@Override
	public List<Book> findAll(int currentPage,String name,int sid) {
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		/*1.1  啥都不限定
		 *    	if(name==null||name.equals("")&&sid==-1) {
			//啥也不做
		}
		 *    
		 * 2.2  限定name,不限定sid
		 * if(name!=null&&!name.equals("")&&(sid==-1)) {
			sql+="where name like '%"+name+"%' ";
		}
		 * 
		 * 3.3 不限定name,但是限定sid
		 * if(name==null||name.equals("")&&sid!=-1) {
			sql+=" where sid="+sid;
		}
		 * 
		 * 
		 * 
		 * 
		 * 4.4    
		 * 	if(name!=null&&!name.equals("")&&(sid!=-1)) {
						sql+="where name like  '%"+name+"%' and sid="+sid;
					}
		 * */
		
		
	    try {
					conn=DBUtil.getCon();
					st=conn.createStatement();
					//分页,order by id desc
					/*String sql="select * from t_book where 1=1";
					if(name!=null&&!name.equals("")) {
						sql+=" and name like '%"+name+"%' ";
					}
					if(sid!=-1) {
						sql+=" and sid="+sid;
					}*/
					/*sql+=" order by id desc limit "+((currentPage-1)*PageYeShu.PAGE_SIZ+1-1)+","+PageYeShu.PAGE_SIZ;*/
					
					String sql="select * from t_book  where 1=1 ";
					if(name!=null&&!name.equals("")) {
						sql+=" and name like '%"+name+"%'";
					}
					if(sid!=-1) {
						sql+=" and sid="+sid;
					}
					
					
					 sql+=" order by id desc limit "+((currentPage-1)*PageYeShu.PAGE_SIZ+1-1)+","+PageYeShu.PAGE_SIZ;
					
					System.out.println(sql);
					rs=st.executeQuery(sql);
					List<Book> ls=new ArrayList<>();
					while(rs.next()) {
					Book book=new Book();
					   book.setId(rs.getInt("id"));
					   book.setName(rs.getString("name"));
					   book.setPrice(rs.getDouble("price"));
					   book.setAuthor(rs.getString("author"));
					   book.setCbs(rs.getString("cbs"));
					   book.setCbDate(rs.getDate("cbDate"));
					   book.setDescri(rs.getString("descri"));
					   book.setSid(rs.getInt("sid"));
					   book.setPhoto(rs.getString("photo"));
					   ls.add(book);
					}
					return ls;
					
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					DBUtil.closeFll(rs, st, conn);
				}
		return null;
	}

	@Override
	public int total(String name,int sid) {
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		
		
		
	    try {
					conn=DBUtil.getCon();
					st=conn.createStatement();
					//先当前页的位置然后在当前页的索引,在加页数
					String sql="select count(*) from t_book where 1=1";
					if(name!=null&&!name.equals("")) {
						sql+=" and name like  '%"+name+"%' ";
					}
					if(sid!=-1) {
						sql+=" and sid="+sid;
					}
					
					
					rs=st.executeQuery(sql);
					
					if(rs.next()) {
					   return rs.getInt(1);
					}
					
					
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					DBUtil.closeFll(rs, st, conn);
				}

		return 0;
	}

	@Override
	public int del(int id) {
		

		Connection con=null;
		PreparedStatement st=null;
		
		
		  try {
			con=DBUtil.getCon();
			String sql="delete from t_book where id="+id;
			st=con.prepareStatement(sql);
			
			int r=st.executeUpdate();
			if(r>0) {
				return r;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeFll(st, con);
		}
		
		
		
		
		return 0;
	}

	@Override
	public Book find(int id) {

		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;


		try {
			conn=DBUtil.getCon();
			st=conn.createStatement();

			String sql="select * from t_book  where id= "+id;


			System.out.println(sql);
			rs=st.executeQuery(sql);

			if(rs.next()) {
				Book book=new Book();
				book.setId(rs.getInt("id"));
				book.setName(rs.getString("name"));
				book.setPrice(rs.getDouble("price"));
				book.setAuthor(rs.getString("author"));
				book.setCbs(rs.getString("cbs"));
				book.setCbDate(rs.getDate("cbDate"));
				book.setDescri(rs.getString("descri"));
				book.setSid(rs.getInt("sid"));
				book.setPhoto(rs.getString("photo"));
				return book;
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeFll(rs, st, conn);
		}





		return null;
	}

	@Override
	public boolean update(Book book) {



		Connection con=null;
		PreparedStatement st=null;


		try {
			con=DBUtil.getCon();
			if(book.getPhoto()==null){
				String sql="update  t_book set name=?,price=?,author=?,cbs=?,cbDate=?,descri=?,sid=? where id=? ";
				st=con.prepareStatement(sql);
				st.setString(1, book.getName());
				st.setDouble(2, book.getPrice());
				st.setString(3, book.getAuthor());
				st.setString(4, book.getCbs());
				st.setDate(5, new Date(book.getCbDate().getTime()));
				st.setString(6, book.getDescri());
				st.setInt(7, book.getSid());
				st.setInt(8,book.getId());
			}else{
				String sql="update  t_book set name=?,price=?,author=?,cbs=?,cbDate=?,descri=?,sid=?,photo=? where id=?";
				st=con.prepareStatement(sql);
				st.setString(1, book.getName());
				st.setDouble(2, book.getPrice());
				st.setString(3, book.getAuthor());
				st.setString(4, book.getCbs());
				st.setDate(5, new Date(book.getCbDate().getTime()));
				st.setString(6, book.getDescri());
				st.setInt(7, book.getSid());
				st.setString(8, book.getPhoto());
				st.setInt(9,book.getId());
			}

			int r=st.executeUpdate();
			if(r>0) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeFll(st, con);
		}











		return false;
	}


}
