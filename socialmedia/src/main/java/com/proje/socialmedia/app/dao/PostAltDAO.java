package com.proje.socialmedia.app.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface PostAltDAO {
	
	void deletePost(int postId);

}
