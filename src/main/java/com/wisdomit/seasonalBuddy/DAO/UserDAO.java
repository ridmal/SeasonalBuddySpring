package com.wisdomit.seasonalBuddy.DAO;



import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.wisdomit.seasonalBuddy.models.User;

public interface UserDAO extends CrudRepository<User, Long> {

	List<User> findByUnameAndPass(String uname,String pass);
//User findById();
	User findByUname(String name);
	List<User> findByReligious(String religious);
	List<User> findByBday(String bday); 
	List<User> findAll();
}
