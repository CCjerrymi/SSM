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


<title>管理界面</title>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="module/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="module/jquery-easyui-1.5.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="module/jquery-easyui-1.5.2/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="module/css/manager.css">
	<link rel="stylesheet" type="text/css" href="module/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="module/bootstrap/css/bootstrap-table.css">
	<link rel="stylesheet" type="text/css" href="module/bootstrap/css/commonSystem.css">
	<link rel="stylesheet" type="text/css" href="module/bootstrap/css/sweetalert.css">

</head>

<body>
	<div id="total">
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

		</div>



		<div id="manger_qe">
			<div id="op_buttonArea">
				<div id="button_1">
					<ul>
						<li><input id="add" class="op_button" type="button" name="" value="+问卷" onclick="addNaireName()"/></li>
						<li><input id="add" class="op_button" type="button" name="" value="+问题" onclick="add()"/></li>
						<li><input id="all" class="op_button" type="button" name="" value="全部" /></li>
						<li><input id="view" class="op_button" type="button" name="" value="详情" onclick="view()"/></li>
						<li><input id="view" class="op_button" type="button" name="" style="width:120px" value="查看提交的问卷" onclick="view_submit()"/></li>
					</ul>
				</div>
			</div>

			<div id="qe_info">
				<table id="tt">
				
				</table>
			</div>
		</div>

	</div>
	
	<!-- 显示问卷详情 -->
	<div id="dlg" class="easyui-dialog" style="width:900px;height:700px;padding:10px 20px;top:100px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle"></div>
		<div id="question" style="border:1px solid black">
			<table id="dlgdg"></table>
		</div>
	</div>
	
	
	<!-- 弹出框添加问卷 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增问卷</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="txt_parentdepartment">问卷名</label> <input type="text"
							name="txt_parentdepartment" class="form-control"
							id="txt_parentNaireName" placeholder="输入问卷名">
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" class="btn btn-primary"
						data-dismiss="modal" onclick="addNaire()">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹出框，新增问题 -->
	<div class="modal fade" id="quetionModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增问题</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="txt_topic">题目</label> <input type="text"
							name="txt_topic" class="form-control"
							id="txt_topic" placeholder="输入题目">
					</div>
					<div class="form-group">
						<label for="txt_topicType">题目类型</label> <input type="text"
							name="txt_topicType" class="form-control"
							id="type" placeholder="选择题目类型" list="promptinput">
						<datalist id="promptinput">
							<option>单项选择</option>
							<option>多项选择</option>
							<option>自主答题</option>
						</datalist>
						
					</div>
					<div class="form-group">
						<label for="txt_a">选项A</label> <input type="text"
							name="txt_a" class="form-control"
							id="txt_a" placeholder="选项A">
					</div>
					<div class="form-group">
						<label for="txt_b">选项B</label> <input type="text"
							name="txt_b" class="form-control" id="txt_b"
							placeholder="选项B">
					</div>
					<div class="form-group">
						<label for="txt_c">选项C</label> <input type="text"
							name="txt_c" class="form-control" id="txt_c"
							placeholder="选项c">
					</div>
					<div class="form-group">
						<label for="txt_d">选项D</label> <input type="text"
							name="txt_d" class="form-control" id="txt_d"
							placeholder="选项D">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" class="btn btn-primary"
						data-dismiss="modal" onclick="addQuestion()">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
					</button>
				</div>
			</div>
		</div>
	</div>
</body>

<!--系统js-->
    <script type="text/javascript" src="module/js/jquery/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="module/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.min.js"></script>
	<script type="text/javascript" src="module/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
	<script src="module/bootstrap/js/bootstrap.js"></script>
	<script src="module/bootstrap/js/bootstrap-table.js"></script>
	<script src="module/bootstrap/js/bootstrap-table-zh-CN.js"></script>
	<script src="module/bootstrap/js/sweetalert.min.js"></script>
<!--  -->
<script type="text/javascript" src="module/js/system/manager.js"></script>
</html>
