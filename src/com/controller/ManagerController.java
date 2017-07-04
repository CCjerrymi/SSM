package com.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.dao.ManagerDao;
import com.entity.Manager;
import com.service.IManagerService;

@Controller
@RequestMapping("/managerController")
public class ManagerController {
	@Resource(name = "managerService")
	IManagerService service;

	public ManagerController() {
		// TODO Auto-generated constructor stub
	}

	@Resource(name = "managerDao")
	ManagerDao dao;

	/**
	 * 管理员登录
	 * 
	 * 
	 **/
	@RequestMapping("/managerLogin")
	@ResponseBody
	public String managerLogin(String name, String passWord) {

		boolean result = service.managerLogin(name, passWord);
		if (result) {
			return "true";
		} else {
			return "false";
		}
	}

	@RequestMapping("/loginManager")
	@ResponseBody
	public String loginManager(String userID, String password) {
		return service.loginManager(userID, password);

	}

	/**
	 * 用户登录
	 * 
	 * 
	 **/
	@RequestMapping("/userLogin")
	@ResponseBody
	public String userLogin(String ID, String passWord) {
		boolean result = service.userLogin(ID, passWord);
		if (result) {
			return "true";
		} else {
			return "false";
		}

	}

	/**
	 * 检测数据库是否有值
	 * 
	 * 
	 **/
	@RequestMapping("/checkValue")
	@ResponseBody
	public String checkValue(String ID) {
		return "";

	}

	@RequestMapping("/regist")
	@ResponseBody
	public String regist(String name, String password, String id) {
		Manager manager = new Manager(id, name, password);
		int result = service.regist(manager);
		if (result == 1) {
			return "TRUE";
		} else {
			return "FALSE";
		}
	}

	// 获取所有问卷
	@RequestMapping("/initData")
	@ResponseBody
	public String initData() {
		return JSONArray.fromObject(service.initData()).toString();

	}

	// 获取所有用户
	@RequestMapping("/getAlluser")
	@ResponseBody
	public String getAlluser() {
		System.out.println(JSONArray.fromObject(service.getAlluser())
				.toString());
		return JSONObject.fromObject(service.getAlluser()).toString();
	}

	//通过用户IP获取问卷号
	@RequestMapping("/getQuestionnaireByCondition")
	@ResponseBody
	public String getQuestionnaireByCondition(String userIP) {
		return service.getQuestionnaireByCondition(userIP);
	}
}
