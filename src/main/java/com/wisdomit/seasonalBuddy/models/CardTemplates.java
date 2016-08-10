package com.wisdomit.seasonalBuddy.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="card_template")
public class CardTemplates {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@NotNull
	private int id;
	@NotNull
	private String name;
	@NotNull
	private String path;
	
	private String type;
	@NotNull
	private String date;
	@NotNull
	 @ManyToOne
	 @JoinColumn(name = "cardtemp_event_id")
	 @JsonIgnore
	private Event ctemp_events;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Event getCtemp_events() {
		return ctemp_events;
	}
	public void setCtemp_events(Event ctemp_events) {
		this.ctemp_events = ctemp_events;
	}

	
}
