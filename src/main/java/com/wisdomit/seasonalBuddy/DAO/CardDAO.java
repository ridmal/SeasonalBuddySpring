package com.wisdomit.seasonalBuddy.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.wisdomit.seasonalBuddy.models.Cards;
import com.wisdomit.seasonalBuddy.models.Event;

public interface CardDAO extends CrudRepository<Cards, Long> {
     
     Cards findById(int id);
     
     @Query("SELECT c FROM Cards c where c.event_card = :e ORDER BY c.id DESC") 
     List<Cards> findCardsByevent(@Param("e") Event e);   // select card using event
     
     @Query("SELECT c FROM Cards c ORDER BY c.id DESC")
     List<Cards> findAllByDesc();   //get card from decending order
}
