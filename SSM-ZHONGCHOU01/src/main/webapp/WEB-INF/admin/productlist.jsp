<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
					<li><a href="classify/all_classity.html">项目分类*</a></li>
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
				<h1 class="page-header">所有众筹项目</h1>

				<div class="panel panel-default">
					<div class="panel-body">
						<form class="form-inline">
							<div class="form-group">
								<input type="text" class="form-control" id="exampleInputName2"
									placeholder="项目名称">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="exampleInputName3"
									placeholder="项目发起人">
							</div>
							<div class="form-group">
								<select class=form-control id="state" name="state">
									<option>项目状态</option>
									<option>众筹中</option>
									<option>众筹失败</option>
									<option>众筹成功</option>
								</select>
							</div>
							<div class="form-group">
								<select class=form-control id="type" name="type">
									<option>项目类型</option>
									<option>教育助学</option>
									<option>爱心环保</option>
									<option>扶贫助困</option>
									<option>公益创业</option>
									<option>公益活动</option>
								</select>
							</div>
							&nbsp;&nbsp;
							<button type="submit" class="btn btn-default btn-primary"
								onclick="chaxun()">查询</button>
						</form>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">所有项目列表</div>
					</div>
					<div class="panel-body">

						<div class="table-responsive ">
							<table class="table table-striped table-bordered" id="table">
								<tr>
								    <td>项目编号</td>
									<td>项目名称</td>
									<td>项目地点</td>
									<td>项目地点</td>
									<td>项目目的</td>
									<td>项目图片</td>
								</tr>
								<c:forEach items="${projectlist}" var="project" varStatus="a">
								<tr>
								<td>${a.count }</td>
								<td>${project.name }</td>
								<td>${project.city }</td>
								<td>${project.province }</td>
								<td>${project.aim }</td>
								<td><img alt="" src="upload/project/${project.fileid }">   </td>
								</tr>
								
								</c:forEach>


							</table>
						</div>
						<nav aria-label="Page navigation" class="text-right">
						<ul class="pagination">
							<li class="disabled"><a href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
						</nav>
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
		//将姓名信息，项目名称，项目状态，项目的类型进行模糊查询
		function chaxun() {
			$.ajax({
						type : 'POST',
						url : 'mohuchazhao',
						async : true,
						data : {
							"type":$("#type").val(),
							"state":$("#state").val(),
							"name":$("#exampleInputName2").val(),
						},
						dataType : 'json',
						success : function(data) {
							var str = "";
							str += "<tr>";
							str += "<td>" + "项目名称" + "</td>";
							str += "<td>" + "项目地点" + "</td>";
							str += "<td>" + "项目位置" + "</td>";
							str += "<td>" + "项目目标" + "</td>";
							str += "<td>" + "项目背景" + "</td>";
							str += "<td>" + "项目有关图片" + "</td>";
							str += "</tr>";
							var datas = eval(data);
							for (var s = 0; s < datas.length; s++) {
								var project = datas[s];
								str += "<tr>";
								str += "<td>" + project.name + "</td>";
								str += "<td>" + project.province + "</td>";
								str += "<td>" + project.city + "</td>";
								str += "<td>" + project.aim + "</td>";
								str += "<td>" + project.title + "</td>";
								str += "<td><img src=\"upload\/project\/"+project.fileid+"\"></td>";
								str += "</tr>";
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
</html>