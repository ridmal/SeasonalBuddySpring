package com.wisdomit.seasonalBuddy.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.wisdomit.seasonalBuddy.models.CardClips;
import com.wisdomit.seasonalBuddy.models.Cards;
import com.wisdomit.seasonalBuddy.models.Event;

public interface CardClipDAO extends CrudRepository<CardClips, Long> {
	 
	
	@Query("SELECT b FROM CardClips b INNER JOIN b.clip_events c WHERE c = (:clip_events)") 
	     List<CardClips> findClipsByevent(@Param("clip_events") List<Event> e);
	
	   
    @Query("SELECT c FROM CardClips c where c.clip_events = :e ORDER BY c.id DESC") 
    List<CardClips> findClipsByevent(@Param("e") Event e);
    
    @Query("SELECT d FROM CardClips d ORDER BY d.id DESC")
    List<CardClips> findClipsDesending();
}
