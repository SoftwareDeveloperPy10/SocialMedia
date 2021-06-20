package com.proje.socialmedia.app.service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	public void uploadFile(MultipartFile file) throws IllegalStateException, IOException {
			
		file.transferTo(new File("C:\\wamp64\\www\\socialmedia\\socialmedia\\src\\main\\resources\\static\\images\\userimages\\"+file.getOriginalFilename()));
		
		
		
		
	}
	
	public void upladFilePost(MultipartFile file) throws IllegalStateException, IOException {
		file.transferTo(new File("C:\\wamp64\\www\\socialmedia\\socialmedia\\src\\main\\resources\\static\\images\\postimages\\"+file.getOriginalFilename()));
		
	}
	
	
	
}
