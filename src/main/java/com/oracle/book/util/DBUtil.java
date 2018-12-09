package com.oracle.book.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBUtil {
	//设置为私有的属性
private static Properties p;
	//因为属性文件只需要加载一次
	static {
		 p=new Properties();
		              try {
						p.load(DBUtil.class.getResourceAsStream("DB.properties"));
					} catch (IOException e) {
						e.printStackTrace();
					}
		
	}
	
	
	//因为只需要加载一次所以用静态
	static {
		
		try {
			Class.forName(p.getProperty("ClassDriver"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	//加载驱动的方法
	public static Connection getCon() {
		
		try {
		return	DriverManager.getConnection(p.getProperty("url"), p.getProperty("user"), p.getProperty("password"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	
	//关闭流的方法
	public static void closeFll(ResultSet set,Statement st,Connection con) {
		
		if(set!=null) {
			try {
				set.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(st!=null) {
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	//关闭流的方法
		public static void closeFll(Statement st,Connection con) {
			if(st!=null) {
				try {
					st.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
	
	
}
