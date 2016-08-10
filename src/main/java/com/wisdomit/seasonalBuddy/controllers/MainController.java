package com.wisdomit.seasonalBuddy.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wisdomit.seasonalBuddy.DAO.EventDAO;
import com.wisdomit.seasonalBuddy.models.Event;

@Controller
public class MainController {
	
	@Autowired
	private HttpSession httpSession;
	
	@RequestMapping("/index")
	public ModelAndView index(){
		return new ModelAndView("index");
	}
	@RequestMapping("/blog")
	public ModelAndView blog(){
		return new ModelAndView("blog");
	}
	@RequestMapping("/about")
	public ModelAndView about(){
		return new ModelAndView("about");
	}
	@RequestMapping("/merchants")
	public ModelAndView merchants(){
		
		String ses = String.valueOf(httpSession.getAttribute("Session"));
		
		if(ses.equals("null")){
			
			return new ModelAndView("redirect:index");
		}
		
		else{
			
		List<String> a = new ArrayList<String>();
		a.add("100*125");
		a.add("470*450");
		a.add("320*280");
		ModelAndView mv = new ModelAndView("Merchants");
		mv.addObject("addsizes", a);
		
		Iterable<Event> ev = new ArrayList<Event>();
		ev = eventdao.findAll();
		mv.addObject("events",ev);
		
		List<String> b = new ArrayList<String>();
		b.add("For Web Site");
		b.add("Attach to the Seasonal Cards");
		b.add("Popup Addvertisements");
		mv.addObject("addcategory", b);
		
		return mv;
		}
	}
	@RequestMapping("/login")
	public ModelAndView login(){
		return new ModelAndView("login");
	}
	@RequestMapping("/signin")
	public ModelAndView signin(){
		
		ModelAndView mv = new ModelAndView("signin");
		
		List<String> b = new ArrayList<String>();
		b.add("Buddhism");
		b.add("Islam");
		b.add("Hindu");
		b.add("Catholic");
		mv.addObject("religion", b);
		
		return mv;
	}
	@RequestMapping("/merchantsignin")
	public ModelAndView merchantsignin(){
		return new ModelAndView("merchantsignin");
	}
	@RequestMapping("/downloading")
	public ModelAndView logincorrect(){
		return new ModelAndView("downloading");
	}
	
	
	@Autowired
	public EventDAO eventdao;
	
}
