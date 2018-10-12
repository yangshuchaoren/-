<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<base href="<%=basePath%>">
</head>
<body>
<form action="addproject" method="post" enctype="multipart/form-data">
<input type="file" name="tom">

<input type="file" name="jack">


<input type="text" name="name">

<input type="text" name="telnumber">


<input type="submit" value="确认">
 </form>

</body>
</html>