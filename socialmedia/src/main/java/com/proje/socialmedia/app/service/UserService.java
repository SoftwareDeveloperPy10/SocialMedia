package com.proje.socialmedia.app.service;

import java.util.List;

import com.proje.socialmedia.app.model.User;

public interface UserService {
	
	boolean saveUser(User user);
	
	boolean updateUser(User user);
	
	void deleteUser(User user);
	
	void deleteUserById(int userId);
	
	User getUserById(int userId);
	
	List<User> getUsersList();
	
	User checkUser(String email,String password);
	
	
	User getUserByEmail(String email);
	
}
