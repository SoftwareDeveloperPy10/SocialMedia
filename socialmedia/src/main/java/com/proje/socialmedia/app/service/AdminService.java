package com.proje.socialmedia.app.service;

import java.util.List;

import com.proje.socialmedia.app.model.Admin;

public interface AdminService {
	
	boolean saveAdmin(Admin admin);
	
	boolean updateAdmin(Admin admin);
	
	void deleteAdmin(Admin admin);
	
	void deleteAdminById(int adminId);
	
	List<Admin> getAdminList();
	
	Admin getAdminById(int adminId);
	
	
}
