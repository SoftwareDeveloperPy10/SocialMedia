package com.proje.socialmedia.app.service;

import java.util.List;

import com.proje.socialmedia.app.model.Subscribe;

public interface SubscribeService {
	
	boolean saveSubscribe(Subscribe subscribe);
	
	boolean updateSubscribe(Subscribe subscribe);
	
	void deleteSubscribe(Subscribe subscribe);
	
	void deleteSubscribeById(int subscribeId);
	
	Subscribe getSubscribeById(int subscribeId);
	
	List<Subscribe> getSubscribeList();
	
	int getSubcount(int subAccountId);
	
	boolean checkSubscribe(int subAccountId,int subScribeId);
	
	List<Subscribe> getSubList(int subAccountId);
	
	
	boolean deleteSubAccountAndSubScribe(int userId);
	
}
