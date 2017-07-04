function displayAllNaire(){
	$.ajax({
		type:'post',
		url:'questionController/getAllQuestionNaire.do',
		async : true,
		success : function(data){
			displayNaire(data);
		}
	});
}

$(function(){
	displayAllNaire();
});

function displayNaire(data){
	var dataObj=eval("("+data+")");//转换为json对象 
	var queryPorper = $('#question');
	queryPorper.empty();
	var count = dataObj.rows.length;
	if(count <= 0){
		alert("当前不存在问卷");
	}
	else{
		for(var i = 0;i < dataObj.rows.length;i++){
			var naireID = dataObj.rows[i].questnaireID;
			var html = "<li>";
			html += "<button type='button' class='btn btn-default btn-lg btn-block' id='"+naireID+"'  onclick='clickFunction(this)' >"+dataObj.rows[i].questnaireName+" ";
			html += "</button>";
			html += "</a>";
			html += "</li>";
			queryPorper.append(html);	
		}
	}
}

var questionNaire;
function clickFunction(obj){
	questionNaire= obj.id;
	$.ajax({
		type:'post',
		url:'questionController/getQuestionDetail.do',
		async : true,
		data:{condition:obj.id},
		success : function(data){
			
			displayNaireDetail(data);
			
		}
	});
}

function displayNaireDetail(data){
	var dataObj=eval("("+data+")");//转换为json对象 
	var title = $("#title");
	title.empty();
	var topic = "<input type='hidden' value = '"+questionNaire+"' name = 'questnaireid' id='"+questionNaire+"'>";
	title.append(topic);
	var queryPorper = $('#fm_detail');
	queryPorper.empty();
	var count = dataObj.rows.length;
	if(count <= 0){
		alert("该问卷目前还没有创建问题！");
		return ;
	}
	else{
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
				html += "<input type='text' class='form-control'  name='"+dataObj.rows[i].questionID+"' />";
			}
			html += "</div><br><br><br>"
			queryPorper.append(html);
			
		}
		var button = "<input type='submit' value='Submit'/>";
		queryPorper.append(button);
	
	}
}




