function displayAlluser(){
	$.ajax({
		type:'post',
		url:'managerController/getAlluser.do',
		async : true,
		success : function(data){
			displayNaire(data);
		}
	});
}

$(function(){
	displayAlluser();
});

function displayNaire(data){
	var dataObj=eval("("+data+")");//转换为json对象 
	var queryPorper = $('#userIP');
	queryPorper.empty();
	var count = dataObj.rows.length;
	if(count <= 0){
		alert("还没有用户做题");
	}
	else{
		for(var i = 0;i < dataObj.rows.length;i++){
			var userIP = dataObj.rows[i].userIP;
			var html = "<li>";
			html += "<button type='button' class='btn btn-default btn-lg btn-block' id='"+userIP+"'  onclick='clickFunction(this)' value=''>"+userIP+" ";
			html += "</button>";
			html += "</a>";
			html += "</li>";
			queryPorper.append(html);	
		}
	}
}

var userIP;
var questionNaireID;
function clickFunction(obj){
	userIP= obj.id;
	alert(userIP);
	$.ajax({
		type:'post',
		url:'managerController/getQuestionnaireByCondition.do',
		async : true,
		data:{userIP:userIP},
		success : function(data){
			questionNaireID = data;
			getAllQuestions();
		}
	});
}

function getAllQuestions(){
	$.ajax({
		type:'post',
		url:'questionController/getUerAnswers.do',
		async : true,
		data:{
			condition:questionNaireID,
			userIP:userIP
		},
		success : function(data){
			displayNaireDetail(data);
		}
	});
}

function displayNaireDetail(data){
	var dataObj=eval("("+data+")");//转换为json对象 
	
	var queryPorper = $('#fm_detail');
	queryPorper.empty();
	var count = dataObj.rows.length;
	if(count <= 0){
		alert("该用户还没有答卷！");
		return ;
	}
	else{
		for (var i = 0; i < dataObj.rows.length; i++){
			
			var html ="<div>"
			html += "<label >"+dataObj.rows[i].question+"</label>";
			html += "<br><br>";
			
			var type = dataObj.rows[i].singlestate;
			var resultA = dataObj.rows[i].resultA;
			var resultB = dataObj.rows[i].resultB;
			var resultC = dataObj.rows[i].resultC;
			var resultD = dataObj.rows[i].resultD;
			var a = dataObj.rows[i].a;
			var b = dataObj.rows[i].b;
			var c = dataObj.rows[i].c;
			var d = dataObj.rows[i].d;
			
			if(type=="1" || type == 1){
				
				if(a==resultA){
					html += "<input type='radio' value = '"+a+"' name = '"+dataObj.rows[i].questionID+"' checked>"+dataObj.rows[i].a+"";
					html += "<br><br>";
				}
				else{
					html += "<input type='radio' value = '"+a+"' name = '"+dataObj.rows[i].questionID+"'>"+dataObj.rows[i].a+"";
					html += "<br><br>";
				}
				if(b==resultA){
					html += "<input type='radio' value = '"+b+"' name = '"+dataObj.rows[i].questionID+"' checked>"+dataObj.rows[i].b+"";
					html += "<br><br>";
				}
				else{
					html += "<input type='radio' value = '"+b+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].b+"";
					html += "<br><br>";
				}
				if(c==resultA){
					html += "<input type='radio' value = '"+c+"' name = '"+dataObj.rows[i].questionID+"' checked>"+dataObj.rows[i].c+"";
					html += "<br><br>";
				}
				else{
					html += "<input type='radio' value = '"+c+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].c+"";
					html += "<br><br>";
				}
				if(d==resultA){
					html += "<input type='radio' value = '"+d+"' name = '"+dataObj.rows[i].questionID+"' checked>"+dataObj.rows[i].d+"";
					html += "<br><br>";
				}
				else{
					html += "<input type='radio' value = '"+d+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].d+"";
					html += "<br><br>";
				}	
			}
			else if(type=="2" || type==2){
				if(a==resultA || a==resultB || a==resultC || a== resultD){
					html += "<input type='checkbox' value = '"+a+"' name = '"+dataObj.rows[i].questionID+"' checked='checked'>"+dataObj.rows[i].a+"";
					html += "<br><br>";
				}
				else{
					html += "<input type='checkbox' value = '"+a+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].a+"";
					html += "<br><br>";
				}
				if(b==resultA || b==resultB || b==resultC || b== resultD){
					html += "<input type='checkbox' value = '"+b+"' name = '"+dataObj.rows[i].questionID+"' checked='checked'>"+dataObj.rows[i].b+"";
					html += "<br><br>";
				}
				else{
					html += "<input type='checkbox' value = '"+b+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].b+"";
					html += "<br><br>";
				}
				if(c==resultA || c==resultB || c==resultC || c== resultD){
					html += "<input type='checkbox' value = '"+c+"' name = '"+dataObj.rows[i].questionID+"' checked='checked'>"+dataObj.rows[i].c+"";
					html += "<br><br>";
				}
				else{
					html += "<input type='checkbox' value = '"+c+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].c+"";
					html += "<br><br>";
				}
				if(d==resultA || d==resultB || d==resultC || d== resultD){
					html += "<input type='checkbox' value = '"+d+"' name = '"+dataObj.rows[i].questionID+"' checked='checked'>"+dataObj.rows[i].d+"";
					html += "<br><br>";
				}
				else{
					html += "<input type='checkbox' value = '"+d+"' name = '"+dataObj.rows[i].questionID+"' >"+dataObj.rows[i].d+"";
					html += "<br><br>";
				}
				
			}
			else{
				html += "<input type='text' class='form-control'  name='"+dataObj.rows[i].questionID+"' value = '"+resultA+"'/>";
			}
			html += "</div><br><br><br>"
				
			queryPorper.append(html);	
		}
	
	}
}
