package com.wisdomit.seasonalBuddy.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="greeting")
public class Greeting {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@NotNull
    private long id;
	
	@NotNull
    private String name;
	
    private String msg;
    private String username;
    private String email;
	
	public long getId() {
        return id;
    }

   

	public void setId(long id) {
        this.id = id;
    }



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}

  
}
