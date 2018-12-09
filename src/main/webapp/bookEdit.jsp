<%--
	if(session.getAttribute("chenggong")==null||!(Boolean) session.getAttribute("chenggong")){
		response.sendRedirect("login.jsp");
		return;
	}
--%>
<%@ page import="com.oracle.book.model.Book" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>书籍添加</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootswatch/dist/materia/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- 3.日期样式-->
<link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
.custom-file-label::after{content:"浏览"}
</style>

</head>
<body>
<div class="container-fluid" style="width: 80%;">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<form action="doBookEdit" method="post" enctype="multipart/form-data">
							<%
								Book book= (Book) request.getAttribute("book");
							%>
							<input type="hidden" name="id" value="<%=book.getId()%>">
								<div class="form-group row">
								<label for="inputBid" class="col-sm-2 col-form-label text-right">大类名</label>
								<div class="col-sm-10">
								       
								   <select name="bid" class="form-control" id="inputBid">
								   <option value="-1">--------请选择---------</option>
								   
								   </select>
								
								
								
								</div>
							</div>
							
								<div class="form-group row">
								<label for="inputSid" class="col-sm-2 col-form-label text-right">小类名</label>
								<div class="col-sm-10">
								       
								   <select name="sid" class="form-control" id="inputSid">
								   
								   
								   </select>
								
								
								
								</div>
							</div>
							
							
								<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">书名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="书名" name="name" value="<%=book.getName()%>">
								</div>
							</div>
							
								<div class="form-group row">
								<label for="inputPrice" class="col-sm-2 col-form-label text-right">價格</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputPrice" placeholder="價格" name="price" value="<%=book.getPrice()%>">
								</div>
							</div>
							
						<div class="form-group row">
						<label for="inputAuthor" class="col-sm-2 col-form-label text-right">作者</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputAuthor"
								placeholder="作者名" name="author" value="<%=book.getAuthor()%>">
						</div>
					</div>
							
							<div class="form-group row">
						<label for="inputCbs" class="col-sm-2 col-form-label text-right">出版社</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputCbs"
								placeholder="出版社" name="cbs" value="<%=book.getCbs()%>">
						</div>
					</div>
							
							<div class="form-group row">
						<label for="inputCbDate" class="col-sm-2 col-form-label text-right">出版日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputCbDate"
								placeholder="出版日期" name="cbDate" value="<%=book.getCbDate()%>">
						</div>
					</div>	
						
							<div class="form-group row">
						<label for="inputDescri" class="col-sm-2 col-form-label text-right">出版描述</label>
						<div class="col-sm-10">
								
					<textarea class="form-control" id="inputDescri" placeholder="出版描述" name="descri" ><%=book.getDescri()%></textarea>
						</div>
					</div>
						
					<div class="form-group row">
						<label for="inputPhoto" class="col-sm-2 col-form-label text-right">書的照片</label>
						<div class="col-sm-10">
						<div class="custom-file">
    <input type="file" class="custom-file-input" id="inputPhoto" aria-describedby="inputGroupFileAddon04" name="photo">
    <label class="custom-file-label" for="inputPhoto">请选择</label>
  </div>
						<img src="upload/<%=book.getPhoto()%>">
						</div>
					</div>
							
							
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">修改</button>
								</div>
							</div>
						 </form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<!-- 日期脚本 -->
<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<!-- 日期设置中文脚本 -->
<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
$('#inputCbDate').datepicker({
    language: 'zh-CN',
    format:'yyyy-mm-dd',
    autoclose:true,
    defaultViewDate:{
              year:new Date().getFullYear()-18
        } 
});
</script>
<script type="text/javascript">
 //现有对象
 var xml=new XMLHttpRequest();
   //开始拨号分两步,一为什么方法的请求,二为方法
   xml.open("GET","findAllBigType");
   //开始拨号
   xml.send();
   //拨号之后等待
 /*  xml.onreadystatechange=function(){
            //判断是否接受到了
       if(xml.readyState==4){  //4的意思是代表接受到了
            //判断是否接受成功
           if(xml.status==200){  //200的意思是代表接受成功
                //让字符串中的JavaScript代码执行
               eval(xml.responseText);
               
               }
           
           }
         

	   }*/
	
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
		   document.getElementById("inputSid").innerHTML="";
           for (var i = 0; i < types.length; i++) {
               //找到每个types类型里的name属性和id
			var op=new Option(types[i].name,types[i].id);
			//先找到这个文档的id,然后把上面得到types的属性和id添加到这个文档里面
			document.getElementById("inputSid").appendChild(op);
		}
           $("#inputSid").val('<%=book.getSid()%>');
        	
       }
       
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
          

</script>
</body>
</html>