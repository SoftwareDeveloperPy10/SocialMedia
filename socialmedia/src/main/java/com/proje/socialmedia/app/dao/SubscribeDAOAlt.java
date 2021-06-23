package com.proje.socialmedia.app.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.proje.socialmedia.app.model.Subscribe;

@Repository
public interface SubscribeDAOAlt{
	
	int getSubcount(int subAccountId);
	
	boolean checkSubscribe(int subAccountId,int subScribeId);
	
	List<Subscribe> getSubList(int subAccountId);
	
	boolean deleteSubAccountAndSubScribe(int userId);
	
}
