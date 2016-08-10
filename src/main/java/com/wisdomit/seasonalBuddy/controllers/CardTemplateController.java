package com.wisdomit.seasonalBuddy.controllers;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import com.wisdomit.seasonalBuddy.DAO.CardClipDAO;
import com.wisdomit.seasonalBuddy.DAO.CardTemplatesDAO;
import com.wisdomit.seasonalBuddy.DAO.EventDAO;
import com.wisdomit.seasonalBuddy.models.CardClips;
import com.wisdomit.seasonalBuddy.models.CardTemplates;
import com.wisdomit.seasonalBuddy.models.Cards;
import com.wisdomit.seasonalBuddy.models.Event;

@Controller
public class CardTemplateController {
	@RequestMapping(value = "/submittemplate" ,method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView show(@ModelAttribute("Template") CardTemplates cardtemp,@RequestParam("temp_image") MultipartFile fileupload,@RequestParam("event_name1") String event_name1
			,BindingResult result)
	throws Exception{
		
		
		String name = cardtemp.getName().replaceAll("\\s+","");
		String filel = name+".jpg";
		
	Event e1 = eventdao.findByName(event_name1);
	
	
		//card.setEvent_card(e);
	cardtemp.setCtemp_events(e1);;
	cardtemp.setPath(filel);
		cardtempdao.save(cardtemp);
		String a=null;
		 if (fileupload != null) {
			 BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream("src/main/resources/public/ctemplate/"+filel));
	         FileCopyUtils.copy(fileupload.getInputStream(), stream);
				stream.close();
				stream.flush();
				return new ModelAndView("redirect:seasonaltemplates");
	         }
			 
			 else{
				return new ModelAndView("Error");
			 }
	}
	
	@RequestMapping(value="/seasonaltemplates" ,method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView setresult(){
		Iterable<Event> ev = new ArrayList<Event>();
		ev = eventdao.findAll();
	//	
		List<CardTemplates> lg = new ArrayList<CardTemplates>();
//	lg = cardtempdao.findAll();
		lg = cardtempdao.findAllBydesc();
		ModelAndView mv = new ModelAndView("CardTemplate");
		mv.addObject("res", lg);
		mv.addObject("events",ev);
		return mv;
	}
	
	@RequestMapping(value = "tempdownload/{filepath}" , method = RequestMethod.GET) // download file
	@ResponseBody
	public String downloadfile(@PathVariable("filepath") String fpath,HttpServletResponse response) throws Exception{ 
		String a = null;
	System.out.println(fpath);
		File f = new File("src/main/resources/public/ctemplate/"+fpath+".jpg");
		
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
	
//	@RequestMapping(value="gettemp_events",method = RequestMethod.GET,produces = "application/json")
//	@ResponseBody
//	public List<CardClips> getclips() throws Exception{
//		//Iterable<Cards> ic = carddao.findAll();
//		//List<Cards> myList = Lists.newArrayList(ic);
//		Event e1 = eventdao.findById(1);
//		List<Event> e = new ArrayList<Event>();
//	e.add(e1);
//		
//		//Iterable<Cards> ic = carddao.findByEvent(e);
//		List<CardClips> myList = cardclipdao.findClipsByevent(e);
//		return myList;		
//	}
	@RequestMapping(value="/getalltemplates",method = RequestMethod.GET,produces = "application/json")
	@ResponseBody
	public List<CardTemplates> getalltemplate() throws Exception{
	
//		Iterable<CardTemplates> ic =cardtempdao.findAll();
//		List<CardTemplates> myList = Lists.newArrayList(ic);
		
		List<CardTemplates> myList = cardtempdao.findAllBydesc();
		return myList;	
	}
	@RequestMapping(value="/getallTemps/{event}",method = RequestMethod.GET,produces = "application/json")
	@ResponseBody
	public List<CardTemplates> getallcards_event(@PathVariable("event") String eventname) throws Exception{
		//Iterable<Cards> ic = carddao.findAll();
		//List<Cards> myList = Lists.newArrayList(ic);
		Event e = eventdao.findByName(eventname);
		List<CardTemplates> tempList = cardtempdao.findTempsByevent(e);
	
		//List<Cards> reverseView = Lists.reverse(myList); 
		return tempList;
		
		
	}
	@Autowired
	private CardClipDAO cardclipdao;
	
	@Autowired
	private EventDAO eventdao;
	
	@Autowired
	private CardTemplatesDAO cardtempdao;

}
