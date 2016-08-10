package com.wisdomit.seasonalBuddy.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.wisdomit.seasonalBuddy.models.CardClips;
import com.wisdomit.seasonalBuddy.models.CardTemplates;
import com.wisdomit.seasonalBuddy.models.Event;

public interface CardTemplatesDAO extends CrudRepository<CardTemplates, Long>{

	@Query("SELECT temp from CardTemplates temp ORDER BY temp.id DESC")
	List<CardTemplates> findAllBydesc();
	
	@Query("SELECT temp FROM CardTemplates temp where temp.ctemp_events = :e ORDER BY temp.id DESC") 
    List<CardTemplates> findTempsByevent(@Param("e") Event e);
}
