package com.proje.socialmedia.app.service;

import com.proje.socialmedia.app.model.Header;

public interface HeaderService {
	
	boolean saveHeader(Header header);
	
	boolean updateHeader(Header header);
	
	void deleteHeader(Header header);
	
	void deleteHeaderById(int headerId);
	
	Header getHeaderById(int headerId);
	
}
