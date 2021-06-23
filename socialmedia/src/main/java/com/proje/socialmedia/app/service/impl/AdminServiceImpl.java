package com.proje.socialmedia.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proje.socialmedia.app.dao.AdminDAO;
import com.proje.socialmedia.app.model.Admin;
import com.proje.socialmedia.app.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public boolean saveAdmin(Admin admin) {
		// TODO Auto-generated method stub
		admin.setAdminid(0);
		return adminDAO.save(admin) != null;
	}

	@Override
	public boolean updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDAO.save(admin) != null;
	}

	@Override
	public void deleteAdmin(Admin admin) {
		// TODO Auto-generated method stub
		
		adminDAO.delete(admin);
		
	}

	@Override
	public void deleteAdminById(int adminId) {
		// TODO Auto-generated method stub
		adminDAO.deleteById(adminId);
	}

	@Override
	public List<Admin> getAdminList() {
		// TODO Auto-generated method stub
		return (List<Admin>) adminDAO.findAll();
	}

	@Override
	public Admin getAdminById(int adminId) {
		// TODO Auto-generated method stub
		return adminDAO.findById(adminId).get();
	}
	
	
	
	
}
