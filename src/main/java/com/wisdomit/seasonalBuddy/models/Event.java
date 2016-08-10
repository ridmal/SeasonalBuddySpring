package com.wisdomit.seasonalBuddy.models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import java.util.Set;

@Entity
@Table(name="event")
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@NotNull
	private String date;
	@NotNull
	private String name;
	
	@OneToMany(mappedBy = "event_card", cascade = CascadeType.ALL)
	private Set<Cards> cards;
	 @OneToMany(mappedBy = "clip_events", cascade = CascadeType.ALL)
	private Set<CardClips> clips;
	
	 @OneToMany(mappedBy = "ctemp_events", cascade = CascadeType.ALL)
	private Set<CardTemplates> ctemps;
	 
	 @OneToMany(mappedBy = "game_events", cascade = CascadeType.ALL)
	private Set<Games> games;
	 
	public Set<CardTemplates> getCtemps() {
		return ctemps;
	}
	public void setCtemps(Set<CardTemplates> ctemps) {
		this.ctemps = ctemps;
	}
	public Set<Games> getGames() {
		return games;
	}
	public void setGames(Set<Games> games) {
		this.games = games;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public Set<Cards> getCards() {
		return cards;
	}
	public void setCards(Set<Cards> cards) {
		this.cards = cards;
	}
	public Set<CardClips> getClips() {
		return clips;
	}
	public void setClips(Set<CardClips> clips) {
		this.clips = clips;
	}
	
}
