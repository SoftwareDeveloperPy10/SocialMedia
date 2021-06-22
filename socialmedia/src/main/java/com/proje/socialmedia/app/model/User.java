package com.proje.socialmedia.app.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name="kullanici")
@Table(name="kullanici")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int kullaniciid;
	
	@Column(length = 50,nullable = false)
	private String username;
	
	@Column(length = 60,nullable = false,unique = true)
	private String useremail;
	
	@Column(length = 100,nullable = false)
	private String user_password;
	
	@Column(length = 255,nullable = false)
	private String user_photo;
	
	@Temporal(TemporalType.DATE)
	private Date user_bof;
	
	@OneToMany(mappedBy = "subscriber")
	private List<Subscribe> subscribeList;

	
	@OneToMany(mappedBy = "user")
	private List<Post> postList;
	
	public User() {
	
	}
	
	

	public List<Post> getPostList() {
		return postList;
	}



	public void setPostList(List<Post> postList) {
		this.postList = postList;
	}



	public int getKullaniciid() {
		return kullaniciid;
	}

	public void setKullaniciid(int kullaniciid) {
		this.kullaniciid = kullaniciid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}



	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}

	public Date getUser_bof() {
		return user_bof;
	}

	public void setUser_bof(Date user_bof) {
		this.user_bof = user_bof;
	}

	public List<Subscribe> getSubscribeList() {
		return subscribeList;
	}

	public void setSubscribeList(List<Subscribe> subscribeList) {
		this.subscribeList = subscribeList;
	}
	
	
	
	
	
}
