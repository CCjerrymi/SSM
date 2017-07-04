<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'HelloWorld.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css"
	href="module/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="module/jquery-easyui-1.5.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="module/jquery-easyui-1.5.2/themes/icon.css">

  </head>
  
  <body>
    
   <div id="displayData">
   	<table id="dg">
   	
   	</table>
   </div>
    
  </body>
  
  <!--系统js-->
 <script type="text/javascript" src="module/js/jquery/jquery-3.2.0.min.js"></script>
  <script type="text/javascript" src="module/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="module/js/system/createQuestion.js"></script>
  <script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.min.js"></script>
  <script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
  
</html>