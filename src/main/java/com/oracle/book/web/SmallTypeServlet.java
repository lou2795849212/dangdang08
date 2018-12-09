package com.oracle.book.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.book.biz.SimTypeAdd;
import com.oracle.book.biz.impl.SimTypeAddimpl;
import com.oracle.book.model.SmallType;
import com.oracle.book.util.MyBeanUtils;

/**
 * Servlet implementation class SmallTypeServlet
 */
@WebServlet(name="smallType",value="/smallType")
public class SmallTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SmallTypeServlet() {
        super();
      
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
		 SmallType smallType=new SmallType();
		 MyBeanUtils.populate(smallType, request.getParameterMap());
		
		  SimTypeAdd simTypeAdd=new SimTypeAddimpl();
		 
		   boolean resut=simTypeAdd.save(smallType);
		   if(resut) {
			   response.sendRedirect("main.jsp");
		   }else {
			   request.setAttribute("simTypeAdd", simTypeAdd);
			   request.getRequestDispatcher("/smallTypeAdd.jsp").forward(request, response);
		   }
		 
	}

}
