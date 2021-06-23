package com.proje.socialmedia.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proje.socialmedia.app.model.Post;
import com.proje.socialmedia.app.model.User;
import com.proje.socialmedia.app.service.PostService;
import com.proje.socialmedia.app.service.SubscribeService;
import com.proje.socialmedia.app.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private SubscribeService subService;
	
	
	@Autowired
	private PostService postService;
	
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
	
	@GetMapping("/deleteAccountList")
	public String deleteAccountList(Model theModel) {
List<User> userList= null;
		
		try {
			
			userList = userService.getUsersList();
		
			theModel.addAttribute("userList",userList);
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			theModel.addAttribute("userList",userList);
		}
		return "admin/adminDeleteAccounts";
	}
	
	
	@PostMapping("/deleteAccount")
	public void deleteAccount( @RequestBody String body  ) {
		
		if(body != null) {
			
			Integer userid= Integer.parseInt(body.split("=")[1]);
			System.out.println(userid);
			
			if(subService.deleteSubAccountAndSubScribe(userid)) {
			
				userService.deleteUserById(userid);
			}
			
			
			
		}
		
	}
	
	@GetMapping("/allPosts")
	public String allPosts(Model theModel) {
		
		List<Post> postList= postService.getPostList();
		
		theModel.addAttribute("postList",postList);
		
		return "admin/adminAllPosts";
	}
	
	@PostMapping("/deletePost")
	public void deletePost(@RequestBody  String body) {
		
		if(body !=null) {
			
			Integer newId = Integer.parseInt(body.split("=")[1]);
			System.out.println(newId);
			
			try {
				postService.deletePostById(newId);
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			
		}
		
		
		
	}
	
	@GetMapping("/delPosts")
	public String delPosts(Model theModel) {
		
		List<Post> postList = postService.getPostList();
		
		theModel.addAttribute("postList",postList);
		
		return "admin/adminDeletePost";
	}
	
	
}
