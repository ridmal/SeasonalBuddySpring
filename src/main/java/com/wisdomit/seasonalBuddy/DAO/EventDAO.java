package com.wisdomit.seasonalBuddy.DAO;

import org.springframework.data.repository.CrudRepository;

import com.wisdomit.seasonalBuddy.models.Event;

public interface EventDAO extends CrudRepository<Event, Long> {
	
 Event findByName(String name);
 Event findById(int id);
 
}
