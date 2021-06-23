package com.proje.socialmedia.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proje.socialmedia.app.dao.HeaderDAO;
import com.proje.socialmedia.app.model.Header;
import com.proje.socialmedia.app.service.HeaderService;

@Service
public class HeaderServiceImpl implements HeaderService{

	@Autowired
	private HeaderDAO headerDAO;

	@Override
	public boolean saveHeader(Header header) {
		// TODO Auto-generated method stub
		header.setHeaderid(0);
		return headerDAO.save(header) != null;
	}

	@Override
	public boolean updateHeader(Header header) {
		// TODO Auto-generated method stub
		return headerDAO.save(header) != null;
	}

	@Override
	public void deleteHeader(Header header) {
		// TODO Auto-generated method stub
		headerDAO.delete(header);
	}

	@Override
	public void deleteHeaderById(int headerId) {
		// TODO Auto-generated method stub
		headerDAO.deleteById(headerId);
	}

	@Override
	public Header getHeaderById(int headerId) {
		// TODO Auto-generated method stub
		return headerDAO.findById(headerId).get();
	}
	
	
	
}
