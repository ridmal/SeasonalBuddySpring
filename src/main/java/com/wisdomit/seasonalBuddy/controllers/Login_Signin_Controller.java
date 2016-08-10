package com.wisdomit.seasonalBuddy.controllers;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationHome;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;

import com.google.common.collect.Lists;
import com.wisdomit.seasonalBuddy.Application;
import com.wisdomit.seasonalBuddy.DAO.CardDAO;
import com.wisdomit.seasonalBuddy.DAO.EventDAO;
import com.wisdomit.seasonalBuddy.DAO.GreetingDAO;
import com.wisdomit.seasonalBuddy.DAO.UserDAO;
import com.wisdomit.seasonalBuddy.models.Cards;
import com.wisdomit.seasonalBuddy.models.Event;
import com.wisdomit.seasonalBuddy.models.Greeting;
import com.wisdomit.seasonalBuddy.models.User;


@Controller    
public class Login_Signin_Controller {
@RequestMapping("/form")
public ModelAndView greeting(){
	return new ModelAndView("result");
}

@RequestMapping(value="/giveresult" ,method = RequestMethod.GET)
@ResponseBody
public ModelAndView setresult(){
//	Greeting g = new Greeting();
//	g.setId(3);
//	g.setContent("dshc");
//	g.setAddress("vhfvkfj");
	Iterable<Event> ev = new ArrayList<Event>();
	ev = eventdao.findAll();
//	
	Iterable<Cards> lg = new ArrayList<Cards>();
lg = carddao.findAll();
	ModelAndView mv = new ModelAndView("SasonalCards");
	mv.addObject("res", lg);
	mv.addObject("events",ev);
	return mv;
}

@RequestMapping(value="/userinsertdata",method = RequestMethod.POST)
@ResponseBody
public ModelAndView newuser(@ModelAttribute("user") User user,BindingResult result){
	
	String uname = user.getUname();
	User u = userdao.findByUname(uname);
	
 if(u==null){	
	String a = user.getPass();
	String newpass = new BCryptPasswordEncoder().encode(a);
	user.setPass(newpass);
	userdao.save(user);
	return new ModelAndView("redirect:index");
	}
else
return new ModelAndView("redirect:signin");
}
//}


@RequestMapping(value="/CheckUserName", method = RequestMethod.POST)
public @ResponseBody String checkClientUserName(@ModelAttribute("user") User user){
	
	Integer num;
	String uname = user.getUname();
	User u = userdao.findByUname(uname);
	
	
		return uname+"shaki";

}
	

@RequestMapping(value="/usergetdata",method = RequestMethod.POST)
@ResponseBody
public ModelAndView userdetail(@RequestParam("uname") String uname,@RequestParam("pass") String pass){
	String enpass = new BCryptPasswordEncoder().encode(pass);
	User userl = userdao.findByUname(uname);
	System.out.println(enpass);
	boolean a = new BCryptPasswordEncoder().matches(pass,userl.getPass());
	if(a){
		return new ModelAndView("redirect:gamedownload");
	}
	else{
	return new ModelAndView("redirect:index");
	}
	
}
@RequestMapping(value="/uploadimage",method = RequestMethod.GET)
@ResponseBody
public ModelAndView uimagepage(){
	return new ModelAndView("imageupload");
}


@RequestMapping(value = "gamedownload" , method = RequestMethod.GET) // download file
	@ResponseBody
	public ModelAndView downloadfile(HttpServletResponse response) throws Exception{ 
		String a = null;
	
		File f = new File("src/main/resources/public/games/app-debug.apk");
		
		   if(!f.exists()){
	           String errorMessage = "Sorry. The file you are looking for does not exist";
	           System.out.println(errorMessage);
	           return new ModelAndView("redirect:index");
		   }
		   else
		   {
			   String mimeType= URLConnection.guessContentTypeFromName(f.getName());
		        if(mimeType==null){
		            System.out.println("mimetype is not detectable, will take default");
		            mimeType = "application/octet-stream";
		        }
		        System.out.println("mimetype : "+mimeType);
		        response.setContentType(mimeType);
		        response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", f.getName()));
		        response.setContentLength((int)f.length());
		        BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(f));
		        FileCopyUtils.copy(inputStream, response.getOutputStream());
		        inputStream.close();
		        return new ModelAndView("redirect:downloading");
		    }
		
		
	}


@Autowired
private EventDAO eventdao;
@Autowired
private UserDAO userdao;
@Autowired
private CardDAO carddao;
@Autowired
private GreetingDAO greetingdao;
}
