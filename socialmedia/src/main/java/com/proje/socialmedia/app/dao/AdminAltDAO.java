package com.proje.socialmedia.app.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface AdminAltDAO {
	
	boolean checkAdmin(String email,String password);
	
}
