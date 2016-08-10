package com.wisdomit.seasonalBuddy.DAO;

import org.springframework.data.repository.CrudRepository;

import com.wisdomit.seasonalBuddy.models.Receiver;

public interface ReciverDAO extends CrudRepository<Receiver, Long>{

	public Receiver findByEmail(String email);
}
