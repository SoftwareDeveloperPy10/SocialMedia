package com.proje.socialmedia.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proje.socialmedia.app.dao.PostAltDAO;
import com.proje.socialmedia.app.dao.PostDAO;
import com.proje.socialmedia.app.model.Post;
import com.proje.socialmedia.app.service.PostService;

@Service
public class PostServiceImpl implements PostService{

	@Autowired
	private PostDAO postDAO;

	 @Autowired 
	 private PostAltDAO altDAO;
	
	@Override
	public boolean savePost(Post post) {
		// TODO Auto-generated method stub
		post.setPostid(0);
		
		return postDAO.save(post) != null;
	}

	@Override
	public boolean updatePost(Post post) {
		// TODO Auto-generated method stub
		return postDAO.save(post) != null ;
	}

	@Override
	public void deletePost(Post post) {
		// TODO Auto-generated method stub
		postDAO.delete(post);
	}

	@Override
	public void deletePostById(int postId) {
		// TODO Auto-generated method stub
		postDAO.deleteById(postId);
	}

	@Override
	public Post getPostById(int postId) {
		// TODO Auto-generated method stub
		return postDAO.findById(postId).get();
	}

	@Override
	public List<Post> getPostList() {
		// TODO Auto-generated method stub
		return (List<Post>) postDAO.findAll();
	}

	@Override
	public void deletePost(int postId) {
		// TODO Auto-generated method stub
		
		altDAO.deletePost(postId);
		
	}
	
	
	
	
	
}
