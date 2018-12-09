package com.oracle.book.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.oracle.book.biz.BizTypeAdd;
import com.oracle.book.biz.impl.BizTypeAddImple;
import com.oracle.book.model.BigType;

/**
 * Servlet implementation class FindAllBigTypeServlet
 */
@WebServlet(name="findAllBigType",value="/findAllBigType")
public class FindAllBigTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FindAllBigTypeServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//如果当这个登录请求为空或不为真的话
//		if(request.getSession().getAttribute("chenggong")==null||!(Boolean) request.getSession().getAttribute("chenggong")){
//			response.sendRedirect("login.jsp");
//			return;
//		}
		 String callBack=request.getParameter("callback");
		
		BizTypeAdd bizTypeAdd=new BizTypeAddImple();
		List<BigType> ls=bizTypeAdd.findAllBigType();
		
		//告诉客户端发送的是js
		response.setContentType("text/javascript;charset=utf-8");
		//发出去用流
		PrintWriter out=response.getWriter();
		JSONArray jsonArray=new JSONArray(ls);
		//服务器返回的js调用客户端的某个函数,用JSON格式填充 
		 //又称jsonp
		out.println(callBack+"("+jsonArray.toString()+")");
		out.flush();
	}


}
