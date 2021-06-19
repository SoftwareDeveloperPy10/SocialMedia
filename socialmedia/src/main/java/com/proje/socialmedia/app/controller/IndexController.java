package com.proje.socialmedia.app.controller;

import java.math.BigInteger;
import java.security.MessageDigest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proje.socialmedia.app.model.User;
import com.proje.socialmedia.app.service.UserService;

@Controller
public class IndexController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/login")
	public String login(Model theModel) {
		
		User user = new User();
		
		theModel.addAttribute("user",user);
		
		return "login";
		
		
	}
	
	
	@PostMapping("/giris")
	public String giris(@ModelAttribute(name = "user") User theUser,HttpServletRequest request, @RequestParam(name="rememberMe",required = false) String rememberMe,
			HttpServletResponse response) {
		
		if(theUser != null) {
			
			
			User loginUser = userService.checkUser(theUser.getUseremail(), theUser.getUser_password());
			
			if(loginUser != null) {
				
				request.getSession().invalidate();
				
				HttpSession session = request.getSession(true);
				
				session.setAttribute("kullaniciid", theUser.getKullaniciid());
				
				session.setMaxInactiveInterval(86400);
				
				if(rememberMe != null) {
					
					Cookie cookie = new Cookie("useremail",theUser.getUseremail());
					
					response.addCookie(cookie);
					try {
					MessageDigest md;
					
					
					
					md = MessageDigest.getInstance("MD5");
					
					byte[] dizi= md.digest(theUser.getUser_password().getBytes());
					
				
					
					BigInteger encryptedPassword = new BigInteger(1, dizi);
					
					String hashPassword = encryptedPassword.toString();
					
					
					Cookie pasCookie = new Cookie("password",hashPassword);
					
					response.addCookie(pasCookie);
					
					}catch(Exception e) {
						e.printStackTrace();
					}
					
					
				}
				return "redirect:/login?succ=1";
				
			}
		
			
		}
		
		return "redirect:/login";
	}
	
}
