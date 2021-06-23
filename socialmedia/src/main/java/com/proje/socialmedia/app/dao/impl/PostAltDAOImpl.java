package com.proje.socialmedia.app.dao.impl;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.proje.socialmedia.app.dao.PostAltDAO;

@Component
public class PostAltDAOImpl implements PostAltDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void deletePost(int postId) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		
		Transaction transaction =session.beginTransaction();
		
		TypedQuery query = session.createQuery("delete from Post postid= :id");
		
		query.setParameter("id",postId);
		
		query.executeUpdate();
		
		transaction.commit();
		
		session.close();
		
		
	}
	
	
	
	
	
}
