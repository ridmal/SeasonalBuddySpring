package com.wisdomit.seasonalBuddy.models;

import java.util.List;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
private int id;
	
	@NotNull
private String name;
	@NotNull
private String uname;
@NotNull
private String pass;
	
private String email;

private String bday;

private String religious;

@OneToMany(mappedBy = "user_reciver", cascade = CascadeType.ALL)
private List<Receiver> reciver;


public List<Receiver> getReciver() {
	return reciver;
}

public void setReciver(List<Receiver> reciver) {
	this.reciver = reciver;
}

@OneToOne(mappedBy = "user")
private Merchant merchant;

@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
private List<Cards> cards;

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
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}

public List<Cards> getCards() {
	return cards;
}

public void setCards(List<Cards> cards) {
	this.cards = cards;
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
public Merchant getMerchant() {
	return merchant;
}

public void setMerchant(Merchant merchant) {
	this.merchant = merchant;
}

}
