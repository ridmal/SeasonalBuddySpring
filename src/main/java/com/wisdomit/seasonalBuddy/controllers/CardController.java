package com.wisdomit.seasonalBuddy.controllers;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import net.minidev.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.google.common.collect.Lists;
import com.wisdomit.seasonalBuddy.DAO.CardDAO;
import com.wisdomit.seasonalBuddy.DAO.EventDAO;
import com.wisdomit.seasonalBuddy.DAO.UserDAO;
import com.wisdomit.seasonalBuddy.models.Cards;
import com.wisdomit.seasonalBuddy.models.Event;
import com.wisdomit.seasonalBuddy.models.User;



@Controller
public class CardController {

	@RequestMapping(value = "/submitcard" ,method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView show(@ModelAttribute("card") Cards card,@RequestParam("card_image") MultipartFile fileupload,@RequestParam("event_name") String event_name, @RequestParam("uname") String uname,BindingResult result)
	throws Exception{
		
		User user = userdao.findByUname(uname);
		card.setUser(user);
		String name =card.getName().replaceAll("\\s+","")+user.getId();
		String filel = name+".jpg";
		
	Event e = eventdao.findByName(event_name);
		card.setEvent_card(e);
	        card.setPath(filel);
		carddao.save(card);

		 if (fileupload != null) {
			 BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream("src/main/resources/public/cards/"+filel));
	         FileCopyUtils.copy(fileupload.getInputStream(), stream);
				stream.close();
				stream.flush();
				return new ModelAndView("redirect:seasonalcards");
	         }
			 
			 else{
				 return new ModelAndView("Error");
			 }
		
	}
	
	@RequestMapping(value="/seasonalcards" ,method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView setresult(){

		Iterable<Event> ev = new ArrayList<Event>();
		ev = eventdao.findAll();
	//	
		List<Cards> lg = new ArrayList<Cards>();
	//lg = carddao.findAll();
		lg = carddao.findAllByDesc();
		ModelAndView mv = new ModelAndView("SasonalCards");
		mv.addObject("res", lg);
		mv.addObject("events",ev);
		return mv;
	}
	
	@RequestMapping(value = "carddownload/{filepath}" , method = RequestMethod.GET) // download file
	@ResponseBody
	public String downloadfile(@PathVariable("filepath") String fpath,HttpServletResponse response) throws Exception{ 
		String a = null;
	System.out.println(fpath);
		File f = new File("src/main/resources/public/cards/"+fpath+".jpg");
		
		   if(!f.exists()){
	           String errorMessage = "Sorry. The file you are looking for does not exist";
	           System.out.println(errorMessage);
	           a = errorMessage;
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
		         
		        /* "Content-Disposition : inline" will show viewable types [like images/text/pdf/anything viewable by browser] right on browser 
		            while others(zip e.g) will be directly downloaded [may provide save as popup, based on your browser setting.]*/
		        response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", f.getName()));
		 
		         
		        /* "Content-Disposition : attachment" will be directly download, may provide save as popup, based on your browser setting*/
		        //response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", file.getName()));
		         
		        response.setContentLength((int)f.length());
		 
		        BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(f));
		 
		        //Copy bytes from source to destination(outputstream in this example), closes both streams.
		        FileCopyUtils.copy(inputStream, response.getOutputStream());
		        inputStream.close();
		        a = "file download success";
		    }
		      
		return a;
		
	}
	
//	@RequestMapping(value="getallcards",method = RequestMethod.GET,produces = "application/json")
//	@ResponseBody
//	public List<User> getallcards() throws Exception{
//		//Iterable<Cards> ic = carddao.findAll();
//		//List<Cards> myList = Lists.newArrayList(ic);
//		Iterable<User> ic = userdao.findAll();
//		List<User> myList = Lists.newArrayList(ic);
//		return myList;
//	}
	@RequestMapping(value="/getallcards",method = RequestMethod.GET,produces = "application/json")
	@ResponseBody
	public List<Cards> getallcards2() throws Exception{
		//Iterable<Cards> ic = carddao.findAll();
		//List<Cards> myList = Lists.newArrayList(ic);
//		Iterable<Cards> ic = carddao.findAll();
//		List<Cards> myList = Lists.newArrayList(ic);
		//List<Cards> reverseView = Lists.reverse(myList); 
		List<Cards> myList = carddao.findAllByDesc();
		return myList;
		
		
	}
	@RequestMapping(value="/getallcards/{event}",method = RequestMethod.GET,produces = "application/json")
	@ResponseBody
	public List<Cards> getallcards3(@PathVariable("event") String event) throws Exception{
		//Iterable<Cards> ic = carddao.findAll();
		//List<Cards> myList = Lists.newArrayList(ic);
		Event e = eventdao.findByName(event);
		List<Cards> ce = carddao.findCardsByevent(e);
		
		//Iterable<Cards> ic = carddao.findAll();
		//List<Cards> myList = Lists.newArrayList(ic);
		//List<Cards> reverseView = Lists.reverse(myList); 
		return ce;
		
		
	}
	@RequestMapping(value="getcards_event",method = RequestMethod.GET,produces = "application/json")
	@ResponseBody
	public List<Cards> getcards_events() throws Exception{
		//Iterable<Cards> ic = carddao.findAll();
		//List<Cards> myList = Lists.newArrayList(ic);
		Event e = eventdao.findByName("Christmas");
		
		//Iterable<Cards> ic = carddao.findByEvent(e);
		List<Cards> myList = carddao.findCardsByevent(e);
		return myList;
		
		
	}
	
	@Autowired
	private CardDAO carddao;
	
	@Autowired
	private EventDAO eventdao;
	
	@Autowired
	private UserDAO userdao;
}
