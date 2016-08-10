package com.wisdomit.seasonalBuddy.DAO;

import org.springframework.data.repository.CrudRepository;

import com.wisdomit.seasonalBuddy.models.Advertisement;

public interface AdvertisementDAO extends CrudRepository<Advertisement, Long> {	
}
