<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%     
String path = request.getContextPath();    
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
%>
<head>
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
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
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
            <li ><a href="index.html">首页</a></li>
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
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="项目名称">
			  </div>
			   <div class="form-group">
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="项目发起人">
			  </div>
			  <div class="form-group">
			   <select class=form-control>
			   	<option>项目状态</option>
			   	<option>众筹中</option>
			   	<option>众筹失败</option>
			   	<option>众筹成功</option>
			   </select>
			  </div>
			   <div class="form-group">
			   <select class=form-control>
			   	<option>项目类型</option>
			   	<option>教育助学</option>
			   	<option>爱心环保</option>
			   	<option>扶贫助困</option>
			   	<option>公益创业</option>
			   	<option>公益活动</option>
			   </select>
			  </div>
			  &nbsp;&nbsp;
			  <button type="submit" class="btn btn-default btn-primary">查询</button>
			</form>
    </div>
   </div>
			<div class="panel panel-default">
  <div class="panel-heading">
    <div class="panel-title">
    	所有项目列表
    </div>
  </div>
  <div class="panel-body">

                <table class="table">
              <tr>
              <td>用户姓名</td>
              <td>用户联系方式</td>
              <td>用户身份证号</td>
              <td>用户头像</td>
              <td>用户状态</td>
              <td>操作</td>
              </tr>
              <c:forEach items="${userlist}" var="user" varStatus="a">
              <tr>
              <td>${user.name }</td>
              <td>${user.telnumber }</td>
              <td>${user.idnumber }</td>
              <td> <img alt="" src="upload/user/${user.image }">  </td>
            
               <td>
   
									<c:choose>
										<c:when test="${user.state=='1'}">
											<li class="active"><a href="javascript:void();"
												title="首页">审核通过</a></li>
										</c:when>	
		
										<c:otherwise>
											<li class="active"><a
												href="javascript:void();"
												title="审核">未审核</a></li>
										</c:otherwise>
									</c:choose>
									</td>
									<td><a href="deletesuer/${user.id}">删除用户</a></td>
               
            
              </tr>
              
             
              </c:forEach>
  
  
  
  
  
</table>
            
  </div>
 

</div>
      
        </div>
      </div>
    </div>
		
		<script type="text/javascript" src="js/jquery1.12.4.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="js/countUp.js" ></script>
		<script>
			$(document).ready(function() {
				
			});
		</script>
	</body>
</html>