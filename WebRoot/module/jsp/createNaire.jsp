<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>创建问卷</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css"
	href="module/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="module/jquery-easyui-1.5.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="module/jquery-easyui-1.5.2/themes/icon.css">
	
  </head>
  
  <body>
  
    <div id="naire" style="width:400px;height:300px">
    	
    	<div class="input-group">
            <span class="input-group-addon">问卷名</span>
            <input type="text" class="form-control" placeholder="请输入问卷名" id="questionnaire">
        </div>
        <div class="btn-group btn-group-lg">
		    <button type="button" class="btn btn-default" onclick="naire()">创建问卷</button>
		    <button type="button" class="btn btn-default">取消创建</button>
		</div>
        
    </div>
    
    <div id="head">
    	<h2 id="questionnaireName"></h2>
    </div>
    
    <div id="datashow">
    
    	<table id = "dg"></table>
    
    </div>
   
    <div id="operator">
    	<div class="btn-group btn-group-lg">
		    <button type="button" class="btn btn-default" onclick="newQuestion()">新增</button>
		    <button type="button" class="btn btn-default">创建完成</button>
		</div>
    </div>
    <div id="dlg" class="easyui-dialog" style="width:600px;height:520px;padding:10px 20px;top:210px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">新增问题</div>
		<form id="fm" method="post" novalidate>
			<div id="question" style="width:500px;height:400px;border:1px red solid">
		    	<div class="input-group">
		            <span class="input-group-addon">题目</span>
		            <input type="text" class="form-control" placeholder="输入问题目" id="topic">
		        </div>
		        <br>
		
		        <div>
		        	<input type="text" list="promptinput"id="selectType"  id="topicType">
		        	<datalist id="promptinput">
						<option>单项选择</option>
						<option>多项选择</option>
						<option>自主答题</option>
					</datalist>
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">选项</span>
		            <input type="text" class="form-control" placeholder="输入选项" id="choose1">
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">选项</span>
		            <input type="text" class="form-control" placeholder="输入选项" id="choose2">
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">选项</span>
		            <input type="text" class="form-control" placeholder="输入选项" id="choose3">
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">选项</span>
		            <input type="text" class="form-control" placeholder="输入选项" id="choose4">
		        </div>
					
		    </div> 
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="addQuestion()">保存</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
 
  </body>
  
  <script type="text/javascript" src="module/js/jquery/jquery-3.2.0.min.js"></script>
  <script type="text/javascript" src="module/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="module/js/system/createQuestion.js"></script>
  <script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.min.js"></script>
  <script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
  
</html>