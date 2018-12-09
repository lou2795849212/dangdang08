package com.oracle.book.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.book.biz.BizTypeAdd;
import com.oracle.book.biz.impl.BizTypeAddImple;

/**
 * Servlet implementation class BigTypeServlet
 */
@WebServlet(name="bigType",value="/bigType")
public class BigTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BigTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//如果当这个登录请求为空或不为真的话
//		if(request.getSession().getAttribute("chenggong")==null||!(Boolean) request.getSession().getAttribute("chenggong")){
//			response.sendRedirect("login.jsp");
//			return;
//		}
				String name=request.getParameter("name");
		  
		BizTypeAdd bizTypeAdd=new BizTypeAddImple();
		boolean  resut=bizTypeAdd.save(name);
		
		if(resut) {
			response.sendRedirect("main.jsp");
		}else {
			request.setAttribute("name", name);
			request.getRequestDispatcher("/bigTypeAdd.jsp").forward(request, response);
		}
	}

}
