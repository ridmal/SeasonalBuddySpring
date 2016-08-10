package com.wisdomit.seasonalBuddy.models;

import java.util.List;




import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="card_clips")
public class CardClips {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@NotNull
	private int id;
	@NotNull
	private String name;
	@NotNull
	private String path;
	
	private String type;

	private String date;
	@NotNull
	 @ManyToOne
	 @JoinColumn(name = "clip_event_id")
	 @JsonIgnore
	private Event clip_events;

	
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
	public String getInsertdate() {
		return date;
	}
	public void setInsertdate(String insertdate) {
		this.date = insertdate;
	}
	public Event getClip_events() {
		return clip_events;
	}
	public void setClip_events(Event clip_events) {
		this.clip_events = clip_events;
	}

}
