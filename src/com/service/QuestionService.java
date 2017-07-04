package com.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;





import org.springframework.stereotype.Service;

import com.dao.QuestionDao;
import com.entity.Question;
import com.entity.Questionnaire;
import com.tool.EntityIDFactory;

@Service
public class QuestionService implements IQuestionService{

	@Resource(name="questionDao")
	QuestionDao dao;
	
	@Override
	/*创建问卷*/
	public int addQuestionnaire(String questionnaireName) {
		
		EntityIDFactory createID = new EntityIDFactory();
		Questionnaire questionnare = new Questionnaire();
		questionnare.setQuestnaireID(createID.createSuId());
		System.out.println(questionnare.getQuestnaireID());
		questionnare.setQuestnaireName(questionnaireName);
		return dao.addQuestionNaire(questionnare) > 0 ? 1 : -1;
		
	}

	@Override
	/*创建题目*/
	public int addQuestion(String questnaireID,String topic,String topicType,String choose1,String choose2,String choose3,String choose4) {
		
		EntityIDFactory entityIDFactory = new EntityIDFactory();
		Question question = new Question();
		question.setQuestionID(entityIDFactory.createId());
		question.setQuestnaireID(questnaireID);
		question.setQuestion(topic);
		question.setA(choose1);
		question.setB(choose2);
		question.setC(choose3);
		question.setD(choose4);
		System.out.println("操作类型" + topicType);
		if(topicType.equals("单项选择"))
			question.setSinglestate(1);
		else if(topicType.equals("多项选择"))
			question.setSinglestate(2);
		else
			question.setSinglestate(3);
		
		return dao.addQuestion(question) > 0 ? 1 : -1;
	}

	@Override
	public Map<String, Object> getQuestion(String condition) {
		String questnaireID = dao.getNaireID(condition);
		List<Map<String,Object>> list = dao.getQuestion(questnaireID);
		int count = list.size();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
	@Override
	public Map<String, Object> getQuestionDetail(String condition) {
		List<Map<String,Object>> list = dao.getQuestionDetail(condition);
		int count = list.size();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	@Override
	public Map<String, Object> getAllQuestionNaire() {
		List<Map<String,Object>> list = dao.getAllQuestionNaire();
		int count = list.size();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
	
	public Map<String,Object> getUerAnswers(String condition,String userIP){
		List<Map<String,Object>> list = dao.getUerAnswers(condition,userIP);
		int count = list.size();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

}
