package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ManagerDao;
import com.entity.Manager;
import com.entity.User;

@Service
public class ManagerService implements IManagerService {
	@Resource(name="managerDao")
	ManagerDao dao;
	
	public ManagerService() {
		// TODO Auto-generated constructor stub
	}
	/**
	 *管理员登录 
	 * 
	 **/
	@Override
	public boolean managerLogin(String name, String passWord) {
		String condition = " loginName = '" + name+"';";
		boolean result = false;
		System.out.println("condition:"+condition);
		System.out.println(dao);
		Manager manage = dao.getManagerByCondition(condition);
		
		if(manage.getPassWord().equals(passWord)) {
			result = true;
		}
		return result; 
		
	}
	
	public String loginManager(String userID,String password){
		Manager manager = dao.getPassword(userID);
		boolean ps = manager.getPassWord().equals(password);
		boolean loginID = userID.equals("11503080115");
		if(ps&&loginID)
			return "1";
		else if(ps && !loginID)
			return "0";
		else 
			return "-1";
	}
	
	/**
	 * 普通用户注册
	 * 
	 * 
	 **/
	@Override
	public int regist(Manager manger) {
		int result = dao.addManager(manger);
		return result;
	} 

	@Override
	public boolean userLogin(String loginName, String passWord) {
		String condition = " loginName = " + loginName;  
		User user = dao.getUserByCondition(condition);
		return user.getPassword().equals(passWord);
	}
	
	@Override
	public List<Map<String,Object>> initData(){
		return dao.getQuestionnaire();
	}
	
	@Override
	public Map<String,Object> getAlluser(){
		List<Map<String,Object>> list = dao.getAlluser();
		int count = list.size();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
	public String getQuestionnaireByCondition(String condition){
		return dao.getQuestionnaireByCondition(condition);
	}

}
