function getTable(obj){
	alert(obj.id);
	var url = 'searchController/' + obj.id + '.do';
	alert(url);
	$.ajax({
		type:'post',
		url:'questionController/getAllQuestionNaire.do',
		async : true,
		success : function(data){
			displayNaire(data);
		}
	});
}