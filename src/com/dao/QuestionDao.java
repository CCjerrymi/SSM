package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.entity.Question;
import com.entity.Questionnaire;

public interface QuestionDao {
	
	public int addQuestionNaire(@Param("entity")Questionnaire questionnaire);
	
	public int addQuestion(@Param("entity")Question question);
	
	
	public String getNaireID(@Param("condition")String condition);
	
	public List<Map<String,Object>> getQuestion(@Param("condition")String condition);
	
	public List<Map<String,Object>> getQuestionDetail(@Param("condition")String condition);
	
	public List<Map<String,Object>> getAllQuestionNaire();
	
	public List<Map<String,Object>> getUerAnswers(@Param("condition")String condition,@Param("userIP")String userIP);

}
