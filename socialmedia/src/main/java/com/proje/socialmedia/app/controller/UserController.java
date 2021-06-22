package com.proje.socialmedia.app.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.proje.socialmedia.app.model.Subscribe;
import com.proje.socialmedia.app.model.User;
import com.proje.socialmedia.app.service.FileUploadService;
import com.proje.socialmedia.app.service.SubscribeService;
import com.proje.socialmedia.app.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Autowired
	private SubscribeService subService;
	
	@PostMapping("/doSubscribe")
	public void doSubscribe(@RequestBody String body) {
		
		if(body != null) {
			
			String[] params = body.split("&");
			
			String value1= params[0].split("=")[1]; // scribeid
			String value2= params[1].split("=")[1]; //accountid
			
			
			if(value1 != null && value2 != null) {
				Subscribe sub = new Subscribe();
				
				User scribe = userService.getUserById(Integer.parseInt(value1));
				
				User account = userService.getUserById(Integer.parseInt(value2));
				
				sub.setSubscriber(scribe);
				sub.setSubaccount(account);
				
				subService.saveSubscribe(sub);
						
			}
			
		}
		
		
	}
	
	
	
	@GetMapping("/userProfile")
	public String detail(@RequestParam(name="id",required = true) String id, 
			Model theModel,HttpServletRequest request) {
		
		if(id != null) {
			
			Integer newId = Integer.parseInt(id);
			try {
				User detailedUser= userService.getUserById(newId);
				
				if(detailedUser != null) {
				
					theModel.addAttribute("userDetail",detailedUser);
					int count = subService.getSubcount(newId);
					theModel.addAttribute("subAccount",count);
					
					
					
					
					
					boolean result = subService.checkSubscribe(newId, 11);
				
					theModel.addAttribute("result",result);
					
					
					
				}
				return "userProfile";
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
				return null;
			}
			
		}
		
		
		return null;
	}
	
	
	@PostMapping("/changePhoto")
	public String changePhoto( @RequestParam(name="photo",required = true) MultipartFile file) {
		
		if(file != null) {
			
			String fileUrl = StringUtils.cleanPath(file.getOriginalFilename());
			
			User updatedUser = userService.getUserById(18);
			
			updatedUser.setUser_photo(fileUrl);
			
			if(userService.updateUser(updatedUser)) {
				
				try {
					fileUploadService.uploadFile(file);
					return "redirect:/profile?succ=1";
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());

					return "redirect:/profile?err=1";
				}
				
				
				
				
			}
			
			
		}
		
		return "redirect:/profile?err=1";
	}
	
	
	@PostMapping("/passChange")
	public String passChange(@RequestParam(name="password",required = true) String password,HttpServletRequest request) {
			
		
		if(password != null) {
			
			User updatedUser = userService.getUserById(18);
			
			try {
				MessageDigest md= MessageDigest.getInstance("MD-5");
				byte[] dizi = md.digest(password.getBytes());
				BigInteger encryptedPassword = new BigInteger(1,dizi);
				
				String hashPassword = encryptedPassword.toString();
				
				updatedUser.setUser_password(hashPassword);
				
				if(userService.updateUser(updatedUser))
					return "redirect:/profile?succ=1";
				
				
				
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "redirect:/profile?err=1";
				
			}
			
			return "redirect:/profile?err=1";
			
			
			
		}
		
		
		
		
		return null;
	}
	
	@PostMapping("/changeUsername")
	public String changeUsername(@RequestParam(name="username",required = true) String username,HttpServletRequest request) {
		
		if(username != null) {
			
			
			
			//User updatedUser = userService.getUserById(Integer.parseInt(request.getSession().getAttribute("kullaniciid").toString()));
			User updatedUser = userService.getUserById(18);
			
			
			
			updatedUser.setUsername(username);
			
			
			if(userService.updateUser(updatedUser)) 
				return "redirect:/profile?succ=1";
			
			
			
		}
		
		
		return "redirect:/profile?err=1";
		
		
	}
	
	
	
	@GetMapping("/changePassword")
	public String changePassword(@RequestParam(name="succ",required = false) String succ,
			@RequestParam(name="err",required = false) String err,@RequestParam(name="email",required = true) String email) {
		
		return "changePassword";
		
		
	}
	
	@PostMapping("/passwordPost")
	public String passwordPost(@RequestParam(name="password",required = true) String password, @RequestParam(name="passwordAgain",required = true) String passwordAgain,
			HttpServletRequest request, HttpServletResponse response ,
			@RequestParam(name="email",required = true) String email) {
		
		if(password != null && passwordAgain != null && email != null) {
			
			if(password.equalsIgnoreCase(passwordAgain)) {
				
				User user = userService.getUserByEmail(email);
				
				MessageDigest md;
				
				
				
				try {
					md = MessageDigest.getInstance("MD5");
			
				
					byte[] dizi= md.digest(password.getBytes());
				
			
				
				BigInteger encryptedPassword = new BigInteger(1, dizi);
				
				String hashPassword = encryptedPassword.toString();
				
				user.setUser_password(hashPassword);
				
				
				for(Cookie c: request.getCookies()) {
					System.out.println(c.getName());
					if(c.getName().equalsIgnoreCase("password")) {
						
					
						
						if(c.getValue() != null) {
						
							Cookie cookie = new Cookie("password",null);
							
							cookie.setMaxAge(0);
	
							
							
							cookie.setPath("/");
							response.addCookie(cookie);
							
							
						}
						
						Cookie newcookie= new Cookie("password",hashPassword);
						
						newcookie.setMaxAge(86400);
						
						newcookie.setPath("/");
						response.addCookie(newcookie);
						
					}else {
						Cookie newcookie= new Cookie("password",hashPassword);
						
						newcookie.setMaxAge(86400);
						
						newcookie.setPath("/");
						response.addCookie(newcookie);
					}
				}
				
				
				if(userService.updateUser(user)) {
					return "redirect:/login?psucc=1";
				}
				
				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return "redirect:/forgotPassword?err=1";
				}
				
			}
			

			return "redirect:/forgotPassword?err=1";
		}

		return "redirect:/forgotPassword?err=1";
		
		
		
	}
	
	
	@GetMapping("/yenile")
	public String yenile(@RequestParam(name="id",required = true) String id,HttpServletRequest request,
			@RequestParam(name="email",required = true) String email) {
		
		if( id != null && email != null ) {
			
			
			if(request.getSession().getAttribute("lockemail").toString().equalsIgnoreCase(id)) {
				
				return "redirect:/user/changePassword?email="+email;
				
				
			}
			
			
		}
		
		return "redirect:/forgotPassword";
		
		
		
	}
	
}
