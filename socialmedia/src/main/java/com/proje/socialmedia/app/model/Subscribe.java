package com.proje.socialmedia.app.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="subscriber")
public class Subscribe {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int subscriberid;
	
	@ManyToOne
	@JoinColumn(name="subscriber")
	private User subscriber; // kendisini takip eden
	
	@OneToOne
	@JoinColumn(name="subaccount")
	private User subaccount; //takip edilen hesap

	public Subscribe() {
	}

	public int getSubscriberid() {
		return subscriberid;
	}

	public void setSubscriberid(int subscriberid) {
		this.subscriberid = subscriberid;
	}

	public User getSubscriber() {
		return subscriber;
	}

	public void setSubscriber(User subscriber) {
		this.subscriber = subscriber;
	}

	public User getSubaccount() {
		return subaccount;
	}

	public void setSubaccount(User subaccount) {
		this.subaccount = subaccount;
	}

	
	
	

}
