<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link href="css/reg.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/base.css" type="text/css" />
<link rel="stylesheet" href="css/headbott.css" type="text/css" />
<link rel="stylesheet" href="css/index.css" type="text/css" />
<link rel="stylesheet" href="css/ly-list.css" type="text/css" />
<link rel="stylesheet" href="css/reg.css" type="text/css" />
<title></title>
<base href="<%=basePath%>">
</head>
<body> 
	<!--上部导航栏开始-->
	<div id="header">
		<div class="heade-con">
			<div class="logo">
				<a href=""><img src="images/LOGO.png" /></a>
			</div>
			<div class="nav posa">
				<ul>
					 <c:choose>
                <c:when test="${user==null}">
            <li><a class="vcolor" href="index.html">首页</a></li>
                <li><a href="allproject">公益众筹</a></li>
                <li><a href="cop.html">常见问题</a></li>
                <li><a href="ly-list.html">众筹资讯</a></li>
                   </c:when>
             <c:when test="${user.state=='1'}">
            <li><a class="vcolor" href="index.html">首页</a></li>
                <li><a href="allproject">公益众筹</a></li>
                <li><a href="cop.html">常见问题</a></li>
                <li><a href="ly-list.html">众筹资讯</a></li>
                <li><a href="foraddproject" style="">发布项目</a></li>
                <li><a href="project1" style="">参与</a></li>
                   </c:when>
                 <c:otherwise>
                <li><a class="vcolor" href="index.html">首页</a></li>
                <li><a href="allproject">公益众筹</a></li>
                <li><a href="cop.html">常见问题</a></li>
                <li><a href="ly-list.html">众筹资讯</a></li>
                <li><a href="project1" style="">参与</a></li>
             </c:otherwise>
       </c:choose>
				</ul>
			</div>
			<div class="search">
				<form action="">
					<input type="text" class="search-txt" value="" placeholder="找项目">
					<input type="submit" class="search-but" value="">
				</form>
			</div>
			<div class="index-login">
				<a href="login.html">登录</a> <span style="color: white;">|</span> <a
					href="reg.html">注册</a>
			</div>
		</div>
	</div>
	<!--上不导航栏结束-->
	<!--中间核心-->
	<div class="product">
		<!--头上表格-->
		<div class="product-table">
			<div class="product-left">
				<table class="table table-bordered">
					<tr class="text-center">
						<td class="active title-td"><p onclick="seed1()">
								基本信息</a></td>
						<td class="title-td"><p onclick="seed2()">
								项目信息</a></td>
						<td class="title-td"><p onclick="seed3()">
								详细描述</a></td>
						<td class="title-td"><p onclick="seed4()">
								回报设置</a></td>
					</tr>
				</table>
			</div>
			<div class="product-right">
				<table class="table table-bordered">
					<tr class="text-center">
						<td class="title-td" onclick="seed5()">预览</td>
					</tr>
				</table>
			</div>
		</div>
		<!--下部form表单-->
		<form action="addproject" enctype="multipart/form-data" method="post">
			<div class="product-form" id="d1">
				<!--上标题-->
				<div class="product-title">
					<div class="my-h4">
						<h4>选择你的身份类型</h4>
					</div>
					<div class="btn-save">
						<button class="btn btn-default" id="bu1">保存草稿</button>
					</div>
				</div>
				<div class="clear"></div>
				<hr>
				<!--选择机构个人-->
				<div class="choose">
					<table class="table table-bordered">
						<tr class="text-center">
							<td class="choose-td" style="background: #00aced">个人</td>
						</tr>
					</table>
				</div>
				<!--表单-->
				<!-- 图片数据的提交 -->
				<div class="my-form text-center">
					<div class="product-input">
						<input class="text" name="name" type="text"
							placeholder="请输入中文姓名，2-20个字符" value="${user.name }" readonly="readonly">
					</div>
					<div class="product-input">
						<input class="text" name="idnumebr" type="text"
							placeholder="二代身份证，请输入数字或字母" value="${user.idnumber}" readonly="readonly">
					</div>
					<div class="product-input">
						<input class="text" name="telnumber" type="text"
							placeholder="请输入手机号码" value="${user.telnumber}" readonly="readonly">
					</div>
					<div class="product-input">
						<input class="text" name="servicename" type="text"
							placeholder="客服联系人">
					</div>
					<div class="product-input">
						<input class="text" name="servicetel" type="text"
							placeholder="客服咨询电话">
					</div>
				</div>
				<div class="product-select">
					<div class="product-select1">
						<select class="select1" name="province">
							<option>请选择</option>
							<option value="河南省">河南省</option>
						</select>
					</div>
					<div class="product-select2">
						<select class="select2" name="city">
							<option>请选择</option>
							<option value="郑州市">郑州市</option>
							<option value="开封市">开封市</option>
						</select>
					</div>
				</div>
				<div class="product-select">
					<div class="select-type">
						<select class="select-cla" name="type">
							<option value="公益">公益</option>
							<option value="农业">农业</option>
							<option value="娱乐">娱乐</option>
							<option value="其他">其他</option>
						</select>
					</div>
				</div>
				<input type="submit" value="保存草稿">
			</div>
			<div class="product-form" id="d2">
				<!--上标题-->
				<div class="product-title">
					<div class="my-h4">
						<h4>创建你的项目信息</h4>
					</div>
					<div class="btn-save">
						<button class="btn btn-default">保存草稿</button>
					</div>
				</div>
				<div class="clear"></div>
				<hr>
				<!--表单-->
				<div class="my-form">
					<div class="product-info-input">
						<b>设置封面：</b> <input type="file" name="jack">
					</div>
					<div class="product-info-input">
						<b>项目标题：</b><input name="title" class="text" type="text"
							placeholder="给自己的项目起个漂亮的名字吧">
					</div>
					<div class="product-info-input">
						<b>筹款目的：</b>
						<div name="aim" class="text-area">
							<textarea rows="2" placeholder="一句话介绍一下你的项目吧"></textarea>
						</div>
					</div>
					<div class="product-info-select">
						<div class="product-info-text">
							<b>项目地点：</b>
						</div>
						<div class="product-info-select1">
							<select class="info-select1">
								<option>请选择</option>
								<option>河南</option>
								<option>焦作</option>
								<option>河南</option>
							</select>
						</div>
						<div class="product-info-select2">
							<select class="info-select2">
								<option>请选择</option>
								<option>焦作</option>
								<option>河南</option>
								<option>焦作</option>
							</select>
						</div>
					</div>
					<div class="product-info-input">
						<b>筹资金额：</b><input name="money" class="text" type="text"
							placeholder="输入你需要的金额，最少500元">元
					</div>
					<div class="product-info-input">
						<b>筹资天数：</b><input name="day" class="text" type="text"
							placeholder="">天
					</div>
				</div>
				<input type="submit" value="保存草稿">
			</div>
			<div class="product-form" id="d3">
				<!--上标题-->
				<div class="product-title">
					<div class="my-h4">
						<h4>描述你的项目详情</h4>
					</div>
					<div class="btn-save">
						<button class="btn btn-default">保存草稿</button>
					</div>
				</div>
				<div class="clear"></div>
				<hr>
				<!--表单-->
				<!--进行视频的上传-->
				<div>
					<div class="detail">
						<b>宣传视频：</b><input type="file" name="tom" class="detail-input"
						placeholder="填写视频在线播放地址">
					</div>
				</div>
				<div class="clear"></div>
				<hr>
				<!--编辑信息表单-->
				<div class="my-form">
					<div class="detail">
						<b>项目故事：</b>
						<div>
							<textarea name="story" rows="2" placeholder="一句话介绍一下你的项目吧"></textarea>
						</div>
					</div>
					<div class="detail">
						<b>更多支持：</b>
						<div>
							<textarea name="support" rows="2" placeholder="一句话介绍一下你的项目吧"></textarea>
						</div>
					</div>
					<div class="detail">
						<b>提供回报：</b>
						<div>
							<textarea name="returning" rows="2" placeholder="一句话介绍一下你的项目吧"></textarea>
						</div>
					</div>
					<div class="detail">
						<b>关于我：</b>
						<div>
							<textarea name="aboutus" rows="2" placeholder="一句话介绍一下你的项目吧"></textarea>
						</div>
					</div>
				</div>
				<input type="submit" value="保存草稿">
			</div>
			
			<div class="product-form" id="d4">
				<!--上标题-->
				<div class="product-title">
					<div class="my-h4">
						<h4>设置你的回报信息</h4>
					</div>
					<div class="btn-save">
						<button class="btn btn-default">保存草稿</button>
					</div>
				</div>
				<div class="clear"></div>
				<hr>
				<!--描述项目-->
				<div class="product-title">
					<div class="my-h4">
						<h4>
							<b>回报1</b>
						</h4>
					</div>
				</div>
				<div class="clear"></div>
				<hr>
				<!--编辑信息表单-->
				<div class="my-form">
					<div class="back">
						<b>回报类型：</b> <label class="radio-inline"> <!--  <input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="option1" checked>-->
							<b>实物回报(回报需邮寄)</b>
						</label> <label class="radio-inline"> 
						<!--  <input type="radio id="optionsRadios4" value="option2" >-->
							<b>虚拟回报(回报无需邮寄)</b>
						</label>
					</div>
					<div class="back">
						<b>支持金额：</b><input class="input-mon" name="supportmoney"
							placeholder="输入需要用户支持的金额">元
					</div>
					<div class="back">
						<b>具体规则：</b>每 <input class="input-per" name="zhichizhe"
							placeholder="此项必填"> 支持者抽出1名中奖者
					</div>
					<div class="back">-
						<b>回报内容：</b>
						<div>
							<textarea rows="2" name="shortname" placeholder="一句话介绍一下你的项目吧"></textarea>
						</div>
					</div>
					<div class="back">
						<b>人数上限：</b><input  name="limitnumber" class="input-num"  placeholder="0">个<small>"0"为不需要名额</small>
					</div>
					<div class="back">
						<b>回报时间：</b><input  name="returntime"  class="input-num"  placeholder="0">天<small>"0"为开奖后立即发送</small>
					</div>
					<div class="clear"></div>
					<hr>
					<div class="text-center">
						<button class="btn btn-primary">删除</button>
						<button class="btn">保存</button>
					</div>
					<br>
				</div>
				<input type="submit" value="保存草稿"> 
		</form>
		<div class="text-center">
			<a href="#">+继续添加新的回报</a>
		</div>
	</div>
	<script type="text/javascript">
		$("#d2").hide();
		$("#d3").hide();
		$("#d4").hide();
		function seed1() {
			$("#d1").show();
			$("#d2").hide();
			$("#d3").hide();
			$("#d4").hide();
		}
		function seed2() {
			$("#d2").show();
			$("#d1").hide();
			$("#d3").hide();
			$("#d4").hide();
		}
		function seed3() {
			$("#d3").show();
			$("#d1").hide();
			$("#d2").hide();
			$("#d4").hide();
		}
		function seed4() {
			$("#d4").show();
			$("#d1").hide();
			$("#d2").hide();
			$("#d3").hide();
}
		
		function seed5(){
			$("#d1").show();
			$("#d2").show();
			$("#d3").show();
			$("#d4").show();
		}
	</script>
	<!--底部开始-->
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