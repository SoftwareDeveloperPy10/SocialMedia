package com.proje.socialmedia.app.dao.impl;

import javax.persistence.TypedQuery;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Component;

import com.proje.socialmedia.app.dao.UserAltDAO;
import com.proje.socialmedia.app.model.User;

@Component
public class UserAltDAOImpl implements UserAltDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	static Logger log = Logger.getLogger(UserAltDAOImpl.class.getName());

	@Override
	public User checkUser(String email, String password) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		
		TypedQuery<User> query = session.createQuery("select u from kullanici u where u.useremail= :email AND u.user_password= :password ");
		
		query.setParameter("email", email);
		
		query.setParameter("password", password);
	
		System.out.println(password);
		User user = null;
		try {
			user = query.getSingleResult();
			
		
		} catch (Exception e) {
			
			//log.error("Kullanıcı Sorgulanırken hata meydana geldi ve yakalndı "+e.getMessage());
			// TODO: handle exception
			System.out.println(e.getMessage());
			
		}
		
		
		
		session.close();
		
		return user;
	}
	
	
	
	
}
