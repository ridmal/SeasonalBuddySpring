package com.wisdomit.seasonalBuddy.models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="cards")
public class Cards {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@NotNull
	@Column(name="id")
	private int id;
	@NotNull
	@Column(name="name")
	private String name;
	@NotNull
	@Column(name="path")
	private String path;
	@NotNull
	@Column(name="date")
	private String date;
	@NotNull
	@Column(name="type")
	private String type;
	 @ManyToOne
	 @JoinColumn(name = "card_event_id")
	 @JsonIgnore
	private Event event_card;
	 
	 @ManyToOne
	 @JoinColumn(name ="user_id")
	 @JsonIgnore
	 private User user;

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Event getEvent_card() {
		return event_card;
	}
	public void setEvent_card(Event event_card) {
		this.event_card = event_card;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

}
