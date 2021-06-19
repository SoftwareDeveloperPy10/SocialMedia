package com.proje.socialmedia.app.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.proje.socialmedia.app.model.User;

@Repository
public interface UserDAO extends CrudRepository<User, Integer>{
	
	
}
