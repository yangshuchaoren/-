<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%    
String path = request.getContextPath();    
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
%>  
    <meta charset="UTF-8">
    <script type="text/javascript" src="js/jquery-1.42.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <title>Title</title>
    <base href="<%=basePath%>"> 
</head> 
<body>
  <li role="presentation" onclick="chaxuntianqi()"><a href="javascript:void(0)"
	>天气查询</a></li>
  <input  text="" id="i1">  <span id="s1"></span>
  <span id="s2"></span>
  <span id="s3"></span>
  <span id="s4"></span>
  <span id="s5"></span>
<div class="container">
    <form class="login-form" action="type" method="post">
        <h2 class="text-center">登陆管理系统</h2>
        <div class="login-wrap">
            <!-- icon_lock_alt -->
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
                <span class="input-group-addon"><i class="ace-icon fa fa-user"></i></span>
                <input type="text" name="u_name"  id="name" class="form-control" placeholder="用户名" autofocus required>
            </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            <div class="input-group" style="font-size:100px!important;">
                <span class="input-group-addon"><i class="ace-icon fa fa-lock"></i></span>
                <input type="password" name="u_password"  id="password" class="form-control" placeholder="密码" autofocus required>
            </div>
             <p id="errMsg"></p>
            <label class="checkbox" style="margin-left: 20px">
                <input type="checkbox" value="remember-me">记住我
                <span class="pull-right"> <a href="#">忘记密码?</a></span>
            </label>
            <button class="btn btn-primary btn-lg btn-block" onclick="login()" >登陆</button>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">

function chaxuntianqi(){
	$.ajax({
		type : 'POST',
		url : 'weather',
		async : true,
		data : { 
			"city1" : $("#i1").val(),
		},
		dataType : 'json',
		success : function(data) {
				$("#s1").html(data.city);
				$("#s2").html(data.data.wendu);
				$("#s3").html(data.data.quality);
				$("#s4").html(data.data.pm10);
				$("#s5").html(data.data.ganmao);
		},
		error : function(msg) {
			alert("登录失败");
		}
	});
}
function login(){
	//进行ajax的请求的发送
	//发起登录请求 
	$.ajax({
		type : 'POST',
		url : 'adminlogin',
		async : true,
		data : {
			"name" : $("#name").val(),
			"password":$("#password").val()
		},
		dataType : 'json',
		success : function(data) {
			if(data.status == 89){
				//成功，进行页面的跳转   跳转到添加种类的页面
				 window.location.href = 'type';
			}else if(data.status==80)
			{
				//将错误信息进行展示
				$("#errMsg").html(data.msg)
			}
		},
		error : function(msg) {
			alert("登录失败");
		}
	});
}
</script>
</html>