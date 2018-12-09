<%--
	if(session.getAttribute("chenggong")==null||!(Boolean) session.getAttribute("chenggong")){
		response.sendRedirect("login.jsp");
		return;
	}
--%>
<%@page import="com.oracle.book.model.Book"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" id="yangshi" />
	<link rel="stylesheet" type="text/css" href="bower_components/fontawesome/web-fonts-with-css/css/fontawesome-all.css">
<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
<script type="text/javascript">
if($.cookie("jilu")){
	$("#yangshi").attr("href","bower_components/bootswatch/dist/"+$.cookie("jilu")+"/bootstrap.css");
  }else{
	 $("#yangshi").attr("href","bower_components/bootswatch/dist/cosmo/bootstrap.css");
      
    }
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="navbar-toggler-icon"></span>
					</button>
					<a class="navbar-brand" href="#">Brand</a>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active"><a class="nav-link" href="#">Link
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
									link</a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
						</ul>
						<form class="form-inline">
							<input class="form-control mr-sm-2" type="text" />
							<button class="btn btn-primary my-2 my-sm-0" type="submit">
								Search</button>
						</form>
						<ul class="navbar-nav ml-md-auto">
							<li class="nav-item active">
							 <a class="nav-link" href="javascript:void(0)"> <!--custom-select意思是控制列表大小  -->
									<select id="zhuti" class="custom-select">
										<option>cosmo</option>
										<option>journal</option>
										<option>lux</option>
										<option>pulse</option>
								</select>
							</a>
						
							</li>
							<li class="nav-item dropdown"><a class="nav-link fa fa-window-close fa-2x" href="exit.jsp" title="退出系统"></a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div class="row" >
			<div class="col-md-12">
			<div class="card-header ">
			<form class="form-inline" action="bookList" method="post" id="biaodan">
  <label class="sr-only" for="inputName">书名</label>
  <input type="text" class="form-control mb-2 mr-sm-2" id="inputName" placeholder="书名" name="name" value="<%=request.getParameter("name")==null?"":request.getParameter("name")%>">

    <label class="sr-only" for="inlineFormInputGroupUsername2">大类</label>
  <div class="input-group mb-2 mr-sm-2">
    <select class="form-control" id="inputBid" name="bid">
    <option value="-1">---请选择--</option>
    </select>
   
  </div>


  <label class="sr-only" for="inlineFormInputGroupUsername2">小类</label>
  <div class="input-group mb-2 mr-sm-2">
    <select class="form-control" id="inputSid" name="sid">
     <option value="-1">---请选择--</option>
     
     
     
    </select>
   
  </div>


  <button type="submit" class="btn btn-primary mb-2">搜索</button>
</form>
			
			</div>
			
			
			   <div class="col-md-12">
			<table class="table table-hover table-sm table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>書名</th>
						<th>價錢</th>
						<th>作者</th>
						<th>出版社</th>
						<th>出版日期</th>
						<th>內容簡介</th>
						<th>小類</th>
						<th>圖片</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				  <%
				     List<Book> ls=(List<Book>)request.getAttribute("ls");
				  for(Book book:ls){
				  %>
					<tr>
						<td><%=book.getId() %></td>
						<td><%=book.getName() %></td>
						<td><%=book.getPrice() %></td>
						<td><%=book.getAuthor() %></td>
						<td><%=book.getCbs() %></td>
						<td><%=book.getCbDate() %></td>
						<td><%=book.getDescri() %></td>
						<td><%=book.getSid() %></td>
						<td>
						  <img src="upload/<%=book.getPhoto()%>">
						</td> 
						<td><a href="#modal-container-506411" onclick="window.delId=<%=book.getId() %>" data-toggle="modal" class="fa fa-trash fa-2x" title="删除"></a>
						    &nbsp;&nbsp;&nbsp;&nbsp;
							<a href="toBookEdit?id=<%=book.getId()%>" class="fa fa-edit fa-2x" title="修改"></a></td>
						
					</tr>
					<%
					} %>
					<tr>
					 </tr>
					
					
				</tbody>
				
			</table>
			<div class="card-footer">
			 <nav class="pagination-lg">
				<ul class="pagination">
				   <%
				   //先获取总页数
					  int totalPage=(Integer)request.getAttribute("totalPage");
					 //获取当前页数
					 int currentPage=(Integer)request.getAttribute("currentPage");
					 if(currentPage==1){
						 %>
						 		<li class="page-item disabled"><a class="page-link" href="#">前一页</a></li>
						 
						 <% 
					 }else{
						 %>
						 <li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage-1%>">前一页</a></li>
						 <% 
					 }
				   %>
				         
					
					<%
					 
					    if(totalPage<=5){ 
					    	for(int i=1;i<=totalPage;i++){
					    	%>
	 <li class="page-item"><a class="page-link" href="bookList?currentPage=<%=i%>"><%=i %></a></li>
					   
					    	<%
					    	}
					    }else if(currentPage<=3){
					    	
					    	%>
					    	
					<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1</a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=2">2</a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=3">3</a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=4">4</a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">...<%=totalPage %></a></li>
					    	
					    	<%
					    	
					    }else if(currentPage<=totalPage-3){ 
					    	%>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage-1%>"><%=currentPage-1%></a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage%>"><%=currentPage%></a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage+1%>"><%=currentPage+1%></a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">...<%=totalPage %></a></li>
					    	
					    	<%
					    }else{
					    	%>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage-3%>"><%=totalPage-3%></a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage-2%>"><%=totalPage-2%></a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage-1%>"><%=totalPage-1%></a></li>
					<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>"><%=totalPage%></a></li>
					    	
					    	<% 
					    }
					%>
					 
					<%
					  if(currentPage==totalPage){
						  %>
						  <li class="page-item disabled"><a class="page-link" href="#">下一页</a></li>
						  <%
					  }else{
						  %>
						  <li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage+1%>">下一页</a></li>
						  <% 
						  
					  }
					%>
					
				</ul>
			</nav>
			
			</div>
		</div>
			
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-12">
				<h2>Heading</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p class ="text-center">
					小赵&copy;
					<a class="btn" href="mailto:123456@qq.com">View details ?</a>
				</p>
			</div>
		</div>
	</div>
<!-- 删除样式 -->

			
			<div class="modal fade" id="modal-container-506411" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								确认删除
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							真的要删除该条记录吗?
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" onclick="exeBookDel(event)">
								确认
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								取消
							</button>
						</div>
					</div>
					
				</div>
				
			</div>

<!-- end -->
	<script type="text/javascript"
		src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
 $(function(){
	 //先找到主题的id,当切换的时候,定义一个函数,带参
	$("#zhuti").change(function (eve) {
     
  //先找到上面样式然后修改href里的样式,因为样式只有名不一样,我们先找到要切换主题的目标,然后找到这个菜单里的主题名,也就是之后       
 $("#yangshi").attr("href","bower_components/bootswatch/dist/"+$(eve.target).val()+"/bootstrap.css");
     $.cookie("jilu",$(eve.target).val(),{ expires: 7 });
	}); 
	$("#zhuti").val($.cookie("jilu"));
	$('a[href="bookList?currentPage=<%=currentPage%>"]').parent("li").addClass("active");



	  $.ajax({
          type:"GET",
         url:"findAllBigType",
         jsonpCallback:"fillSel",
         dataType:"jsonp"
        });


  
  $("#inputBid").change(function(){
	  $.ajax({
		  dataType:"jsonp",
   	       url: "findAllSimallType",
          data:"bid="+$(this).val(),
          jsonpCallback:"fillSmallSel"
	  });

      });
 });




 
 
 function fillSel(types){
     
     for (var i = 0; i < types.length; i++) {
         //找到每个types类型里的name属性和id
		var op=new Option(types[i].name,types[i].id);
		//先找到这个文档的id,然后把上面得到types的属性和id添加到这个文档里面
		document.getElementById("inputBid").appendChild(op);
	}
     $("#inputBid").val('<%=request.getAttribute("bid")%>');
     //因为你不触发该事件,小类不执行
     $("#inputBid").trigger("change");
 }

 
 function fillSmallSel(types){
	   document.getElementById("inputSid").innerHTML='<option value="-1">---请选择--</option>';
     for (var i = 0; i < types.length; i++) {
         //找到每个types类型里的name属性和id
		var op=new Option(types[i].name,types[i].id);
		//先找到这个文档的id,然后把上面得到types的属性和id添加到这个文档里面
		document.getElementById("inputSid").appendChild(op);
	}
     $("#inputSid").val('<%=request.getAttribute("sid")%>');
  	
 }
  //在查询过后搜出来的内容我们点击查看,但是由于缺少表单的里的值,所以先选中这个链接a属性值为page-link,在选中href的属性为bookList?currentPage=""
  //因为这是当用户点击过后才发生的内容所以是点击事件
   $('a[class="page-link"][href^="bookList?currentPage="]').click(function(){
	
	    //首先先找到当前属性的,然后在加上表单的值
	    $(this).attr("href",$(this).attr("href")+"&"+$("#biaodan").serialize());

	   });
   
     function exeBookDel(event){
      window.location.href="bookDel?id="+window.delId;//dage  chongmingle?????????
	 }
 </script>
</body>
</html>