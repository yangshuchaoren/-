<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery-1.42.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/base.css" rel="stylesheet" type="text/css">
<link href="css/index2.css" rel="stylesheet" type="text/css">
<link href="css/reg.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/headbott.css" type="text/css" />
<link rel="stylesheet" href="css/ace.min.css" type="text/css" />
</head>
<script>
	window.onload = function() {
		var obtn = document.getElementById('btn'); //登录按钮
		var obox = document.getElementById('box');
		var obg = document.getElementById('bg');
		obtn.onclick = function() {
			obox.style.display = "block";
			obg.style.display = "block";
			// 用这个效果在IE6显示不全，因为body。html。document高度不全，那么就要，html，body{ width：100%； height100%；最只要是height；
			//不满足要求上网找特特效}
		}
}
</script>
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
				<a class="index-login1" href="">登录</a> <a href="see">注册</a><a href="adminlogin">管理员登录</a>
			</div>
		</div>
	</div>
	<script>
		var d_var = $(".search .search-txt").val();
		$(".search .search-txt").focus(function() {
			if ($(this).val() == d_var) {
				$(this).val("");
			}
		});
		$(".search .search-txt").blur(function() {
			if ($(this).val() == "") {
				$(this).val("找项目");
			}
		}); 
		function login() {
			var nameInput = document.getElementById("telnumber")
			//nameInput.value   输入框中输入的内容
			if (nameInput.value == null || nameInput.value == "") {
				//alert("请输入用户名")
				nameInput.value = "手机号不能为空"
				return false
			}
			var pwdInput = document.getElementById("password");
			if (pwdInput.value == null || pwdInput.value == "") {
				pwdInput.value="密码不能为空";
				return false
			}
			else{
				return true;
			}
		}
		function tel(input) {
			//alert("失去焦点了")
			//input.value  
			var reguler = /^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/;
			if (!reguler.test(input.value)) {
				//进行数据的匹配
				input.value = "手机号输入不合法";
			}
		}
		//将数据传入后台进行界面的判断
		function info(){
			//当失去焦点产生后，发送ajax数据传入后天进行判断
			$.ajax({
				type : 'POST',
				url : 'ceshilogin',
				async : true,
				data : {
					"telnumber" : $("#telnumber").val(),
		 			"password"  :$("#password").val(),
				}, 
				dataType : 'json',
				success : function(data) {
					if(data.status == 0){
						//成功，移除模态框
						 window.location.href = 'project';
					}else if(data.status==-1){
						  alert(data.msg);
					}
				},
				error : function(msg) {
					alert("登录失败");
				}
			});
			
		}
		function userlogin(){
			//当失去焦点产生后，发送ajax数据传入后天进行判断
			$.ajax({
				type : 'POST',
				url : 'ceshilogin',
				async : true,
				data : {
					"telnumber" : $("#telnumber").val(),
		 			"password"  :$("#password").val(),
				}, 
				dataType : 'json',
				success : function(data) {
					if(data.status == 4){
						//成功，移除模态框,进行页面的跳转，跳转到首页界面
						 window.location.href = 'project';
					}else if(data.status==5){
						  alert(data.msg);
					}
				},
				error : function(msg) {
					alert("登录失败");
				}
			});
			
		}
		
	</script>
	<div class="login-container">

		<div class="space-6"></div>

		<div class="position-relative">
			<div id="login-box" class="login-box visible widget-box no-border">
				<div class="widget-body">
					<div class="widget-main">
						<h4 class="header blue lighter bigger">
							<i class="ace-icon fa fa-coffee green"></i> 用户登陆
						</h4>

						<div class="space-6"></div>
						<form onsubmit="return login()" action="login">
							<fieldset>
								<label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <i
										class="ace-icon fa fa-user"></i> <input type="text"
										id="telnumber" class="form-control" placeholder="邮箱或手机号码"
										onblur="tel(this)" />
								</span>
								</label> <label class="block clearfix"> <span
									class="block input-icon input-icon-left"> <i
										class="ace-icon fa fa-lock"></i> <input type="password"
										id="password" class="form-control" onblur="info()"
										placeholder="请输入密码" />
								</span>
								</label>
								<div class="space"></div>
								<div class="clearfix">
									<label class="inline"> <input type="checkbox"
										class="ace" /> <span class="lbl"> 记住</span>
									</label>
									<button type="button"  onclick="userlogin()"
										class="width-35 pull-right btn btn-sm btn-primary">
										<i class="ace-icon fa fa-key"></i> <span class="bigger-110">登录</span>
									</button>
								</div>
								<div class="space-4"></div>
							</fieldset>
						</form>
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
					<!-- /.widget-main -->
					<div class="toolbar clearfix">
						<div>
							<a href="#" data-target="#forgot-box"
								class="forgot-password-link"> <i
								class="ace-icon fa fa-arrow-left"></i> 忘记密码
							</a>
						</div>

						<div>
							<a href="see" data-target="#signup-box" class="user-signup-link">
								注册 <i class="ace-icon fa fa-arrow-right"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /.widget-body -->
			</div>
			<!-- /.login-box -->

			<!-- /.position-relative -->
		</div>
	</div>
	<!-- /.col -->
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
				<li><a href="">阿里妈妈</a></li>
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
</body>
</html>


