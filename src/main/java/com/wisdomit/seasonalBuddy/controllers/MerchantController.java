package com.wisdomit.seasonalBuddy.controllers;



import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import javassist.expr.NewArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wisdomit.seasonalBuddy.Application;
import com.wisdomit.seasonalBuddy.DAO.MerchantDAO;
import com.wisdomit.seasonalBuddy.DAO.UserDAO;
import com.wisdomit.seasonalBuddy.models.Merchant;
import com.wisdomit.seasonalBuddy.models.User;

@Controller
public class MerchantController {
	
	@Autowired
	private HttpSession httpSession;
	
	@RequestMapping(value="/merchantsavedata",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView newuser(@ModelAttribute("merchant") Merchant merchant,@RequestParam("uname") String uname,BindingResult result){
		
	User a = userdao.findByUname(uname);
	
	if(a==null){
		ModelAndView mv = new ModelAndView("merchantsignin");
		mv.addObject("merchant","Seasonal Buddy username is not valid");
		return mv;
		
	}
	else if(result.hasErrors()){
		ModelAndView mv = new ModelAndView("merchantsignin");
		mv.addObject("merchant","Signin is not success . . please try again");
		return mv;
	}
	else{
		merchant.setUser(a);
		String p = merchant.getMpass();
		String enp = new BCryptPasswordEncoder().encode(p);
		merchant.setMpass(enp);
		merchantdao.save(merchant);
		ModelAndView mv = new ModelAndView("redirect:merchants");
		return mv;
	}
		
	}
	
	@RequestMapping(value="/merchantlogin",method = RequestMethod.POST, produces="application/json")
	@ResponseBody
	public ModelAndView userdetail(@RequestParam("muname") String muname,@RequestParam("mpass") String mpass){
		
		Merchant merchant = merchantdao.findByMuname(muname);
		//Merchant merchant = merchantdao.findByMunameAndMpass(muname, mpass);
		
		boolean a = new BCryptPasswordEncoder().matches(mpass,merchant.getMpass());
		if(a){
          httpSession.setAttribute("Session", merchant.getMerchantid());
			
			return new ModelAndView("redirect:merchants");
			
		}
		else{
			return new ModelAndView("index");
			
		}
	}
	
	
	@RequestMapping(value="/sendcardtousers",method = RequestMethod.POST, produces="application/json")
	@ResponseBody
	public ModelAndView sendcardtouser(@RequestParam("c_name") String cname,@RequestParam("event") String event,
			@RequestParam("card_image") MultipartFile fileupload,@RequestParam("numofusers") int numofusers,
			@RequestParam("amsg") String amsg,@RequestParam("date") String date) throws Exception{
		
		//String a;
		String name = cname+event;
		String filel = name+".jpg";
	
		if (fileupload != null) {
			 BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream("src/main/resources/public/SendingCards/"+filel));
	         FileCopyUtils.copy(fileupload.getInputStream(), stream);
				stream.close();
				stream.flush();
				}
		else{
			return new ModelAndView("redirect:merchants");
			}
		
		
		
		List<User> users = new ArrayList<User>();
		switch(event){
		case "Birthday":users=userdao.findByBday(date);break;
		case "Sinhala_hindu_NewYear":users = userdao.findByReligious("Buddhism");break;
		case "Christmas":users = userdao.findByReligious("Catholic");break;
		case "Vesak_Festival":users = userdao.findByReligious("Buddhism");break;
		case "Ramazan":users = userdao.findByReligious("Islam");break;
		case "Thaipongal":users = userdao.findByReligious("Hindu");break;
		default:users = userdao.findAll();
		}
	List<User> ab = new ArrayList<User>();
	int a = users.size();
	if(a<numofusers){
		for(int i=0;i<a;i++){
			User u = users.get(i);
			ab.add(u);
			try{
			notificationService.sendNotificaitoin(u,filel, amsg,event);
		}catch( Exception e ){
			// catch error
			logger.info("Error Sending Email: " + e.getMessage());
		}
	}
	}
		else{
		for(int i=0;i<numofusers;i++){
			User u = users.get(i);
			ab.add(u);
			try{
			notificationService.sendNotificaitoin(u,filel, amsg,event);	
			}catch( Exception e ){
				// catch error
				logger.info("Error Sending Email: " + e.getMessage());
			}
		}
		}

		ModelAndView mv = new ModelAndView("result");
		mv.addObject("path", filel);
		mv.addObject("cname",cname);
		mv.addObject("event", event);
		mv.addObject("msg", amsg);
		mv.addObject("users", ab);
		
		
	return mv;
		
	}
	
	@Autowired
	public UserDAO userdao;
	
	@Autowired
	public MerchantDAO merchantdao;
	private Logger logger = LoggerFactory.getLogger(Application.class);
	
	@Autowired
	private com.wisdomit.seasonalBuddy.Services.NotificationService notificationService;
	
}
