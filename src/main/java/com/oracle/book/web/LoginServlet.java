package com.oracle.book.web;

import com.oracle.book.biz.AdminBiz;
import com.oracle.book.biz.impl.AdminBizImpl;
import com.oracle.book.model.Admin;
import com.oracle.book.util.MyBeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "LoginServlet",value="/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Admin admin=new Admin();
        MyBeanUtils.populate(admin,request.getParameterMap());
     String vcode=request.getParameter("vcode");
     String validateCode=(String)request.getSession().getAttribute("validateCode");
     //不区分验证码大小写
    /* if(!validateCode.equalsIgnoreCase(vcode)){
         request.setAttribute("msg","验证码错误");
         request.setAttribute("admin",admin);
         request.getRequestDispatcher("/login.jsp").forward(request,response);
         return;
     }
//开始服务器端校验
        //先有验证工厂,在拿验证正确去调用验证默认工厂
        ValidatorFactory factory= Validation.buildDefaultValidatorFactory();
     //验证器   再去调用验证器
        Validator validator=factory.getValidator();
        Set<ConstraintViolation<Admin>> constraintViolations=validator.validate(admin);

        if(constraintViolations.size()>0){
            Map<String,String> error=new HashMap<>();
            for (ConstraintViolation<Admin> cv: constraintViolations) {
                error.put(cv.getPropertyPath().toString(),cv.getMessage());
            }

            request.setAttribute("error",error);
            request.setAttribute("admin",admin);
            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }*/
        Map<String,String> error=new HashMap<>();
        if(!validateCode.equalsIgnoreCase(vcode)){
           error.put("vcode","验证码错误");

        }

        //开始服务器端校验
        //先有验证工厂,在拿验证正确去调用验证默认工厂
        ValidatorFactory factory= Validation.buildDefaultValidatorFactory();
        //验证器   再去调用验证器
        Validator validator=factory.getValidator();
        Set<ConstraintViolation<Admin>> constraintViolations=validator.validate(admin);
        if(constraintViolations.size()>0){
            for (ConstraintViolation<Admin> cv: constraintViolations) {
                error.put(cv.getPropertyPath().toString(),cv.getMessage());
            }
            if(error.size()>0){
                request.setAttribute("error",error);
                request.setAttribute("admin",admin);
                request.getRequestDispatcher("/login.jsp").forward(request,response);
                return;

            }
        }


        AdminBiz adminBiz=new AdminBizImpl();

        boolean r=adminBiz.findByNameAndPwd(admin);

        if(r){
            request.getSession().setAttribute("chenggong",true);
            response.sendRedirect("main.jsp");

        }else{
            request.setAttribute("admin",admin);
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
