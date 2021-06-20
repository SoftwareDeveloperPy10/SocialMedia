package com.proje.socialmedia.app.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.proje.socialmedia.app.model.User;
import com.proje.socialmedia.app.service.UserService;
import com.proje.socialmedia.app.utils.EmailSender;
import com.proje.socialmedia.app.utils.EmailSenderImpl;

@Controller
public class IndexController {
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/aboutUs")
	public String aboutUs() {
		return "aboutUs";
	}
	
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
					
					
					
					for(Cookie c: request.getCookies()) {
						
						if(c.getName().equalsIgnoreCase("password") ) {
							
							
							
							
					
						
							
							Cookie pasCookie = new Cookie("password",theUser.getUser_password());
						}else {
							byte[] dizi= md.digest(theUser.getUser_password().getBytes());
							
							
							
							BigInteger encryptedPassword = new BigInteger(1, dizi);
							
							String hashPassword = encryptedPassword.toString();
							Cookie pasCookie = new Cookie("password",hashPassword);
							pasCookie.setPath("/");
							response.addCookie(pasCookie);
							
						}
						
					}
					
					cookie.setPath("/");
					
					
					}catch(Exception e) {
						e.printStackTrace();
					}
					
					
				}
				return "redirect:/login?succ=1";
				
			}
		
			
		}
		
		return "redirect:/login";
	}
	

	
	
	@GetMapping("/signUp")
	public String signup(Model theModel,@RequestParam(name="succ",required = false) String succ,
	@RequestParam(name="serr",required = false) String serr,@RequestParam(name="err",required = false) String err		) {
		
		User user = new User();
		
		theModel.addAttribute("user",user);
		
		return "signup";
	}
	
	@PostMapping("/signUpPost")
	public String signUpPost(@ModelAttribute(name="user") User theUser, @RequestParam(name="profilephoto",required = false) MultipartFile file,
			@RequestParam(name="userbof",required = true) String userbof) {
		
		
		
		if(theUser != null && userbof != null) {
			
			User newUser = new User();
			
		
			
			String[] values = userbof.split("-"); // yil ay gun
			
			Date newDate = null;
			if(values[2].equals("31")) {
				newDate= new Date(Integer.parseInt( values[0]), Integer.parseInt(values[1]), 1);
			}
			
		
			 newDate = new Date(Integer.parseInt( values[0]), Integer.parseInt(values[1]), Integer.parseInt(values[2]));
		
			System.out.println("========");
			System.out.println("Date "+newDate.getDate());
			System.out.println("Day "+newDate.getDay());
			System.out.println("Month "+newDate.getMonth());
			System.out.println("Year "+newDate.getYear());
			
			
			
			
			newUser.setUser_bof(newDate);
			newUser.getUser_bof().setYear(newDate.getYear() -1900);
			newUser.setUseremail(theUser.getUseremail());
			
			newUser.setUsername(theUser.getUsername());
			
			MessageDigest md;
			
			
			
			try {
				md = MessageDigest.getInstance("MD5");
				
				byte[] dizi= md.digest(theUser.getUser_password().getBytes());
			
		
			
				BigInteger encryptedPassword = new BigInteger(1, dizi);
				
				String hashPassword = encryptedPassword.toString();
				
	
				newUser.setUser_password(hashPassword);
				
				if(file != null ) {
					String fileUrl = StringUtils.cleanPath(file.getOriginalFilename());
					
					newUser.setUser_photo(fileUrl);
					
				}
				
				
				
				if(userService.saveUser(newUser))
					return "redirect:/login?succ=1";
				
				
				return "redirect:/signUp?serr=1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				return "redirect:/signUp?serr=1";
				
			}
			
			
			
		}
		
		
		return "redirect:/signUp?serr=1";
		
	}
	
	
	@GetMapping("/forgotPassword")
	public String forgotPassword() {
		return "forgotPassword";
	}
	
	
	@PostMapping("/changePassword")
	public String changePassword(@RequestParam(name="email",required = true) String email, HttpServletRequest request ) {
		
		String uniqeid = UUID.randomUUID().toString();
		
		HttpSession session = request.getSession(true);
		
		session.setAttribute("lockemail", uniqeid);
		
		session.setMaxInactiveInterval(86400);
		
		
		
		
		if(email != null) {
		
		try {
			
			EmailSender emailSender = new EmailSenderImpl();
			
			emailSender.sendEmailToOnePerson(email, "Sifre Yenileme",
					"Sifre yenileme linkiniz: <a href='http://localhost:8080/user/yenile?email="+email +"&id="+ uniqeid  +"'> buraya </a> tıklayınız");
			
			System.out.println("Mail gitti");
			
			return "redirect:/forgotPassword?succ=1";
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());

			return "redirect:/forgotPassword?err=1";
		}
		
		}
		
		return "redirect:/forgotPassword?err=1";
		
		
	}
	
	
	
}
