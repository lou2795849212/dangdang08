<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.oracle.book.model.Admin" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 1.不让缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 2.css样式 -->
<link href="bower_components/bootswatch/dist/sandstone/bootstrap.css" rel="stylesheet" type="text/css"/>
<!-- 3.日期样式-->
<link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
.custom-file-label::after{content:"浏览"}
</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<div class="card">
  <div class="card-body">
				<form action="login" method="post" id="formId">

				<%--<%  Map<String,String> error= (Map<String, String>) request.getAttribute("error");--%>
				  <%--if(error!=null){--%>
					  <%--Set<String> kesSet=error.keySet();--%>
					  <%--for (String Key:kesSet) {--%>
						  <%--out.print(Key+"--------"+error.get(Key));--%>
					  <%--}--%>
				  <%--}%>--%>



				  <%
					  Map<String,String> error= (Map<String, String>) request.getAttribute("error");
				  Admin user=(Admin) request.getAttribute("admin");
				  if(user!=null){
					  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					  
					  %>
					  <div class="form-group row">
						<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
						<div class="col-sm-10">
							<%  //如果当输入不为空并且错误信息也不为空,那就显示is-invalid,并显示错误信息,否则就是正确的
								if(error!=null&&error.get("name")!=null){

							    %>
							<input type="text" class="form-control is-invalid" id="inputName" placeholder="用户名" name="name" value="<%=user.getName() %>">
							 <div class="invalid-feedback">
								 <%=error.get("name")%>
							 </div>
							<%
							}else{
							  %>
							<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name" value="<%=user.getName() %>">
							    <%
							}

							%>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
						<div class="col-sm-10">
							<%
							if(error!=null&&error.get("pwd")!=null){
							    %>
							<input type="password" class="form-control is-invalid" id="inputPwd" placeholder="密码" name="pwd" <%= user.getPwd()%>>
							<div class="invalid-feedback">
								<%=error.get("pwd")%>
							</div>

							<%
							}else{
							  %>
							<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd" <%= user.getPwd()%>>
							<%
							}

							%>
						</div>
					</div>

					<div class="form-group row">
						<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
						<div class="col-sm-5">
							<%
                             if(error!=null&&error.get("vcode")!=null){
                                 %>
                            <input  class="form-control is-invalid" id="inputVcode" placeholder="验证码" name="vcode">
                            <div class="invalid-feedback">
                                <%=error.get("vcode")%>
                            </div>
                            <%
                             }else{
                              %>
                            <input  class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
                            <%
                             }
                            %>
						</div>
						<div class="col-sm-5">
							<img src="vcode.png" id="imgVcode" title="看不清请换一张">
						</div>
						<div class="valid-feedback">

							<%
								if(request.getAttribute("msg")!=null){
							%>
							<h1>验证码错误</h1>

							<%
								}
							%>
						</div>
					</div>


					<div class="form-group row">
					   <div class="col-sm-2"></div>
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">提交</button>
						</div>
					</div>
			
					  
					<% 
				  }else{
				  
					  %>
					  
					  <div class="form-group row">
						<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputName"
								placeholder="用户名" name="name">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPwd"
								placeholder="密码" name="pwd">
						</div>
					</div>

					<div class="form-group row">
						<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
						<div class="col-sm-5">
							<input  class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
						</div>
						<div class="col-sm-5">
							<img src="vcode.png" id="imgVcode" title="看不清换一张">
						</div>
						<div class="valid-feedback">

							<%
								if(request.getAttribute("msg")!=null){
							%>
							<h1>验证码错误</h1>

							<%
								}
							%>
						</div>
					</div>
				

					<div class="form-group row">
					   <div class="col-sm-2"></div>
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">提交</button>
						</div>
					</div>
					  
					  <% 
				  }
				  
				  %>
				</form>
				 
					
				</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 样式脚本 -->
<script type="text/javascript"src="bower_components/jquery/dist/jquery.slim.js"></script>
<!-- 样式脚本 -->
<script type="text/javascript"src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function () {

		$("#imgVcode").click(function () {
            $(this).attr("src","vcode.png?t="+Math.random());
        });
    });
</script>
<!--用来错误提示-->
<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
<script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#formId").validate({   //有效或无效
                rules:{ //规则的意思
                    // 在这里元素是根据name属性来规定规则           这里错误信息即使你不写也行,因为它有默认值

                    name:{
                        required:true,         //必填
                        maxlength: 255,           //输入的描述最大为150个字
                        minlength:3
                    },
                    pwd:{ //图片提示错误信息,只有英文,要想提示中文,必须得自己写
                        required:true,         //必填
                        maxlength: 255,         //输入的描述最大为150个字
                        minlength:3
                    },
                    vcode:{
                        required:true,         //必填
                        maxlength: 4  ,           //输入的描述最大为150个字
                        minlength:4,

                    }
                },
                messages:{                  //不写错误信息有默认值

                },
                errorElement: "div",      //修改元素,比如把label修改为div
                errorClass:"invalid-feedback", //把错误元素修改为无效的
                validClass:"is-valid",  //把样式设置为有效的
                highlight: function(element, errorClass, validClass) { //当用户输错的时候高亮显示
                    //当用户输错的时候把无效的样式加上,然后把有效的样式去掉
                    $(element).addClass("is-invalid").removeClass(validClass);
                    // $(element.form).find("label[for=" + element.id + "]")
                    //     .addClass(errorClass);
                },
                unhighlight: function(element, errorClass, validClass) {//当用户输对的时候不高亮
                    //当用户输入正确的时候把有效的样式加上,然后把无效的样式去掉
                    $(element).removeClass("is-invalid").addClass(validClass);
                    // $(element.form).find("label[for=" + element.id + "]")
                    //     .removeClass(errorClass);
                },

            });
        });


    </script>


</body>
</html>