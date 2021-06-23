package com.proje.socialmedia.app.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.List;

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

import com.proje.socialmedia.app.model.Admin;
import com.proje.socialmedia.app.model.Footer;
import com.proje.socialmedia.app.model.Header;
import com.proje.socialmedia.app.model.Post;
import com.proje.socialmedia.app.model.User;
import com.proje.socialmedia.app.service.AdminService;
import com.proje.socialmedia.app.service.FooterService;
import com.proje.socialmedia.app.service.HeaderService;
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
	
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private HeaderService headerService;
	
	
	@Autowired
	private FooterService footerService;
	
	
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
	
	@GetMapping("/myInfo")
	public String myInfo() {
		return "admin/adminInfo";
	}
	
	
	@PostMapping("/saveInfo")
	public String saveInfo(@RequestParam(name="pass",required = true) String pass,@RequestParam(name="photo",required = true) MultipartFile file) {
		
		if(pass != null && file != null) {
			
			String fileUrl = StringUtils.cleanPath(file.getOriginalFilename());
			
			MessageDigest md;
			
			try {
				
				md = MessageDigest.getInstance("MD5");
				
				byte[] arr= md.digest(pass.getBytes());
				
				BigInteger password = new BigInteger(1,arr);
				
				String hashPassword = password.toString();
				
				Admin admin = adminService.getAdminById(1); //this usage have to be change because we looking for admin with session
				
				admin.getUser().setUser_password(hashPassword);
				
				admin.getUser().setUser_photo(fileUrl);
				
				adminService.updateAdmin(admin);
				
				return "redirect:/admin/myInfo?succ=1";
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
				return "redirect:/admin/myInfo?err=1";
			}
			
			
		}else {
			return "redirect:/admin/myInfo?err=1";
		}
		
		
		
	}
	
	
	 @GetMapping("/headerSettings")
	 public String headerSettings() {
		 return "admin/adminCiteSettingsHeader";
	 }
	
	 
	 @PostMapping("/header")
	 public String header(@RequestParam(name="photo",required = true) MultipartFile file) {
		 
		 if(file != null) {
			 
			 
			 String fileUrl = StringUtils.cleanPath(file.getOriginalFilename());
			 
			 Header header = headerService.getHeaderById(1);
			 
			 header.setBrand(fileUrl);
			 
			 headerService.updateHeader(header);
			 
			 return "redirect:/admin/headerSettings?succ=1";
			 
			 
		 }
		 return "redirect:/admin/headerSettings?err=1";
		 
	 }
	 
	 @GetMapping("/footerSettings")
	 public String footerSettings() {
		 return "admin/footerSettings";
	 }
	 
	 
	 @PostMapping("updateFooter")
	 public String updateFooter(@RequestParam(name="facebook",required = true) String facebook, 
			 @RequestParam(name="gismap") String gismap) {
		 
		 if(facebook != null && gismap != null) {
			 
			 Footer footer = footerService.getFooterById(1);
			 
			 footer.setFacebook(facebook);
			 footer.setGismap(gismap);
			 
			 
			 footerService.updateFooter(footer);
			 
			 return "redirect:/admin/footerSettings?succ=1";
			 
			 
		 }else {
			 return "redirect:/admin/footerSettings?err=1";
			 
		 }
		 
		 
	 }
	 
}
