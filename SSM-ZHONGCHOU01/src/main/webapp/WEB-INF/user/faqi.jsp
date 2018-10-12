<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<%    
String path = request.getContextPath();    
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
%>  
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="js/jquery-1.42.min.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" href="css/headbott.css" type="text/css"/>
    <base href="<%=basePath%>">   
</head>
<style>
    *{margin: 0;padding:0;}
    body{margin:0px;padding:0px;font-size:12px;font-family: "微软雅黑", Arial; text-align:center;color:#000;}
    div,p,h1,h2,h3,h4,h5,h6,ul,li,ol,dl,dt,dd,img,form{margin:0;padding:0;border:0;}
    ul,ol,li{list-style:none;}
    img{border:0; vertical-align:top;}
    a{text-decoration:none; cursor:pointer;color:#5A5A5A}
    a:hover{text-decoration:underline;}
    table,td,tr,th,input,select{font-size:13px;}
    input{font-family:Arial;} /*text and password width*/
    table,td{ border-collapse:collapse;}
    a:link{text-decoration:none;border:none;}
    a:hover{ text-decoration:none;border:none;}
    a:active{}
    a{}
    a:hover, a:visited{}
    .clear{ zoom:1;}
    .clear:after{ display:block;clear:both;height:0;content:''}


body{background: #f9f9f9;color:#5A5A5A}
    .user-con{width: 1000px;margin: 20px auto;
        zoom: 1;overflow: auto;}

.user-conl{float: left;width: 175px;border:1px solid #c0c0c0;background: #f9f9f9;border-right: none}
    .user-conl li i{width:19px;height: 20px;position:absolute;left:30px;top:15px;display: inline-block;}
    .user-conl li .i1{background:url("images/Myhome_icom.png") no-repeat 0 0;}
    .user-conl li .i2{background:url("images/Myhome_icom.png") no-repeat 0 -50px;}
    .user-conl li .i3{background:url("images/Myhome_icom.png") no-repeat 0 -100px;}
    .user-conl li .i4{background:url("images/Myhome_icom.png") no-repeat 0 -153px;}
    .user-conl li .i5{background:url("images/Myhome_icom.png") no-repeat 0 -153px;}
    .user-conl li .i6{background:url("images/Myhome_icom.png") no-repeat 0 -50px;}
    .user-conl li .i7{background:url("images/Myhome_icom.png") no-repeat 0 -206px;}
    .user-conl li .i8{background:url("images/Myhome_icom.png") no-repeat 0 -253px;}
    .user-conl li .i9{background:url("images/Myhome_icom.png") no-repeat 0 -323px;}
    .user-conl li .i10{background:url("images/Myhome_icom.png") no-repeat 0 -376px;}
.user-conl li{position: relative}
.user-conl li a{display:inline-block;height:50px;width:175px;line-height:50px;border-left: 2px solid #f9f9f9;border-bottom:1px #ebebeb solid; }
.user-conl li b{display:inline-block;height:50px;width:175px;line-height:50px;border-left: 2px solid #f9f9f9;border-bottom:1px #ebebeb solid; }
.user-conl li a:hover{background:#fff;color:#009fd6;border-bottom:1px solid #009fd6;border-left: 2px solid #009fd6;}
.user-conl li .u-hover{background:#fff;border-left: 2px solid #f9f9f9;border-bottom:1px solid #009fd6;border-left: 2px solid #009fd6;color:#009fd6}
.user-conl li .a-tit{font-size:18px;}
    .user-conl li:hover .i1{background:url("images/Myhome_icom.png") no-repeat -19px 0;}
    .user-conl li:hover .i2{background:url("images/Myhome_icom.png") no-repeat -19px -50px;}
    .user-conl li:hover .i3{background:url("images/Myhome_icom.png") no-repeat -19px -100px;}
    .user-conl li:hover .i4{background:url("images/Myhome_icom.png") no-repeat -19px -153px;}
    .user-conl li:hover .i5{background:url("images/Myhome_icom.png") no-repeat -19px -153px;}
    .user-conl li:hover .i6{background:url("images/Myhome_icom.png") no-repeat -19px -50px;}
    .user-conl li:hover .i7{background:url("images/Myhome_icom.png") no-repeat -19px -206px;}
    .user-conl li:hover .i8{background:url("images/Myhome_icom.png") no-repeat -19px -253px;}
    .user-conl li:hover .i9{background:url("images/Myhome_icom.png") no-repeat -20px -323px;}
    .user-conl li:hover .i10{background:url("images/Myhome_icom.png") no-repeat -20px -376px;}
.user-conr{float: left;width:800px;border-zoom: 1;overflow: auto;background:#fff}

.user-conr_tab li{  cursor: pointer;width:100px; height:35px;line-height:35px;border:1px solid #c0c0c0;float: left;margin-left:10px;border-bottom:none;background:#ccc;}
.user-conr_tab  .cur{background:#fff;}
    .user-conr_tab{width:778px;height:35px;border: 1px solid #c0c0c0;padding:20px 0 0 20px;}
    .user-conr_tab2{width:798px;min-height:556px;overflow: auto;zoom: 1;border: 1px solid #c0c0c0;border-top:none;}
    .user-conr_tab2 li{display: none;padding:20px;}
    .user-conr_tab2 .curq2{display:block;}

</style>
<body>
<div id="header">
    <div class="heade-con">
        <div class="logo"><a href=""><img src="images/LOGO.png"/></a></div>
        <div class="nav posa">
            <ul>
                <li><a class="vcolor" href="index.html">首页</a></li>
                <li><a href="gyzc-list.html">公益众筹</a></li>
                <li><a href="cop.html">常见问题</a></li>
                <li><a href="ly-list.html">众筹资讯</a></li>
                <li><a href="new-product.html" style="">发布项目</a></li>
            </ul>
        </div>
        <div class="search">
            <form action="">
                <input type="text" class="search-txt" value="找项目">
                <input type="submit" class="search-but" value="">
            </form>
        </div>
        <div class="index-login">
            <a  href="login.html">登录</a>
            <a href="user.html">注册</a>
        </div>
    </div>
</div>
<script>

    var d_var=$(".search .search-txt").val();
    $(".search .search-txt").focus(function(){
        if($(this).val()==d_var){
            $(this).val("");
        }});

    $(".search .search-txt").blur(function(){
        if($(this).val()==""){
            $(this).val("找项目");
        }
    });
</script>
<div class="user-con">
    <div class="user-conl">
<ul>
    <li><b class="a-tit" href="">项目管理</b></li>
    <li><i class="i1"></i><a class="u-hover" href="">发起的项目</a></li>
    <li><i class="i2"></i><a href="">参与的项目</a></li>
    <li><i class="i4"></i><a href="">点赞的项目</a></li>
    <li><i class="i6"></i><a href="">资金管理</a></li>
    <li><b class="a-tit" href="">消息管理</b></li>
    <li><i class="i4"></i><a href="">我的评论</a></li>
    <li><i class="i4"></i><a href="">我的私信</a></li>
    <li><b class="a-tit" href="">个人设置</b></li>
    <li><i class="i7"></i><a href="">资料修改</a></li>
    <li><i class="i8"></i><a href="">安全信息</a></li>
    <li><i class="i9"></i><a href="">收件地址管理</a></li>
    <li><i class="i10"></i><a href="">实名认证</a></li>
</ul>
    </div>
    <div class="user-conr">
<div class="user-conr_tab">
    <ul>
        <li class="cur" onclick="all()">所有项目</li>
        <li onclick="join()">发起的项目</li>
    </ul>
</div>
        <div class="user-conr_tab2">
  <table id="table" class="table table-bordered">
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $(".user-conr_tab li").click(function(){
                $(".user-conr_tab li").eq($(this).index()).addClass("cur").siblings().removeClass('cur');
                $(".user-conr_tab2 li").hide().eq($(this).index()).show(); })
            });
        function all(){
     	   $.ajax({
     			type : 'POST',
     			url : 'all',
     			async : true,
     			data : {
     			},
     			dataType : 'json',
     			success : function(data) {
     				var str = "";
     				//将数据在页面的表单中进行显示
     				str+="<tr>";
     				str+="<td>"+"项目名称"+"</td>";
     				str+="<td>"+"项目地点"+"</td>";
     				str+="<td>"+"项目位置"+"</td>";
     				str+="<td>"+"项目目标"+"</td>";
     				str+="<td>"+"项目背景"+"</td>";
     				str+="</tr>";
     				str+="</br>";
     				for(var s=0;s<data.lenth;s++){
     					var project=data[s];
     					str+="<tr>";
     					str+="<td>"+project.name+"</td>";
     					str+="<td>"+project.province+"</td>";
     					str+="<td>"+project.city+"</td>";
     					str+="<td>"+project.aim+"</td>";
     					str+="<td>"+project.title+"</td>";
     					//图片的插入
     					//str+="<td><img src="+"\"upload/project/"+project.fileid+"/></td>";
     					//str+='<img src="'+ IP + capture + '" alt="" />';
     					str+="</tr>";
     				}
     				//将数据添加到表格中
     				$("#table").html(str);
     			},
     			error : function(msg) {
     			}
     		});
        }
        function join(){
     	   $.ajax({
     			type : 'POST',
     			url : 'faqi',
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
     					str+="<td>"+project.fileid+"</td>";
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
    </table>
</div>
<div id="bottom">
    <div class="bot-con1">
        <ul>
            <li class="bot-con1-li1">我们已经做到 </li>
            <li>单项支持人数<span class="inde-span1"></span></li>
            <li>单项筹款金额<span class="inde-span2"></span></li>
            <li>累计筹款金额<span class="inde-span3"></span></li>
        </ul>
    </div>
    <div class="bot-con1 bot-con2">
        <ul>
            <li class="bot-con1-li1">发起项目流程 </li>
            <li><span class="inde-span4"></span>发起人创建项目</li>
            <li><span class="inde-span5"></span>项目获得支持</li>
            <li><span class="inde-span6"></span>发起人发放回报</li>
            <li><span class="inde-span7"></span>用户收到回报</li>
        </ul>
    </div>
    <div class="bottom-ggt"><a href=""><img src="images/bottbom_68.jpg" alt=""/></a></div>
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
        <a href=" ">关于淘宝</a>
        <a href=" ">合作伙伴</a>
        <a href=" ">营销中心</a>
        <a href=" ">廉正举报</a>
        <a href=" ">联系客服</a>
        <a href=" ">开放平台</a>
        <a href=" ">诚征英才</a>
        <a href=" ">联系我们</a>
        <a href=" ">网站地图</a>
        <a href=" ">法律声明</a>　　　
        <em>© 2003-2015 Taobao.com 版权所有</em><br>

        <br>
        <span>网络文化经营许可证：<a href=" ">浙网文[2013]0268-027号</a></span>
        <b>|</b>
        <span data-spm-protocol="i">增值电信业务经营许可证：<a href="">浙B2-20080224-1</a></span>
        <b>|</b>
        <span>信息网络传播视听节目许可证：1109364号</span>
        <b>|</b>
        <span>举报电话:0571-81683755</span>
    </div>
</div>
</body>
</html>