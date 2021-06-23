package com.proje.socialmedia.app.service;

import com.proje.socialmedia.app.model.Footer;

public interface FooterService {
	
	boolean saveFooter(Footer footer);
	
	boolean updateFooter(Footer footer);
	
	void deleteFooter(Footer footer);
	
	void deleteFooterById(int footerId);
	
	
	Footer getFooterById(int footerId);
	
	
	
	
	
}
