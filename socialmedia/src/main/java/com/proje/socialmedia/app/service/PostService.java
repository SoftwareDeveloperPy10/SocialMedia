package com.proje.socialmedia.app.service;

import java.util.List;

import com.proje.socialmedia.app.model.Post;

public interface PostService {
	
	boolean savePost(Post post);
	
	boolean updatePost(Post post);
	
	void deletePost(Post post);
	
	void deletePostById(int postId);
	
	Post getPostById(int postId);
	
	List<Post> getPostList();
	
	
	void deletePost(int postId);
	
}
