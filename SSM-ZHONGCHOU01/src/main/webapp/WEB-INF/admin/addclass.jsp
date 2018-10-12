<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%     
String path = request.getContextPath();    
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
%> 
    <meta charset="UTF-8">
    <title>添加项目分类</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/dashboard.css" />
 <base href="<%=basePath%>"> 
</head>
<body>
<!--上部导航栏start-->
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
                <li><a href="#">欢迎,${admin.name}</a></li>
                <li><a href="#" title="修改个人资料和密码的页面">设置</a></li>
                <li><a href="#" title="退出登录">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--上部导航栏end-->
<div class="container-fluid">
    <div class="row">
        <!--左侧导航栏start-->
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li ><a href="index.html">首页</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="adminproject">所有项目*</a></li>
                <li><a href="#">项目审核</a></li>
                <li><a href="#">项目跟踪</a></li>
                <li><a href="#">项目评论</a></li>
                <li class="active"><a href="#">项目分类*</a></li>
                <li><a href="#">项目推荐</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">注册用户</a></li>
                <li><a href="">用户资金</a></li>
                <li><a href="">用户日志</a></li>
                <li><a href="tongguo">实名审核</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">新闻管理</a></li>
                <li><a href="">问题管理</a></li>
                <li><a href="adminmanager">管理用户</a></li>
                <li><a href="">管理日志</a></li>
            </ul>
        </div>
        <!--左侧导航栏end-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">添加项目分类</h1>
            <div class="panel panel-default">
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-title">
                        添加项目
                    </div>
                </div>
                <!-- 进行所有种类的遍历 -->
                <table class="table table-hover">
                <tr>
                <td>种类编号</td>
                <td>种类</td>
                <td>种类描述</td>
                </tr>
                <!-- 进行所有的项目的展示 -->
               <c:forEach items="${typelist}" var="type" varStatus="a">
               <tr>
               <td>${a.count}</td>
               <td>${type.type}</td>
               <td>${type.description}</td>
               </tr>
               </c:forEach>
</table>
                <div class="panel-body">
                    <div class="table-responsive ">
                    <!-- 将项目的种类进行添加 -->
                        <form action="addtype">
                            <div class="form-group">
                                <input type="text" class="form-control" id="type_name" placeholder="分类名称" name="type">
                            </div>
                            <div class="form-group">
                               <textarea class="form-control" rows="3" placeholder="分类描述" name="description"></textarea>
                            </div>
                            &nbsp;&nbsp;
                            <button type="submit" class="btn btn-default btn-primary pull-right">添加</button>
                        </form>
                    </div>
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