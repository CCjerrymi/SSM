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

<body>
	<div>
	
		<div id="tb" style="padding:3px">
			<span>ID:</span>
			<input id="itemid" style="line-height:26px;border:1px solid #ccc">
			<span>姓名:</span>
			<input id="productid" style="line-height:26px;border:1px solid #ccc">
			<a href="#" class="easyui-linkbutton" plain="true" onclick="doSearch()">Search</a>
		</div>
	
		<div id="content">
			
			<table id="dg">
			
			</table>
			
		</div>
		
		<div style="padding:3px 2px;border-bottom:1px solid #ccc">Ajax Form</div>
	<form id="ff" method="post">
		<table>
			<tr>
				<td>Name:</td>
				<td><input name="name" type="text"></input></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input name="email" type="text"></input></td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td><input name="phone" type="text"></input></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit"></input></td>
			</tr>
		</table>
	</form>
		
		
	</div>
	
	
</body>

<!--系统js-->
 <script type="text/javascript" src="module/js/jquery/jquery-3.2.0.min.js"></script>
  <script type="text/javascript" src="module/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.min.js"></script>
  <script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<!--外部js  -->
<script type="text/javascript" src="module/js/system/test.js"></script>
</html>
