<%--
	if(session.getAttribute("chenggong")==null||!(Boolean) session.getAttribute("chenggong")){
		response.sendRedirect("login.jsp");
		return;
	}
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>小类名</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootswatch/dist/materia/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="container-fluid" style="width: 80%;">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<form action="smallType" method="post">
								<div class="form-group row">
								<label for="inputBid" class="col-sm-2 col-form-label text-right">大类名</label>
								<div class="col-sm-10">
								       
								   <select name="bid" class="form-control" id="inputBid">
								   
								   
								   </select>
								
								
								
								</div>
							</div>
							
								<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">小类名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="小类名" name="name">
								</div>
							</div>
							
							
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">添加</button>
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
           
        	
       }

	      /*var script=document.createElement("script");
	      script.src="findAllBigType";
	      document.body.appendChild(script);*/
       
            $.ajax({
            	  //切记使用ajaxjquery一定不能使用瘦身版
                  type:"GET",
                 url:"findAllBigType",
                 jsonpCallback:"fillSel",
                 dataType:"jsonp"
                });
      
 

</script>
</body>
</html>