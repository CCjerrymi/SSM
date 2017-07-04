package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.entity.Result;

public interface CompleteDao {

	public List<Map<String, Object>> getQuestionByCondition(@Param("condition")String condition);
	public int saveResult(@Param("entity")Result result);
	
}
