package com.proje.socialmedia.app.controller;

import java.time.LocalTime;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.proje.socialmedia.app.model.Post;
import com.proje.socialmedia.app.service.FileUploadService;
import com.proje.socialmedia.app.service.PostService;
import com.proje.socialmedia.app.utils.PostType;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostService postService;

	@Autowired
	private FileUploadService fileUploadService;
	
	
	@PostMapping("/postDelete")
	public void postDelete(@RequestBody String dataid) {
		
		if(dataid != null ) {
			
			Integer newId = Integer.parseInt(dataid.split("=")[1]);
			
			
			
			postService.deletePostById(newId);
			
		}
		
	}
	
	
	@PostMapping("/updatePost")
	public String updatePost(@RequestParam(name="photo",required = true) MultipartFile file, @RequestParam(name="content",required = true) String content,
		@RequestParam(name="postid",required = true) String postid,@RequestParam(name="posttype",required = true) String posttype) {
		
		if(content != null  && file != null && postid != null) {
			
			
			int newPostId = Integer.parseInt(postid);
			
			Post post = postService.getPostById(newPostId);
			
			String fileUrl = StringUtils.cleanPath(file.getOriginalFilename());
			
			post.setPost_url(fileUrl);
			
			post.setPost_content(content);
			
			Date date = new Date();
			
			LocalTime time = LocalTime.now();
			
			date.setHours(time.getHour());
			
			date.setMinutes(time.getHour());
			
			date.setSeconds(time.getSecond());
			
			post.setPostdate(date);
			
			switch (posttype) {
			case "IMAGE":
				post.setPosttype(PostType.IMAGE);
				break;
			case "VIDEO":
				post.setPosttype(PostType.VIDEO);
			default:
				break;
			}
			
			
			if(postService.updatePost(post)) {
				
				try {
					fileUploadService.upladFilePost(file);
					
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
	
	
	@PostMapping("/addPost")
	public String addPost(@RequestParam(name="posttype",required = true) String posttype, @RequestParam(name="posturl",required = true) MultipartFile file,
			@RequestParam(name="content",required = true) String content) {
		
		if(posttype != null && file != null && content != null) {
			
			Post newPost = new Post();
			
			switch (posttype) {
			case "IMAGE":
		
				newPost.setPosttype(PostType.IMAGE);
				break;

			default:
				System.out.println("bişey yok");
				break;
			}
			String postUrl= StringUtils.cleanPath(file.getOriginalFilename());
			newPost.setPost_url(postUrl);
			
			Date date = new Date();
			
			LocalTime time =LocalTime.now();
			
			date.setHours(time.getHour());
			
			date.setMinutes(time.getMinute());
			date.setSeconds(time.getSecond());
			
			newPost.setPostdate(date);
			
			
			newPost.setPost_content(content);
			
			if(postService.savePost(newPost)) {
				
				//file upload
				
				try {
					fileUploadService.upladFilePost(file);
					
					return "redirect:/profile?succ=1";
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					System.out.println(e.getMessage());
					return "redirect:/profile?err=1";
				} 
				
				
				
				
			}
			
			
			
		}
		
		
		
		return "redirect:/profile?err=1";
	}
	
	
}
