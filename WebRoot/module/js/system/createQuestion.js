function naire(){
	var name=$("#questionnaire").val();
	document.getElementById("naire").style.display = "none";
	var h = document.getElementById("questionnaireName");
	h.innerHTML= name;
	alert(h.innerHTML);
	
	$.ajax({
		type:"GET",
		url:"questionController/addQuestionnaire.do",
		async:true,
		data:{
			questionnaireName:name
		},
		success:function(data){
			if(data=="true"){
				alert("创建成功");
			}
			else
				alert("创建失败");
		},
		error:function(){
			alert("error!!!");
		}
	});
}

function getNaireName(){
	return $("#questionnaire").val();
}


function addQuestion(){
//	var name=document.getElementById("questionnaireName").innerHTML;
	var name = $("#questionnaire").val();
	alert(name);
	var topic = $("#topic").val();
	var topicType=$("topicType").val();
	var choose1 = $("#choose1").val();
	var choose2 = $("#choose2").val();
	var choose4 = $("#choose4").val();
	var choose3 = $("#choose3").val();
	
	$.ajax({
		type:"post",
		url:"questionController/addQuestion.do",
		async:true,
		data:{
			naireName:name,
			topic:topic,
			topicType:topicType,
			choose1:choose1,
			choose2:choose2,
			choose3:choose3,
			choose4:choose4
		},
		success:function(result){
			if(result=="true"){
				alert("创建成功");
				showData();
			}
				
			else
				alert("创建失败");
		}
	});
	
}


$(function(){
	showData();
});
function newQuestion(){
	alert("新增");
	$('#dlg').dialog('open').dialog('setTitle','新增问题');
	$('#fm').form('clear');
}

function showData(){
//	var condition = document.getElementById("questionnaireName").innerHTML;
	var condition = $("#questionnaire").val();
	alert(condition);
	$("#dg").datagrid({
		pageSize : 50,// 默认选择的分页是每页10行数据
		pageList : [ 50, 100, 200 ],// 可以选择的分页集合
		nowrap : true,// 设置为true，当数据长度超出列宽时将会自动截取
		striped : true,// 设置为true将交替显示行背景。
		url:'questionController/getQuestion.do',
		queryParams : {
			condition : condition
		},
		loadMsg : '数据装载中......',
		singleSelect : true,// 为true时只能选择单行 为了实现批量删除必须隐去
		selectOnCheck : true,
		checkOnSelect : true,
		fitColumns : false,// 允许表格自动缩放，以适应父容器
		pagination : true,// 分页
		rownumbers : true,// 行数
		columns:[ [
		           {
		        	   field:'questionID',
		        	   title:'问题ID',
		        	   width:100
		           },{
		        	   field:'questnaireID',
		        	   title:'问卷ID',
		        	   width:100
		           },{
		        	   field:'question',
		        	   title:'问题内容',
		        	   width:200
		           },{
		        	   field:'singlestate',
		        	   title:'问题类型',
		        	   width:60
		           },{
		        	   field:'a',
		        	   title:'选项A',
		        	   width:100
		           },{
		        	   field:'b',
		        	   title:'选项B',
		        	   width:100
		           },{
		        	   field:'c',
		        	   title:'选项C',
		        	   width:100
		           },{
		        	   field:'d',
		        	   title:'选项D',
		        	   width:100
		           }
		           ]],
		           onLoadSuccess : function(){
		        	   
		           }
	});
	
}