package com.oracle.book.web;

import com.oracle.book.biz.BookBiz;
import com.oracle.book.biz.impl.BookBizImpl;
import com.oracle.book.model.Book;
import com.oracle.book.util.MyBeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "doBookEdit",value="/doBookEdit")
@MultipartConfig
public class DoBookEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //如果当这个登录请求为空或不为真的话
//        if(request.getSession().getAttribute("chenggong")==null||!(Boolean) request.getSession().getAttribute("chenggong")){
//            response.sendRedirect("login.jsp");
//            return;
//        }
        Book book=new Book();

        //创建一个user对象

        //把用Map得到的参数设置日期格式 然后放入user对象里面
        MyBeanUtils.populate(book, request.getParameterMap(), "yyyy-MM-dd");

        String newFile=null;
        Part part=request.getPart("photo");
        if (part.getHeader("Content-Disposition").contains("; filename=")) {
            // 如果包含的话就是个文本文件开始写

            if(part.getSubmittedFileName()!=null&&!part.getSubmittedFileName().equals("")) {

                //从这个请求头里面截取最后一个点因为包含它自己所以加一
                String   ext=part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".")+1);
                //因为这个UUID.randomUUID()是随机的所以不会重复
                newFile=UUID.randomUUID()+"."+ext;
                part.write(request.getServletContext().getRealPath("/upload/"+newFile));
            }

        }
        //把得到的头像文件放进去
        book.setPhoto(newFile);

        BookBiz bookBiz=new BookBizImpl();
        boolean b=bookBiz.update(book);
        if(b) {
            response.sendRedirect("bookList");
        }else {
            request.setAttribute("book", book);
            request.getRequestDispatcher("/bookEdit.jsp").forward(request, response);
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }


}
