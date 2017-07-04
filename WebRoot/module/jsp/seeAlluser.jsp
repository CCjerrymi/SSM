<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String USERID = (String)request.getSession().getAttribute("USERID");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户界面</title>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css"
	href="module/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="module/jquery-easyui-1.5.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="module/jquery-easyui-1.5.2/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="module/css/manager.css">
	
</head>
<style>
#showDate {
	float: right;
	width: 80%;
	height:100%;
}
#leftList{
	position: absolute;
	width: 20%;
	height:100%;
	border:1px solid black;
}
</style>

<body>
		<div id="head">

			<div id="temp_1">


				<div id="logo"></div>

				<div id="info_list">
					<ul>
						<li><p>帮助</p></li>
						<li><p>解决方案</p></li>
						<li><p>应用中心</p></li>
						<li><p>模板库</p></li>
						<li><p>我的</p></li>
					</ul>
				</div>

			</div>


			<div id="logonInfo">
				<span id="loginState">亲爱的用户<%=USERID%>，您好！
				</span>
			</div>
		</div>
		<div id="leftList">
			
			<ul class="nav nav-pills nav-stacked" id="userIP">
		
			</ul>
		</div>
	<div name="showData" id="showDate" style="padding:100px;">
	
		<form id="fm" action="completeController/saveResult.do" method="post">
			<div id="title">
			
			</div>
			
			<div id="fm_detail" style="width:800px;height:400px">
			
			</div>
		</form>
	
	</div>

</body>

<!--系统js-->
 <script type="text/javascript" src="module/js/jquery/jquery-3.2.0.min.js"></script>
  <script type="text/javascript" src="module/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.min.js"></script>
  <script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<!--外部js  -->
<script type="text/javascript" src="module/js/system/seeAlluser.js"></script>
</html>
