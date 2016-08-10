package com.wisdomit.seasonalBuddy.models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="advertisement")
public class Advertisement {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int addid;
	@NotNull
	private String addsize;
	@NotNull
	private String addcategory;
	@NotNull
	private String addname;

	public String getAddname() {
		return addname;
	}
	public void setAddname(String addname) {
		this.addname = addname;
	}
	private String addevent;
	
	private String addpath;

	public String getAddpath() {
		return addpath;
	}
	public void setAddpath(String addpath) {
		this.addpath = addpath;
	}
	public Merchant getMerchants() {
		return merchants;
	}
	public void setMerchants(Merchant merchants) {
		this.merchants = merchants;
	}
	private String message;

	 @ManyToOne
	 @JoinColumn(name = "merchant_id")
	 @JsonIgnore
	private Merchant merchants;
	 
	 
	public int getAddid() {
		return addid;
	}
	public void setAddid(int addid) {
		this.addid = addid;
	}
	public String getAddsize() {
		return addsize;
	}
	public void setAddsize(String addsize) {
		this.addsize = addsize;
	}
	public String getAddcategory() {
		return addcategory;
	}
	public void setAddcategory(String addcategory) {
		this.addcategory = addcategory;
	}
	public String getAddevent() {
		return addevent;
	}
	public void setAddevent(String addevent) {
		this.addevent = addevent;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	
}
