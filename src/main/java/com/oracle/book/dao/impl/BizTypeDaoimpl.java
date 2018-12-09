package com.oracle.book.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oracle.book.dao.BizTypeDao;
import com.oracle.book.model.BigType;
import com.oracle.book.util.DBUtil;

public class BizTypeDaoimpl implements BizTypeDao {

	@Override
	public boolean save(String name) {
		Connection con=null;
		PreparedStatement st=null;
		  try {
			con=DBUtil.getCon();
			String sql="insert into t_big_type(name)values(?)";
			st=con.prepareStatement(sql);
			st.setString(1, name);
		int len=st.executeUpdate();
			if(len>0) {
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
	public List<BigType> findAll() {
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		
		    try {
				conn=DBUtil.getCon();
				st=conn.createStatement();
				
				rs=st.executeQuery("select * from t_big_type");
				List<BigType> ls=new ArrayList<>();
				while(rs.next()) {
				BigType bigType=new BigType();
				   bigType.setId(rs.getInt("id"));
				   bigType.setName(rs.getString("name"));
				   ls.add(bigType);
				}
				return ls;
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DBUtil.closeFll(rs, st, conn);
			}
		
		
		return null;
	}

}
