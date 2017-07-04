package com.service;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.executor.ReuseExecutor;
import org.springframework.stereotype.Service;

import com.dao.CompleteDao;
import com.entity.Result;
import com.tool.EntityIDFactory;

@Service
public class CompleteService implements ICompleteService {

	@Resource(name = "completeDao")
	CompleteDao dao;

	public List<Map<String, Object>> getQuestionIDByQuestionnaire(
			String questionnaireID) {
		return dao.getQuestionByCondition(questionnaireID);
	}

	@Override
	public int saveResult(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		int count = 0;
		Result result = new Result();
		String questionID = null;
		int singlestate = 0;
		String[] doublevalue = new String[4];

		String answer;
		String[] answers = new String[4];

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String submitTime = sdf.format(new Date());
		String userIP = request.getRemoteAddr()+EntityIDFactory.createId();
		List<Map<String, Object>> listMaps = getQuestionIDByQuestionnaire(request
				.getParameter("questnaireid"));
		for (int i = 0; i < listMaps.size(); i++) {
			questionID = (String) listMaps.get(i).get("questionID");
			System.out.println("问题id 是" + questionID);
			singlestate = Integer.parseInt((String) listMaps.get(i).get(
					"singlestate"));

			result.setResultID(EntityIDFactory.createId());
			result.setQuestnaireID(request.getParameter("questnaireid"));
			System.out.println(request.getParameter("questnaireid"));
			result.setQuestionID(questionID);
			result.setUserIP(userIP);
			result.setSubmitTime(submitTime);

			if (singlestate == 1 || singlestate == 3) {
				answer = request.getParameter(questionID);
				System.out.println("answer is " + answer);
				result.setResultA(answer);
				count += dao.saveResult(result);
			} else{
				
				
				answers = request.getParameterValues(questionID);
				
				for(int j = 0;j < answers.length;j++)
					doublevalue[j] = answers[j];
				for(int j = 0;j < 4;j++)
					if(doublevalue[j] == null)
						doublevalue[j] = "";
				result.setResultA(doublevalue[0]);
				result.setResultB(doublevalue[1]);
				result.setResultC(doublevalue[2]);
				result.setResultD(doublevalue[3]);
				
				count += dao.saveResult(result);
			}
			

		}
		return count;
	}

	@Override
	public int save(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return 0;
	}

}
