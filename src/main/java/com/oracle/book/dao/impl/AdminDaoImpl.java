package com.oracle.book.dao.impl;

import com.oracle.book.dao.AdminDao;
import com.oracle.book.model.Admin;
import com.oracle.book.model.BigType;
import com.oracle.book.util.DBUtil;
import com.oracle.book.util.MD5Util;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoImpl implements AdminDao {
    @Override
    public boolean findByNameAndPwd(Admin admin) {

        Connection conn=null;
        PreparedStatement st=null;
        ResultSet rs=null;

        try {
            conn= DBUtil.getCon();


           /* st=conn.prepareStatement("select * from t_admin where name=? and pwd=? ");
            st.setString(1,admin.getName());
            try {
                st.setString(2, MD5Util.getEncryptedPwd(admin.getPwd()));
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            rs=st.executeQuery();
            if(rs.next()){
                return true;
            }*/
              //先查询名字得到密码里的盐
           String sql=" select pwd from t_admin where name=? ";
           st= conn.prepareStatement(sql);
            st.setString(1,admin.getName());
              rs=st.executeQuery();
              if(rs.next()){
                  //然后在查询到加密的密码盐那一列
                  String dbPwd=rs.getString(1);
                  try {
                      //最后把用户输入的密码和数据库里的密码进行比较
                      return MD5Util.validPasswd(admin.getPwd(),dbPwd);
                  } catch (NoSuchAlgorithmException e) {
                      e.printStackTrace();
                  } catch (UnsupportedEncodingException e) {
                      e.printStackTrace();
                  }
              }


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeFll(rs, st, conn);
        }




        return false;
    }
}
