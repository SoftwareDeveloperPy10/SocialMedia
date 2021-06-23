package com.proje.socialmedia.app.dao.impl;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.proje.socialmedia.app.dao.AdminAltDAO;
import com.proje.socialmedia.app.model.Admin;

@Component
public class AdminAltDAOImpl implements AdminAltDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean checkAdmin(String email, String password) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		
		TypedQuery<Admin> query = session.createQuery("select a from Admin a where a.user.useremail= :email AND a.user.user_password= :password");
		
		query.setParameter("email",email );
		query.setParameter("password", password);
		Admin admin= null;
		try {
			admin = query.getSingleResult();
			session.close();
			return admin != null;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		
		
		
		
		
	}
	
	
	
	
}
