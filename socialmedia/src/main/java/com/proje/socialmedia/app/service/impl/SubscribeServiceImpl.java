package com.proje.socialmedia.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proje.socialmedia.app.dao.SubscribeDAO;
import com.proje.socialmedia.app.dao.SubscribeDAOAlt;
import com.proje.socialmedia.app.model.Subscribe;
import com.proje.socialmedia.app.service.SubscribeService;

@Service
public class SubscribeServiceImpl implements SubscribeService{
	
	@Autowired
	private SubscribeDAO subscribeDAO;
	
	@Autowired
	private SubscribeDAOAlt altDAO;

	@Override
	public boolean saveSubscribe(Subscribe subscribe) {
		// TODO Auto-generated method stub
		subscribe.setSubscriberid(0);
		return subscribeDAO.save(subscribe) != null;
	}

	@Override
	public boolean updateSubscribe(Subscribe subscribe) {
		// TODO Auto-generated method stub
		return subscribeDAO.save(subscribe) != null;
	}

	@Override
	public void deleteSubscribe(Subscribe subscribe) {
		// TODO Auto-generated method stub
		
		subscribeDAO.delete(subscribe);
		
	}

	@Override
	public void deleteSubscribeById(int subscribeId) {
		// TODO Auto-generated method stub
		subscribeDAO.deleteById(subscribeId);
	}

	@Override
	public Subscribe getSubscribeById(int subscribeId) {
		// TODO Auto-generated method stub
		return subscribeDAO.findById(subscribeId).get();
	}

	@Override
	public List<Subscribe> getSubscribeList() {
		// TODO Auto-generated method stub
		return (List<Subscribe>) subscribeDAO.findAll();
	}

	@Override
	public int getSubcount(int subAccountId) {
		// TODO Auto-generated method stub
		return altDAO.getSubcount(subAccountId);
	}

	@Override
	public boolean checkSubscribe(int subAccountId, int subScribeId) {
		// TODO Auto-generated method stub
		return altDAO.checkSubscribe(subAccountId, subScribeId);
	}
	
	
	
	
}
