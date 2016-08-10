package com.wisdomit.seasonalBuddy.DAO;

import org.springframework.data.repository.CrudRepository;

import com.wisdomit.seasonalBuddy.models.Merchant;

public interface MerchantDAO extends CrudRepository<Merchant, Long>{
	
Merchant findByMunameAndMpass(String muname,String mpass);
Merchant findByMuname(String name);
	
}
