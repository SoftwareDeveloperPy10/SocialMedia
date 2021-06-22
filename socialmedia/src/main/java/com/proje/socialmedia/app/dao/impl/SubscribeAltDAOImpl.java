package com.proje.socialmedia.app.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.proje.socialmedia.app.dao.SubscribeDAOAlt;
import com.proje.socialmedia.app.model.Subscribe;




@Component
public class SubscribeAltDAOImpl implements SubscribeDAOAlt{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public int getSubcount(int subAccountId) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		
		TypedQuery<Subscribe> query = session.createQuery("select s from Subscribe s where s.subscriber.kullaniciid= :id");
		
		query.setParameter("id",subAccountId);
		
		List<Subscribe> list = query.getResultList();
		
	
		
		session.close();
		
		return list.isEmpty() ? 0 : list.size();
	}

	@Override
	public boolean checkSubscribe(int subAccountId, int subScribeId) {
		// TODO Auto-generated method stub
		
		
		Subscribe sub= null;
		
		try {
			Session session = sessionFactory.openSession();
			TypedQuery<Subscribe> query = session
					.createQuery(" select s from Subscribe s where s.subscriber.kullaniciid= :scribe AND s.subaccount.kullaniciid= :account ");
			query.setParameter("scribe", subScribeId);
			
			query.setParameter("account",subAccountId);
			sub = query.getSingleResult();
			
			session.close();
			
			
			return sub != null;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Hatanın kaynagı "+e.getMessage());
			return false;
		}
		
		

		
		
	}

	@Override
	public List<Subscribe> getSubList(int subAccountId) {
		// TODO Auto-generated method stub
		
		
		
		List<Subscribe> subList= null;
		
		
		try {
			Session session = sessionFactory.openSession();
			TypedQuery<Subscribe> query = session.createQuery("select s from Subscribe s where s.subscriber.kullaniciid= :subId");
			
			query.setParameter("subId", subAccountId);
			
			subList = query.getResultList();
			
		
			
			session.close();
			
			return subList;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			
			return subList;
		}
		
		
	
	}
	
	
	
	
}
