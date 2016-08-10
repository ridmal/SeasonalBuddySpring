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
@Table(name="games")
public class Games {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@NotNull
	private int id;
	@NotNull
	private String name;
	@NotNull
	private String apkpath;
	
	@NotNull
	private String path;
	
	private String type;
	@NotNull
	private String date;
	@NotNull
	 @ManyToOne
	 @JoinColumn(name = "game_event_id")
	 @JsonIgnore
	private Event game_events;
	
	
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
	public String getApkpath() {
		return apkpath;
	}
	public void setApkpath(String apkpath) {
		this.apkpath = apkpath;
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
	public Event getGame_events() {
		return game_events;
	}
	public void setGame_events(Event game_events) {
		this.game_events = game_events;
	}
}
