package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.ICompleteService;

@Controller
@RequestMapping("/completeController")
public class CompleteController {

	@Resource(name = "completeService")
	ICompleteService service;

	@RequestMapping("/saveResult")
	@ResponseBody
	public String saveResult(HttpServletRequest request,
			HttpServletResponse response) {
		return service.saveResult(request) > 0 ? "true" : "false";
		
	}

}
