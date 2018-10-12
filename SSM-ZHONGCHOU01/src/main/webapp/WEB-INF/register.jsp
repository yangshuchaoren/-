<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
<script type="text/javascript" src="js/jquery-1.42.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/base.css" rel="stylesheet" type="text/css">
<link href="css/reg.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/headbott.css" type="text/css" />
<link rel="stylesheet" href="css/ace.min.css" type="text/css" />
</head>
<body>
	<div id="header">
		<div class="heade-con">
			<div class="logo">
				<a href=""><img src="images/LOGO.png" /></a>
			</div>
			<div class="nav posa">
				<ul>
					<li><a class="vcolor" href="index.html">首页</a></li>
					<li><a href="gyzc-list.html">公益众筹</a></li>
					<li><a href="cop.html">常见问题</a></li>
					<li><a href="ly-list.html">众筹资讯</a></li>
					<li><a href="new_info.html" style="">发布项目</a></li>
				</ul>
			</div>
			<div class="search">
				<form action="">
					<input type="text" class="search-txt" value="找项目"> <input
						type="submit" class="search-but" value="">
				</form>
			</div>
			<div class="index-login">
				<a href="">登录</a> <a class="index-login1" href="">注册</a>
			</div>
		</div>
	</div>
	<div class="login-container">

		<div class="space-6"></div>

		<div class="position-relative">
			<div id="signup-box" class="signup-box widget-box no-border">
				<div class="widget-body">
					<div class="widget-main">
						<h4 class="header green lighter bigger">
							<i class="ace-icon fa fa-users blue"></i> 用户注册
						</h4>

						<div class="space-6"></div>
						<p>填写信息:</p>
						<form onsubmit="return login()">
							<fieldset>
								<label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <input
										type="text" class="form-control" placeholder="邮箱或手机号码"
										id="telnumber" onblur="seetelnumber(this)" id="telnumber"
										name="telnumber" /> <i class="ace-icon fa fa-envelope"></i>
								</span>
								</label> <label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <input
										type="text" class="form-control" placeholder="用户名"
										 id="name" name="name" /> <i
										class="ace-icon fa fa-user"></i>
								</span>
								</label> <label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <input
										type="password" class="form-control" placeholder="密码"
										 id="password" name="password" /> <i
										class="ace-icon fa fa-lock"></i>
								</span>
								</label> <label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <input
										type="password" class="form-control" placeholder="确认密码"
										onblur="confirm()" id="repassword" name="repassword" /> <i
										class="ace-icon fa fa-retweet"></i>
								</span>
								</label>
								<!--验证码-->
								<label class="block clearfix"> <span> <input
										type="text"  id="yanzheng" class="telnumber" placeholder="验证码" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="btn btn-default" onclick="getyanzheng()">
											<a>点击获取验证码</a>
										</button>
								</span>
								</label> <label class="block"> <input type="checkbox"
									class="ace" /> <span class="lbl"> 接受 <a href="#">用户协议</a>
								</span>
								</label>

								<div class="space-24"></div>

								<div class="clearfix">
									<button type="reset" class="width-30 pull-left btn btn-sm">
										<i class="ace-icon fa fa-refresh"></i> <span
											class="bigger-110">重置</span>
									</button>
									<button type="button"
										class="width-65 pull-right btn btn-sm btn-success">
										<span class="bigger-110">注册</span> <i
											class="ace-icon fa fa-arrow-right icon-on-right" onclick="seetelnumer()"></i>
									</button>
								</div>
							</fieldset>
						</form>
						<!--第三方-->
						<div class="social-or-login center">
							<span class="bigger-110">第三方登录</span>
						</div>
						<div class="space-6"></div>

						<div class="social-login center">
							<a href="#"> <img src="images/weixin.png">
							</a> <a href="#"> <img src="images/qq.png">
							</a> <a href="#"> <img src="images/sina.png">
							</a>
						</div>
					</div>
					<div class="toolbar center">
						<a href="login.html" data-target="#login-box"
							class="back-to-login-link"> <i
							class="ace-icon fa fa-arrow-left"></i> 返回登录
						</a>
					</div>
				</div>
				<!-- /.widget-body -->
			</div>
		</div>
	</div>
	</div>
	<div id="bottom">
		<div class="bottom-ggt">
			<a href=""><img src="images/bottbom_68.jpg" alt="" /></a>
		</div>
		<div class="zc-yqlink">
			<ul>
				<li><a href="">阿里巴巴集团</a></li>
				<li><a href="">淘宝网</a></li>
				<li><a href="">天猫</a></li>
				<li><a href="">聚划算</a></li>
				<li><a href="">全球速卖通</a></li>
				<li><a href="">阿里巴巴国际交易市场</a></li>
				<li><a href="">1688</a></li>
				<li><a href="">阿里妈妈</a></li>
				<li><a href="">阿里旅行</a></li>
				<li><a href="">阿里云计算</a></li>
				<li><a href="">阿里巴巴集团</a></li>
				<li><a href="">淘宝网</a></li>
				<li><a href="">天猫</a></li>
				<li><a href="">聚划算</a></li>
				<li><a href="">全球速卖通</a></li>
				<li><a href="">阿里巴巴国际交易市场</a></li>
				<li><a href="">1688</a></li>
				<li><a href="">阿里妈p妈</a></li>
				<li><a href="">阿里云计算</a></li>
			</ul>
		</div>
		<div class="footer-bd">
			<a href=" ">关于淘宝</a> <a href=" ">合作伙伴</a> <a href=" ">营销中心</a> <a
				href=" ">廉正举报</a> <a href=" ">联系客服</a> <a href=" ">开放平台</a> <a
				href=" ">诚征英才</a> <a href=" ">联系我们</a> <a href=" ">网站地图</a> <a
				href=" ">法律声明</a> <em>© 2003-2015 Taobao.com 版权所有</em><br> <br>
			<span>网络文化经营许可证：<a href=" ">浙网文[2013]0268-027号</a></span> <b>|</b> <span
				data-spm-protocol="i">增值电信业务经营许可证：<a href="">浙B2-20080224-1</a></span>
			<b>|</b> <span>信息网络传播视听节目许可证：1109364号</span> <b>|</b> <span>举报电话:0571-81683755</span>
		</div>
	</div>
	<script type="text/javascript">
function getyanzheng(){
	$.ajax({
		type : 'POST',
		url : 'yanzheng',
		async : true,
		data : {
			"telnumber" : $("#telnumber").val(),
		},
		dataType : 'json',
		success : function(data) {
			alert("已经发送验证码")
		},
		error : function(msg) {
			alert("未能成功发送验证");
		}
	});
}
function login(){
	var telInput = document.getElementById("telnumber")
	//nameInput.value   输入框中输入的内容
	if(telInput.value == null || telInput.value==""){
		//alert("请输入用户名")
		alert("请输入手机号");
		return false
	}
	var nameInput = document.getElementById("name");
	if(nameInput.value==null || nameInput.value==""){
		var span = document.getElementById("pwdMsg");
		alert("请输入验证码");
		return false
	}
	var repwdInput = document.getElementById("repassword");
	var pwdInput = document.getElementById("password");
		if(repwdInput.value==repwdInput.value){
			//进行密码的确认
			alert("请确认密码");
			return false
		}
	var yanInput = document.getElementById("yanzheng");
		if(yanInput.value==null || yanInput.value==""){
			alert("请输入验证码");
			return false
		}
		else{
			return true;
		}
		}
//用户名失去焦点事件
function seetelnumber(input){
	//alert("失去焦点了")
	//input.value  
	var reguler = /^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/;
	if(!reguler.test(input.value)){
		//发送数据到controller中进行数据的判断
		alert("手机号输入不合法");
	}//发送ajax请求将数据传入判断数据
	$.ajax({
		type : 'POST',
		url : 'register',
		async : true,
		data : {
			"telnumber" : $("#telnumber").val(),
			"name" : $("#name").val(),
			"yanzhen" : $("#yanzheng").val(),
		}, 
		dataType : 'json',
		success : function(data) {
			if(data.status == 1){
				//成功，移除模态框
				window.location.href = 'project';
			}else{
				alert(data.msg);
			}
		},
		error : function(msg) {
			alert("登录失败");
		}
	});
}
//获取焦点事件
function nameOnFocus(){
	var span = document.getElementById("nameMsg");
	span.innerHTML = "";
}
</script>
</body>