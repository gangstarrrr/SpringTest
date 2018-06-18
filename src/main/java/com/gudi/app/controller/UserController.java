package com.gudi.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gudi.app.dao.DaoInterface;
import com.gudi.util.FinalUtil;
import com.gudi.util.HttpUtil;



@Controller
public class UserController {
	
	@Autowired
	DaoInterface di;
	
	@RequestMapping("/login")
	public String	login() {
		return "login";
	}
	
	@RequestMapping("/user")
	public String	user() {
		return "user";
	}
	
	@RequestMapping("/logout")
	public String	logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/userInsert")
	public String	userInsert(HttpServletRequest req) {
		HashMap<String,Object> param = HttpUtil.getParamMap(req);
		param.put("sqlType","user.userInsert");
		param.put("sql","insert");
		
		int status = (int)di.call(param);

		System.out.println(status);
		
		return "redirect:/";
	}
	
	@RequestMapping("/userSelect")
	public String	userSelect(HttpServletRequest req, Model m,RedirectAttributes attr, HttpSession session) {
		HashMap<String,Object> param = HttpUtil.getParamMap(req);
		String userEmail        = req.getParameter("userEmail");
		param.put("sqlType","user.userSelect");
		param.put("sql","selectOne");
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>)di.call(param);
		
		if(resultMap==null) {
			resultMap=new HashMap<String, Object>();
			resultMap.put("status", FinalUtil.NO);
		}else {
			resultMap.put("status", FinalUtil.OK);
		}
		session.setAttribute("user", resultMap);
		
		//attr.addFlashAttribute("data",resultMap);
		//얘는 1회용이었어 그래서 setattribute하는 순간 얘는 필요없어짐
		
		return "redirect:/";
	}
}
