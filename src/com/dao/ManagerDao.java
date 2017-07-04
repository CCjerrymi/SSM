package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.entity.Manager;
import com.entity.User;

public interface ManagerDao {
	public Manager getManagerByCondition(@Param("condition")String condition);
	public User getUserByCondition(@Param("condition")String condition);
	public int addManager(@Param("entity")Manager manager);
	public int checkValue(@Param("condition")String condition,@Param("table")String table);
	public List<Map<String,Object>> getQuestionnaire();
	public Manager getPassword(@Param("condition")String condition);
	
	public List<Map<String,Object>> getAlluser();
	
	public String getQuestionnaireByCondition(@Param("condition")String condition);
}


