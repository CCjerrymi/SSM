function ok() {
	alert("here");
	var dateTime = "20170515";
	$.ajax({
		url : "HelloController/hello.do",
		async : true,
		type : "GET",
		data : {
			dateTime : dateTime
		},
		success : function(string) {
			console.log("success!")
			console.log(string);
		}

	});
}



function user_regist(){
	$('#user_register').find('input').val="";
	$('#user_register').modal();
}

function addUser(){
	var userName = $("#txt_username").val();
	var password = $("#txt_password").val();
	var userID = $("#txt_userID").val();
	$.ajax({
		type:'post',
		url:'managerController/regist.do',
		async : true,
		data:{
			name:userName,
			password:password,
			id:userID
		},
		success : function(data){
			alert("注册成功"); 
		}
	});
}


function login(){
	$('#area_login').find('input').val="";
	$('#area_login').modal();
}

function userLogin(){
	var userID = $("#userID").val();
	var password = $("#password").val();
	
	$.ajax({
		type:'post',
		url:'managerController/loginManager.do',
		async : true,
		data:{
			userID:userID,
			password:password,
		},
		success : function(data){
			if(data == "1")
				window.location.href='module/jsp/manager.jsp'; 
			else if(data == "0")
				window.location.href='module/jsp/user.jsp'; 
			else
				alert("登录失败")
		}
	});
}