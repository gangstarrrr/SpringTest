package com.gudi.app.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gudi.util.HttpUtil;

@Controller
public class MainController {
	@RequestMapping("/")
	public String	main(HttpSession session) {

		return "main";
	}

}
