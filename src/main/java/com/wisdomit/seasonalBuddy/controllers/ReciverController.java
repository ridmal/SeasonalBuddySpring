package com.wisdomit.seasonalBuddy.controllers;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisdomit.seasonalBuddy.DAO.ReciverDAO;
import com.wisdomit.seasonalBuddy.models.Receiver;

@Controller
public class ReciverController {
	
	@RequestMapping(value="/savereciver", method=RequestMethod.POST)
	@ResponseBody
	public String savereciver(@RequestParam("name") String rname,@RequestParam("email") String rmail){
		//String email = reciver.getEmail();
		   // User u = userDao.findByEmail(email);
		Receiver r = reciverdao.findByEmail(rmail);
		    String a;
		    if(r==null){
		    	Receiver newr = new Receiver();
		    	newr.setEmail(rmail);
		    	newr.setName(rname);
		     reciverdao.save(newr);
		   a= "User succesfully created! (id = " + newr.getId() + ") + name = "+ newr.getName()+ ")";
		  }
		 else
			 a= "user is already exist";
		 return a;
	}
	
	@Autowired
	private ReciverDAO reciverdao;
}
