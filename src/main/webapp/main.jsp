<%@page import="java.text.SimpleDateFormat"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<!-- 告诉浏览器不要缩放 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" id="yangshi" />
<script type="text/javascript"src="bower_components/jquery/dist/jquery.slim.js"></script>
<script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
<script type="text/javascript">
console.log($.cookie("jilu"))
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
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
									link</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="carousel slide" id="carousel-309920">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-309920"
							class="active"></li>
						<li data-slide-to="1" data-target="#carousel-309920"></li>
						<li data-slide-to="2" data-target="#carousel-309920"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-309920"
						data-slide="prev"><span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-309920"
						data-slide="next"><span class="carousel-control-next-icon"></span>
						<span class="sr-only">Next</span></a>
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


	<script type="text/javascript"
		src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
 $(function(){
     $("#zhuti").val($.coo0.kie("jilu"));
	 //先找到主题的id,当切换的时候,定义一个函数,带参
	$("#zhuti").change(function (eve) {
     
  //先找到上面样式然后修改href里的样式,因为样式只有名不一样,我们先找到要切换主题的目标,然后找到这个菜单里的主题名,也就是之后       
 $("#yangshi").attr("href","bower_components/bootswatch/dist/"+$(eve.target).val()+"/bootstrap.css");
     $.cookie("jilu",$(eve.target).val(),{ expires: 7 });
	}); 

 });

 </script>
</body>
</html>