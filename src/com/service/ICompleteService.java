package com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ICompleteService {

	public List<Map<String, Object>> getQuestionIDByQuestionnaire(String questionnaireID);
	public int saveResult(HttpServletRequest request);
	public int save(HttpServletRequest request);
}
