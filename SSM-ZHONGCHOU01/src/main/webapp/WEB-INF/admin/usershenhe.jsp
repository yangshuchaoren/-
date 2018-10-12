<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>众筹管理后台</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/dashboard.css" />
<base href="<%=basePath%>">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">众筹管理平台</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">

			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.html">首页</a></li>
				<li><a href="#">欢迎, 张三</a></li>
				<li><a href="#" title="修改个人资料和密码的页面">设置</a></li>
				<li><a href="#" title="退出登录">退出</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="index.html">首页</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li class="active"><a href="products.html">所有项目*</a></li>
					<li><a href="#">项目审核</a></li>
					<li><a href="#">项目跟踪</a></li>
					<li><a href="#">项目评论</a></li>
					<li><a href="/classify/all_classity.html">项目分类*</a></li>
					<li><a href="#">项目推荐</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="">注册用户</a></li>
					<li><a href="">用户资金</a></li>
					<li><a href="">用户日志</a></li>
					<li><a href="">实名审核</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="">新闻管理</a></li>
					<li><a href="">问题管理</a></li>
					<li><a href="">管理用户</a></li>
					<li><a href="">管理日志</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">XXX项目</h1>
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a
						href="product-info1.html">基本信息</a></li>
					<!-- 项目信息的管理    项目的评论项目进度，项目跟踪  进行事件的绑定 不进行页面的跳转 只进行数据的显示-->
					<li role="presentation"><a href="javascript:void(0)" onclick="xiangmuxinxi()"
						>项目信息</a></li>
					<li role="presentation" onclick="xiangmupinglun()"><a href="javascript:void(0)"
						>项目评论</a></li>
					<li role="presentation" onclick="xiangmujindu()"><a href="javascript:void(0)"
						>项目进度</a></li>
					<li role="presentation" onclick="xiangmugenzong()"><a href="javascript:void(0)"
						>项目跟踪</a></li>
				</ul>
				<div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">申请人信息</h3>
						</div>
						<div class="panel-body" id="d1">
							<p>以下内容仅做示例</p>
							<table class="table table-bordered">
								<tr>
									<td>编号</td>
									<td>申请人姓名</td>
									<td>申请人联系方式</td>
									<td>申请人身份证号</td>
									<td>申请人身份证正面</td>
									<td>申请人身份证反面</td>
									<td>申请状态</td>
								</tr>
								<c:forEach items="${tongguo}" var="user" varStatus="a">
									<tr>
										<td>${a.count }</td>
										<td>${user.name }</td>
										<td>${user.telnumber }</td>
										<td>${user.idnumber }</td>
										<td><img alt="" src="upload/user/${user.idimage }"></td>
										<td><img alt="" src="upload/user/${user.idimageback }"></td>
										<td><c:choose>
												<c:when test="${user.state=='1'}">
													<li class="active"><a href="javascript:void();"
														title="首页">审核通过</a></li>
												</c:when>
												<c:otherwise>
													<li class="active"><a href="changetong/${user.id}"
														title="审核">审核</a></li>
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<div class="panel panel-default" id="d2">
						<div class="panel-heading">
							<h3 class="panel-title">项目信息</h3>
						</div>
						<div class="panel-body">
							<p>以下内容仅做示例</p>
							<table class="table table-bordered">
								<tr>
									<td>项目编号</td>
									<td>项目目的</td>
									<td>项目类型</td>
									<td>项目金额</td>
									<td>项目地点</td>
									<td>项目天数</td>
									<td>项目图片</td>
									<td>审核状态</td>
								</tr>
								<c:forEach items="${projectlist }" var="project" varStatus="a">
									<tr>
										<td>${a.count }</td>
										<td>${project.aim }</td>
										<td>${project.type }</td>
										<td>${project.money }</td>
										<td>${project.province },${project.city }</td>
										<td>${project.day }</td>
										<td><img alt="" src="upload/project/${project.fileid }"></td>
										<td><c:choose>
												<c:when test="${project.state=='1'}">
													<li class="active"><a href="javascript:void();"
														title="首页">审核通过</a></li>
												</c:when>
												<c:otherwise>
													<li class="active"><a href="prochange/${project.id}"
													title="审核">审核</a></li>
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<div id="d3">
					<!-- 数据的动态的显示的区域 -->
					<table id="table" class="table table-bordered" >
					</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery1.12.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/countUp.js"></script>
	<script>
		$(document).ready(function() {
		});
		$("#d1").show();
		$("#d2").show();
		$("#d3").hide();
		//发送ajax请求，动态进行表格的显示
       function xiangmuxinxi() {
			$("#d1").hide();
			$("#d2").hide();
			$("#d3").show();
				   $.ajax({
						type : 'POST',
						url : 'all',
						async : true,
						data : {
						},
						dataType : 'json',
						success : function(data) {
							var str = "";
							str+="<tr>";
							str+="<td>"+"项目名称"+"</td>";
							str+="<td>"+"项目地点"+"</td>";
							str+="<td>"+"项目位置"+"</td>";
							str+="<td>"+"项目目标"+"</td>";
							str+="<td>"+"项目背景"+"</td>";
							str+="<td>"+"项目有关图片"+"</td>";
							str+="</tr>";
							var datas = eval(data);
							for(var s=0;s<datas.length;s++){
								var project=datas[s];
								str+="<tr>";
								str+="<td>"+project.name+"</td>";
								str+="<td>"+project.province+"</td>";
								str+="<td>"+project.city+"</td>";
								str+="<td>"+project.aim+"</td>";
								
							
				
								 
								str+="<td>"+project.title+"</td>";
								str+="<td><img src=\"upload\/project\/"+project.fileid+"\"></td>";
								str+="</tr>";
							}
							//将数据添加到表格中
							$("#table").html(str);
						},
						error : function(msg) {
						}
					});
			   }
		
		
       function xiangmupinglun() {
			$("#d1").hide();
			$("#d2").hide();
			$("#d3").show();
				   $.ajax({
						type : 'POST',
						url : 'allpinglun',
						async : true,
						data : {
						},
						dataType : 'json',
						success : function(data) {
							var str = "";
							str+="<tr>";
							str+="<td>"+"项目金额"+"</td>";
							str+="<td>"+"项目评论人姓名"+"</td>";
							str+="<td>"+"项目目标"+"</td>";
							str+="<td>"+"项目图片"+"</td>";
							str+="<td>"+"项目评论内容"+"</td>";
							str+="</tr>";
							var datas = eval(data);
							for(var s=0;s<datas.length;s++){
								var pinglun=datas[s];
								str+="<tr>";
								str+="<td>"+pinglun.project.money+"</td>";
								str+="<td>"+pinglun.user.name+"</td>";
								str+="<td>"+pinglun.project.aim+"</td>";
								str+="<td><img src=\"upload\/project\/"+pinglun.project.fileid+"\"></td>";
								str+="<td>"+pinglun.content+"</td>";
								str+="</tr>";
							}
							//将数据添加到表格中
							$("#table").html(str);
						},
						error : function(msg) {
						}
					});
			   }
       function xiangmujindu() {
			$("#d1").hide();
			$("#d2").hide();
			$("#d3").show();
			$.ajax({
				type : 'POST',
				url : 'all',
				async : true,
				data : {
				},
				dataType : 'json',
				success : function(data) {
					var str = "";
					str+="<tr>";
					str+="<td>"+"项目名称"+"</td>";
					str+="<td>"+"项目地点"+"</td>";
					str+="<td>"+"项目位置"+"</td>";
					str+="<td>"+"项目目标"+"</td>";
					str+="<td>"+"项目背景"+"</td>";
					str+="<td>"+"项目审核状态"+"</td>";
					str+="<td>"+"项目有关图片"+"</td>";
					str+="</tr>";
					var datas = eval(data);
					for(var s=0;s<datas.length;s++){
						var project=datas[s];
						str+="<tr>";
						str+="<td>"+project.name+"</td>";
						str+="<td>"+project.province+"</td>";
						str+="<td>"+project.city+"</td>";
						str+="<td>"+project.aim+"</td>";
						str+="<td>"+project.title+"</td>";
						str+="<td>"+project.state+"</td>";
						str+="<td><img src=\"upload\/project\/"+project.fileid+"\"></td>";
						str+="</tr>";
					}
					//将数据添加到表格中
					$("#table").html(str);
				},
				error : function(msg) {
				}
			});
			   }
	</script>
</body>
</body>
</html>