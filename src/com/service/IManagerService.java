package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Manager;

public interface IManagerService {
	public boolean managerLogin(String loginName, String passWord);
	public boolean userLogin(String loginName, String passWord);
	public int regist(Manager manager);
	public List<Map<String,Object>> initData();
	public String loginManager(String userID,String password);
	public Map<String,Object> getAlluser();
	public String getQuestionnaireByCondition(String condition);
}
