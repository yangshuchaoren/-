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
    <meta name="Keywords" content="关键词,关键词">
    <meta name="description" content="">
    <title></title>
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/select-widget-min.js"></script>
    <link rel="stylesheet" href="css/drop-down.css" />
    <link rel="stylesheet" href="css/base.css" type="text/css"/>
    <link rel="stylesheet" href="css/headbott.css" type="text/css"/>
    <link rel="stylesheet" href="css/product-list.css" type="text/css"/>
    <base href="<%=basePath%>"> 
</head>
<body>
<div id="header">
    <div class="heade-con">
        <div class="logo"><a href=""><img src="images/LOGO.png"/></a></div>
        <div class="nav posa">
            <ul>
                <li><a class="vcolor" href="">首页</a></li>
                <li><a href="gqzc-list.html">股权投资</a></li>
                <li><a href="product-list.html">产品众筹</a></li>
                <li><a href="product-list.html">资源众筹</a></li>
                <li><a href="ly-list.html">路演资讯</a></li>
                <li><a href="cop.html">发布项目</a></li>
            </ul>
        </div>
        <div class="search">
            <form action="">
                <input type="text" class="search-txt" value="找项目">
                <input type="submit" class="search-but" value="">
            </form>
        </div>
        <div class="index-login">
            <a class="index-login1" href="user/project">登录</a>
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
<script type="text/javascript">
    $(document).ready(function(){
        $(".ui-select").selectWidget({
            change       : function (changes) {
                return changes;
            },
            effect       : "slide",
            keyControl   : true,
            speed        : 200,
            scrollHeight : 250
        });
    });
</script>
<div class="product-con">
<h1 class="product-con_tit">产品众筹</h1>
    <div class="product-con_nav">
        <a class="lnav_bg" href=""><i><img src="images/ii_04.png" alt=""/></i>全部</a>
        <a href=""><i><img src="images/ii_06.png" alt=""/></i>科技</a>
        <a href=""><i><img src="images/ii_08.png" alt=""/></i>农业</a>
        <a href=""><i><img src="images/ii_10.png" alt=""/></i>动漫</a>
        <a href=""><i><img src="images/ii_12.png" alt=""/></i>设计</a>
        <a href=""><i><img src="images/ii_14.png" alt=""/></i>公益</a>
        <a href=""><i><img src="images/ii_16.png" alt=""/></i>娱乐</a>
        <a href=""><i><img src="images/ii_18.png" alt=""/></i>音乐</a>
        <a href=""><i><img src="images/ii_20.png" alt=""/></i>书籍</a>
           <div class="select-li">
               <span>状态:</span>
               <select name="drop2" class="ui-select">
               <option value="">全部</option>
               <option value="1">全部2</option>
               <option value="2">全部4</option>
               <option value="3">全部5</option>
           </select>
           </div>
        <div class="select-li2">
               <span>排序:</span>
               <select name="drop2" class="ui-select">
               <option value="">全部</option>
               <option value="1">全部2</option>
               <option value="2">全部4</option>
               <option value="3">全部5</option>
           </select>
           </div>
    </div>
    <div class="product-list-l">
        <ul>
  <c:forEach items="${project}" var="project"> 
  
            <!-- 将图片进行连接查看项目信息 -->
                <div class="product-list-lpic">
                    <a href=""><img src="upload/project/${project.fileid}"  alt=""/></a>
  
                    <div class="product_one">制作中</div>
                </div>
                <p><a href="seeproject/${project.fileid}">查看</a></p>
                <div class="product-list-lmin">
                    <dl>
                        <dt>133.3%</dt>
                        <dd></dd>
                    </dl><dl>
                    <dt></dt>
                    <dd>已筹金额</dd>
                </dl><dl>
                    <dt>87987</dt>
                    <dd>支持人数</dd>
                </dl>
                </div>
     </c:forEach>
         <li class="yrz">
                <div class="product-list-lpic">
                    <a href=""><img src="images/prr-dduu_27.jpg" alt=""/></a>
                    <div class="product_one">筹款中</div>
                </div>
                <p><a href="">NGDS新游戏手柄 手机一秒变游戏机</a></p>
                <div class="product-list-lmin">
                    <dl>
                        <dt>133.3%</dt>
                        <dd>达成率</dd>
                    </dl><dl>
                    <dt>88888.3</dt>
                    <dd>已筹金额</dd>
                </dl><dl>
                    <dt>8515</dt>
                    <dd>支持人数</dd>
                </dl>
                </div>
            </li><li class="yrz">
                <div class="product-list-lpic">
                    <a href=""><img src="images/prr-dduu_27.jpg" alt=""/></a>
                    <div class="product_one">筹款中</div>
                </div>
                <p><a href="">NGDS新游戏手柄 手机一秒变游戏机</a></p>
                <div class="product-list-lmin">
                    <dl>
                        <dt>133.3%</dt>
                        <dd>达成率</dd>
                    </dl><dl>
                    <dt>88888.3</dt>
                    <dd>已筹金额</dd>
                </dl><dl>
                    <dt>8515</dt>
                    <dd>支持人数</dd>
                </dl>
                </div>
            </li><li class="zcz">
                <div class="product-list-lpic">
                    <a href=""><img src="images/prr-dduu_27.jpg" alt=""/></a>
                    <div class="product_one">筹款中</div>
                </div>
                <p><a href="">NGDS新游戏手柄 手机一秒变游戏机</a></p>
                <div class="product-list-lmin">
                    <dl>
                        <dt>133.3%</dt>
                        <dd>达成率</dd>
                    </dl><dl>
                    <dt>88888.3</dt>
                    <dd>已筹金额</dd>
                </dl><dl>
                    <dt>8515</dt>
                    <dd>支持人数</dd>
                </dl>
                </div>
            </li><li class="zcz">
                <div class="product-list-lpic">
                    <a href=""><img src="images/prr-dduu_27.jpg" alt=""/></a>
                    <div class="product_one">筹款中</div>
                </div>
                <p><a href="">NGDS新游戏手柄 手机一秒变游戏机</a></p>
                <div class="product-list-lmin">
                    <dl>
                        <dt>133.3%</dt>
                        <dd>达成率</dd>
                    </dl><dl>
                    <dt>88888.3</dt>
                    <dd>已筹金额</dd>
                </dl><dl>
                    <dt>8515</dt>
                    <dd>支持人数</dd>
                </dl>
                </div>
            </li><li class="yrz">
                <div class="product-list-lpic">
                    <a href=""><img src="images/prr-dduu_27.jpg" alt=""/></a>
                    <div class="product_one">筹款中</div>
                </div>
                <p><a href="">NGDS新游戏手柄 手机一秒变游戏机</a></p>
                <div class="product-list-lmin">
                    <dl>
                        <dt>133.3%</dt>
                        <dd>达成率</dd>
                    </dl><dl>
                    <dt>88888.3</dt>
                    <dd>已筹金额</dd>
                </dl><dl>
                    <dt>8515</dt>
                    <dd>支持人数</dd>
                </dl>
                </div>
            </li><li class="zcz">
                <div class="product-list-lpic">
                    <a href=""><img src="images/prr-dduu_27.jpg" alt=""/></a>
                    <div class="product_one">筹款中</div>
                </div>
                <p><a href="">NGDS新游戏手柄 手机一秒变游戏机</a></p>
                <div class="product-list-lmin">
                    <dl>
                        <dt>133.3%</dt>
                        <dd>达成率</dd>
                    </dl><dl>
                    <dt>88888.3</dt>
                    <dd>已筹金额</dd>
                </dl><dl>
                    <dt>8515</dt>
                    <dd>支持人数</dd>
                </dl>
                </div>
            </li>
            <li class="cz">
                <div class="product-list-lpic">
                    <a href=""><img src="images/prr-dduu_27.jpg" alt=""/></a>
                    <div class="product_one">筹款中</div>
                </div>
                <p><a href="">NGDS新游戏手柄 手机一秒变游戏机</a></p>
                <div class="product-list-lmin">
                    <dl>
                        <dt>133.3%</dt>
                        <dd>达成率</dd>
                    </dl><dl>
                    <dt>88888.3</dt>
                    <dd>已筹金额</dd>
                </dl><dl>
                    <dt>8515</dt>
                    <dd>支持人数</dd>
                </dl>
                </div>
            </li>
        </ul>
    </div>
<div class="product-ym">

        <a class="product-ym_bg" href="">1</a>
        <a href="">2</a>
        <span>...</span>
        <a href="">43</a>
        <a href="">44</a>
        <a href="">45</a>
    <a class="product-ym_xyy" href="">下一页&gt;</a>
    </ul>
</div>
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