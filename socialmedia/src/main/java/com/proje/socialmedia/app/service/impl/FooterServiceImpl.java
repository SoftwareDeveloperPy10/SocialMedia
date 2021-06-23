package com.proje.socialmedia.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proje.socialmedia.app.dao.FooterDAO;
import com.proje.socialmedia.app.model.Footer;
import com.proje.socialmedia.app.service.FooterService;

@Service
public class FooterServiceImpl implements FooterService{
	
	@Autowired
	private FooterDAO footerDAO;

	@Override
	public boolean saveFooter(Footer footer) {
		// TODO Auto-generated method stub
		footer.setId(0);
		
		return footerDAO.save(footer) != null;
	}

	@Override
	public boolean updateFooter(Footer footer) {
		// TODO Auto-generated method stub
		return footerDAO.save(footer) != null;
	}

	@Override
	public void deleteFooter(Footer footer) {
		// TODO Auto-generated method stub
		footerDAO.delete(footer);
	}

	@Override
	public void deleteFooterById(int footerId) {
		// TODO Auto-generated method stub
		footerDAO.deleteById(footerId);
	}

	@Override
	public Footer getFooterById(int footerId) {
		// TODO Auto-generated method stub
		return footerDAO.findById(footerId).get();
	}
	
	
	
	
}
