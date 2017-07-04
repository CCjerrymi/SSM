package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Question;
import com.entity.Questionnaire;

public interface IQuestionService {
	
	public int addQuestionnaire(String questionnaireName);
	public int addQuestion(String naireName,String topic,String topicType,String choose1,String choose2,String choose3,String choose4);
	public Map<String,Object> getQuestion(String condition);
	public Map<String,Object> getQuestionDetail(String condition);
	public Map<String,Object> getAllQuestionNaire();
	
	public Map<String,Object> getUerAnswers(String condition,String userIP);

}
