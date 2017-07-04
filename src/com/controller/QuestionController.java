package com.controller;

import javax.annotation.Resource;


import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Questionnaire;
import com.service.IQuestionService;
import com.tool.EntityIDFactory;

@Controller
@RequestMapping("/questionController")
public class QuestionController {
	
	@Resource(name="questionService")
	IQuestionService service;
	
	
	
	@RequestMapping("/addQuestionnaire")
	@ResponseBody
	public String addQuestionnaire(String questionnaireName){
		int result = service.addQuestionnaire(questionnaireName);
		return result == 1?"true":"false";
	}
	
	@RequestMapping("/getAllQuestionNaire")
	@ResponseBody
	/*获取所有的问卷*/
	public String getAllQuestionNaire(){
		String json = JSONObject.fromObject(service.getAllQuestionNaire()).toString();
		System.out.println(json);
		return json;	
	}
	
	
	@RequestMapping("/addQuestion")
	@ResponseBody
	public String addQuestion(String questnaireID,String topic,String topicType,String choose1,String choose2,String choose3,String choose4){
		
		return service.addQuestion(questnaireID,topic, topicType, choose1, choose2,choose3,choose4) == 1?"true":"false";
		
	}
	
	
	@RequestMapping("/getQuestion")
	@ResponseBody
	public String getQuestion(String condition){
		String json = JSONObject.fromObject(service.getQuestion(condition)).toString();
		return json;             
	}
	
	@RequestMapping("/getQuestionDetail")
	@ResponseBody
	public String getQuestionDetail(String condition){
		String json = JSONObject.fromObject(service.getQuestionDetail(condition)).toString();
		return json;
	}
	
	
	@RequestMapping("/getUerAnswers")
	@ResponseBody
	public String getUerAnswers(String condition,String userIP){
		String json = JSONObject.fromObject(service.getUerAnswers(condition,userIP)).toString();
		System.out.println(json);
		return json;
	}

}
