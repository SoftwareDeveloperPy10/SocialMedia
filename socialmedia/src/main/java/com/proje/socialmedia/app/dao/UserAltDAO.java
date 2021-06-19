package com.proje.socialmedia.app.dao;

import org.springframework.stereotype.Repository;

import com.proje.socialmedia.app.model.User;

@Repository
public interface UserAltDAO {
	
	User checkUser(String email,String password);
	
	
}
