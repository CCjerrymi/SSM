$(function() {
	initData();
});

function initData(){
	$('#tt').datagrid({
		title : "问卷总览",
		height : 600,
		nowrap : true,// 设置为true，当数据长度超出列宽时将会自动截取
		striped : true,// 设置为true将交替显示行背景。
		url : 'managerController/initData.do',// url调用Action方法
		loadMsg : '数据装载中......',
		singleSelect : true,//为true时只能选择单行 为了实现批量删除必须隐去
		fitColumns : true,// 允许表格自动缩放，以适应父容器
		selectOnCheck : true,
		checkOnSelect : true,
		rownumbers : false,// 行数 
		columns : [ [ {
			field : 'questnaireID',
			title : '问卷号',
			width : 100,
		}, {
			field : 'questnaireName',
			title : '问卷名',
			width : 100
		} ] ],
		onLoadSuccess : function() {
			$(this).datagrid('resize');
		}
	});
}

function view(){
	var row = $('#tt').datagrid('getSelected');
	if (row){
		var questnaireID = row.questnaireID;
		data(questnaireID);
		
	}else{
		jQuery.messager.alert('提示:','请选择问卷!'); 
	}
}

/*新增问题*/
function add(){
	var row = $('#tt').datagrid('getSelected');
	if(row <= 0)
		alert("请选择问卷");
	else if(row > 1)
		alert("只能选择一个问卷");
	else 
		$("#quetionModal").modal();
}

function addQuestion(){
	var row = $('#tt').datagrid('getSelected');
	var questnaireID = row.questnaireID;
	var topicType=$("#type").val();
	var topic = $("#txt_topic").val();
	var choose1 = $("#txt_a").val();
	var choose2 = $("#txt_b").val();
	var choose3 = $("#txt_c").val();
	var choose4 = $("#txt_d").val();
	alert("type" + topicType);
	$.ajax({
		type:"post",
		url:"questionController/addQuestion.do",
		async:true,
		data:{
			questnaireID:questnaireID,
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

/*新增问卷*/
function addNaireName(){
	$('#myModal').modal();
	
}

function addNaire(){
	var questionnaireName = $("#txt_parentNaireName").val();
	alert(questionnaireName);
	$.ajax({
		type:'post',
		url:'questionController/addQuestionnaire.do',
		async : true,
		data:{questionnaireName:questionnaireName},
		success : function(data){
			 $("#tt").datagrid('reload'); 
		}
		
	});
}



function display(condition){
	
	$("#dlgdg").datagrid({
		pageSize : 50,// 默认选择的分页是每页10行数据
		pageList : [ 50, 100, 200 ],// 可以选择的分页集合
		nowrap : true,// 设置为true，当数据长度超出列宽时将会自动截取
		striped : true,// 设置为true将交替显示行背景。
		url:'questionController/getQuestionDetail.do',
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
		        	 alert("success");
		           }
	});
	
}

function data(condition){
	$.ajax({
		type:'post',
		url:'questionController/getQuestionDetail.do',
		async : true,
		data:{condition:condition},
		success : function(data){
			addHTML(data);
		}
	});
}


function addHTML(data){
	var dataObj=eval("("+data+")");//转换为json对象 
	var queryPorper = $('#question');
	queryPorper.empty();
	var count = dataObj.rows.length;
	if(count <= 0){
		alert("该问卷目前还没有创建问题！");
		return ;
	}
	else{
		$('#dlg').dialog('open').dialog('setTitle','问卷详情');
		for (var i = 0; i < dataObj.rows.length; i++){
			var html ="<div>"
			html += "<label >"+dataObj.rows[i].question+"</label>";
			html += "<br><br>";
			var type = dataObj.rows[i].singlestate;
			if(type=="1" || type == 1){
				html += "<input type='radio' value = '"+dataObj.rows[i].a+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].a+"";
				html += "<br><br>";
				html += "<input type='radio' value = '"+dataObj.rows[i].b+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].b+"";
				html += "<br><br>";
				html += "<input type='radio' value = '"+dataObj.rows[i].c+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].c+"";
				html += "<br><br>";
				html += "<input type='radio' value = '"+dataObj.rows[i].d+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].d+"";
				html += "<br><br>";
				
			}
			else if(type=="2" || type==2){
				html += "<input type='checkbox' value = '"+dataObj.rows[i].a+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].a+"";
				html += "<br><br>";
				html += "<input type='checkbox' value = '"+dataObj.rows[i].b+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].b+"";
				html += "<br><br>";
				html += "<input type='checkbox' value = '"+dataObj.rows[i].c+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].c+"";
				html += "<br><br>";
				html += "<input type='checkbox' value = '"+dataObj.rows[i].d+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].d+"";
				html += "<br><br>";
			}
			else{
				html += "<input type='text' class='form-control'  name='"+dataObj.rows[i].questionID+"'/>";
			}
			html += "</div><br><br><br>"
			queryPorper.append(html);
	}
	
	}
}

function view_submit(){
	window.location.href = "module/jsp/seeAlluser.jsp";
}

