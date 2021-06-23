package com.proje.socialmedia.app.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="header")
public class Header {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int headerid;
	
	private String brand;

	public Header() {
	}

	public int getHeaderid() {
		return headerid;
	}

	public void setHeaderid(int headerid) {
		this.headerid = headerid;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	
	
	
}
