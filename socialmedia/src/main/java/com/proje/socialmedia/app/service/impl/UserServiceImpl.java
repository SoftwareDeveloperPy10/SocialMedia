package com.proje.socialmedia.app.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proje.socialmedia.app.dao.UserAltDAO;
import com.proje.socialmedia.app.dao.UserDAO;
import com.proje.socialmedia.app.dao.impl.UserAltDAOImpl;
import com.proje.socialmedia.app.model.User;
import com.proje.socialmedia.app.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserAltDAO userAltDAO;

	@Override
	public boolean saveUser(User user) {
		// TODO Auto-generated method stub
		
		user.setKullaniciid(0);
		
		
		return userDAO.save(user) != null;
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.save(user) != null;
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		userDAO.delete(user);
		
	}

	@Override
	public void deleteUserById(int userId) {
		// TODO Auto-generated method stub
		userDAO.deleteById(userId);
	}

	@Override
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return userDAO.findById(userId).get();
	}

	@Override
	public List<User> getUsersList() {
		// TODO Auto-generated method stub
		return (List<User>) userDAO.findAll();
	}

	@Override
	public User checkUser(String email, String password) {
		// TODO Auto-generated method stub
		return userAltDAO.checkUser(email, password);
	}

	@Override
	public User getUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userAltDAO.getUserByEmail(email);
	}
	
	
	
	


}
