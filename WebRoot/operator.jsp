<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tool.*,com.entity.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>operator</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<link rel="stylesheet" type="text/css" href="module/css/index.css">
	<link rel="stylesheet" type="text/css" href="module/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="module/jquery-easyui-1.5.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="module/jquery-easyui-1.5.2/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="module/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="module/bootstrap/css/bootstrap-table.css">
	<link rel="stylesheet" type="text/css" href="module/bootstrap/css/commonSystem.css">
	<link rel="stylesheet" type="text/css" href="module/bootstrap/css/sweetalert.css">
	
	
  </head>
  
  <body onload="getEntity()">
	
	<div id="total">
	
		<div id="head">
		
			<ul class="nav nav-tabs">
				<%
					ListFile listFile = new ListFile();
					List<String> list = listFile
							.listJavaFile("E:\\高级java作业\\QWB\\src\\com\\entity");
					for (int i = 0; i < list.size(); i++) {
				%>
	
				<li>
					<input type="submit" class="btn btn-link btn-lg" name="chooseEntity" 
					id=<%=list.get(i)%> value=<%=list.get(i)%> onclick="getTable(this)">
				</li>
				<%
					}
				%>
			</ul>
		
		</div>
		
		
		
		<div id="toolbar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">add</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">edit</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeUser()">delete User</a>
		</div>
		
		<div id="content">
			
			<table id="dg">
			
			</table>
		
		
		</div>
	
	</div>
	
	
	
  </body>
  
  	<script type="text/javascript" src="module/js/jquery/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="module/js/system/operator.js"></script>
<!--系统js-->
    <script type="text/javascript" src="module/js/jquery/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="module/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.min.js"></script>
	<script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
	<script src="module/bootstrap/js/bootstrap.js"></script>
	<script src="module/bootstrap/js/bootstrap-table.js"></script>
	<script src="module/bootstrap/js/bootstrap-table-zh-CN.js"></script>
	<script src="module/bootstrap/js/sweetalert.min.js"></script>
</html>
