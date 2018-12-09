package com.oracle.book.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter",urlPatterns = "/*")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request=(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse)resp;
        //因为请求的URI最后为登录页面jsp的话不能栏,不然会一直循环,还有样式也不能栏,最后在登录的时侯也不能栏
       if(request.getRequestURI().endsWith("/login.jsp")||request.getRequestURI().contains("/bower_components/")||request.getRequestURI().endsWith("/login")||request.getRequestURI().endsWith("/vcode.png")){
               chain.doFilter(req,resp);
            return;
        }
        //如果当没有登录,或登录失败重新跳转到登录页面
        if(request.getSession().getAttribute("chenggong")==null||!(Boolean) request.getSession().getAttribute("chenggong")){
            response.sendRedirect("login.jsp");
            return;
        }

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
