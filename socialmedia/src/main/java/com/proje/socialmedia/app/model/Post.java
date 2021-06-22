package com.proje.socialmedia.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.proje.socialmedia.app.utils.PostType;

@Entity
@Table(name="post")
public class Post {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int postid;
	
	@Enumerated(EnumType.STRING)
	private PostType posttype;
	
	@Column(length = 80)
	private String post_content;
	
	@Column(length = 255)
	private String post_url;

	
	@Temporal(TemporalType.TIMESTAMP)
	private Date postdate;
	
	@ManyToOne
	@JoinColumn(name="kullaniciid")
	private User user;
	
	public Post() {
	}

	
	
	
	public User getUser() {
		return user;
	}




	public void setUser(User user) {
		this.user = user;
	}




	public Date getPostdate() {
		return postdate;
	}




	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}




	public int getPostid() {
		return postid;
	}


	public void setPostid(int postid) {
		this.postid = postid;
	}


	public PostType getPosttype() {
		return posttype;
	}


	public void setPosttype(PostType posttype) {
		this.posttype = posttype;
	}


	public String getPost_content() {
		return post_content;
	}


	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}


	public String getPost_url() {
		return post_url;
	}


	public void setPost_url(String post_url) {
		this.post_url = post_url;
	}
	
	
	
	
}
