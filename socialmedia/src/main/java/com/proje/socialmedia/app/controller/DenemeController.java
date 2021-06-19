package com.proje.socialmedia.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DenemeController {
	
	@GetMapping("/")
	public String login() {
		System.out.println("login controller");
		return "login";
	}
	
}
