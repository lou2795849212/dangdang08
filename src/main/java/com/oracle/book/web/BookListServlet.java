package com.oracle.book.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.book.biz.BookBiz;
import com.oracle.book.biz.impl.BookBizImpl;
import com.oracle.book.model.Book;
import com.oracle.book.util.PageYeShu;

@WebServlet(name="bookList",value="/bookList")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BookListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    //如果当这个登录请求为空或不为真的话
//    	 if(request.getSession().getAttribute("chenggong")==null||!(Boolean) request.getSession().getAttribute("chenggong")){
//    	 	response.sendRedirect("login.jsp");
//    	 	return;
//		 }


		 String strcurrentPage=request.getParameter("currentPage");
		  if(strcurrentPage==null) {  //因为你没有说看第几页,默认看第一页
			  strcurrentPage="1";
		  }
		
		int currentPage=Integer.parseInt(strcurrentPage);
		  
		String name=request.getParameter("name");
		String strsid=request.getParameter("sid")==null?"-1":request.getParameter("sid"); 
		int sid=Integer.parseInt(strsid);
	 
		String strbid=request.getParameter("bid")==null?"-1":request.getParameter("bid"); 
		int bid=Integer.parseInt(strbid);
		
		  
		 BookBiz bookBiz=new BookBizImpl();
		 List<Book> ls=bookBiz.findAll(currentPage,name,sid);
		 int totalRow=bookBiz.totalRow(name,sid);//得到行
		   //如果当这行余列等等零,那就证明正好除进,不然在没有除进的情况下加一
		 int totalPage=totalRow%PageYeShu.PAGE_SIZ==0?totalRow/PageYeShu.PAGE_SIZ:totalRow/PageYeShu.PAGE_SIZ+1;
		 
		 request.setAttribute("ls", ls);
		 request.setAttribute("currentPage", currentPage);
		 request.setAttribute("bid", bid);
		 request.setAttribute("sid", sid);
		 request.setAttribute("name", name);
		 request.setAttribute("totalPage", totalPage);
		 request.getRequestDispatcher("ListBook.jsp").forward(request, response);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
	}

}
