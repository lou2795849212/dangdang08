package com.oracle.book.web;

import com.oracle.book.biz.BookBiz;
import com.oracle.book.biz.SimTypeAdd;
import com.oracle.book.biz.impl.BookBizImpl;
import com.oracle.book.biz.impl.SimTypeAddimpl;
import com.oracle.book.model.Book;
import com.oracle.book.model.SmallType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ToBookEditServlet",value="/toBookEdit")
public class ToBookEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //如果当这个登录请求为空或不为真的话
//        if(request.getSession().getAttribute("chenggong")==null||!(Boolean) request.getSession().getAttribute("chenggong")){
////            response.sendRedirect("login.jsp");
////            return;
////        }
          String strId=request.getParameter("id");
          int id=Integer.parseInt(strId);

        BookBiz bookBiz=new BookBizImpl();
        Book book=bookBiz.find(id);

        //那小类的id查大类的id
        SimTypeAdd simTypeAdd=new SimTypeAddimpl();
         int bid=simTypeAdd.findById(book.getSid());
              System.out.println(bid);


        request.setAttribute("book",book);
         request.setAttribute("bid",bid);
        request.getRequestDispatcher("/bookEdit.jsp").forward(request,response);
    }
}
