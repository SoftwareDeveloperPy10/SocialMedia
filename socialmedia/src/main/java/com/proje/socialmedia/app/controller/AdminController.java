package com.proje.socialmedia.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proje.socialmedia.app.model.Post;
import com.proje.socialmedia.app.model.User;
import com.proje.socialmedia.app.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/index")
	public String index() {
		
		
		return "admin/adminIndex";
	}
	
	
	@GetMapping("/allAccounts")
	public String allAccounts(Model theModel) {
		
List<User> userList= null;
		
		try {
			
			userList = userService.getUsersList();
		
			theModel.addAttribute("userList",userList);
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			theModel.addAttribute("userList",userList);
		}
		return "admin/adminAllaccoount";
		
	}
	
	
}
