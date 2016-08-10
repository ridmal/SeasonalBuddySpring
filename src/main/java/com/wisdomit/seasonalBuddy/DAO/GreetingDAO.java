package com.wisdomit.seasonalBuddy.DAO;

import org.springframework.data.repository.CrudRepository;

import com.wisdomit.seasonalBuddy.models.Greeting;




public interface GreetingDAO extends CrudRepository<Greeting, Long>{

	public Greeting findByid(Long id);
	
}
