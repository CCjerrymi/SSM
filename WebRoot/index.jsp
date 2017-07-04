<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>问卷网</title>
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

<body>
	<div id="total">

	<div id="top">
			<div id="head">
				<div id="title">
					<ul>
						<!-- <li><img id="logo" src="module/img/a.png"></li> -->
						<!-- <li><p>首页</p></li>
						<li><p>产品</p></li>
						<li><p>学院</p></li>
						<li><p>服务支持</p></li> -->
					</ul>

				</div>

				<div id="op">
					 <input type = "button" id="login" class="lobutton" style="background:green" onclick="login()" value = "登录"/>
			     	 <input type = "button" id="regist" class="lobutton" style="background:green" onclick="user_regist()" value = "注册"/>
			     	 <label id="loginTip"></label>
					
				</div>
				
			</div>


			
		</div>


		<div id="secondArea">
				<div id="secondMiddle">
						<div id="tip_1">
							<p class="tipInfo">
								在线问卷，快速做题，问卷作者实时得知问卷结果
							</p>					
						</div>
						<div id="tip_2">
							<p class="tipInfo">
								关注问卷动态
							</p>					
						</div>
						<div id="tip_3">
							<p class="tipInfo">
								数据同步跟新，
								关注每一份问卷的心声
							</p>
						</div>

					
				</div>
		</div> 
			
	</div>
	
	<!-- 用户注册 -->
	<div class="modal fade" id="user_register" tabindex="-1" role="dialog"
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
						<label for="txt_username">用户名</label> <input type="text"
							name="txt_username" class="form-control"
							id="txt_username" placeholder="输入用户名">
					</div>
					
					<div class="form-group">
						<label for="txt_password">密码</label> <input type="text"
							name="txt_password" class="form-control"
							id="txt_password" placeholder="输入密码">
					</div>
					
					<div class="form-group">
						<label for="txt_userID">学号</label> <input type="text"
							name="txt_userID" class="form-control"
							id="txt_userID" placeholder="输入学号">
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" class="btn btn-primary"
						data-dismiss="modal" onclick="addUser()">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
					</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 登录 -->
	<div class="modal fade" id="area_login" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">登录</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="txt_username">用户名ID</label> <input type="text"
							name="txt_username" class="form-control"
							id="userID" placeholder="输入用户名ID">
					</div>
					
					<div class="form-group">
						<label for="txt_password">密码</label> <input type="password"
							name="txt_password" class="form-control"
							id="password" placeholder="输入密码">
					</div>
		
				</div>                                                                                                                  
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消
					</button>
					<button type="button" id="btn_submit" class="btn btn-primary"
						data-dismiss="modal" onclick="userLogin()">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>登录
					</button>
				</div>
			</div>
		</div>
	</div>

</body>

	<script type="text/javascript" src="module/js/jquery/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="module/js/system/index.js"></script>
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
