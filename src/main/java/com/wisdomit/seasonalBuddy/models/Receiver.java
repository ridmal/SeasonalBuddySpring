package com.wisdomit.seasonalBuddy.models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name= "reciver")
public class Receiver {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@NotNull
	private String name;
	@NotNull
	private String email;
	
	private String bday;
	
	private String religious;
	
	 @ManyToOne
	 @JoinColumn(name = "user_id")
	 @JsonIgnore
	private User user_reciver;
	
	public User getUser_reciver() {
		return user_reciver;
	}

	public void setUser_reciver(User user_reciver) {
		this.user_reciver = user_reciver;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBday() {
		return bday;
	}
	public void setBday(String bday) {
		this.bday = bday;
	}
	public String getReligious() {
		return religious;
	}
	public void setReligious(String religious) {
		this.religious = religious;
	}
	
	
	

}
