package com.wisdomit.seasonalBuddy.controllers;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wisdomit.seasonalBuddy.DAO.AdvertisementDAO;
import com.wisdomit.seasonalBuddy.DAO.MerchantDAO;
import com.wisdomit.seasonalBuddy.models.Advertisement;
import com.wisdomit.seasonalBuddy.models.Cards;
import com.wisdomit.seasonalBuddy.models.Event;
import com.wisdomit.seasonalBuddy.models.Merchant;

@Controller
public class AdvertisementController {

	@RequestMapping(value = "/submitAdd" ,method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView show(@ModelAttribute("advertisement") Advertisement add,@RequestParam("add_image") MultipartFile fileupload,@RequestParam("muname") String muname, BindingResult result)
	throws Exception{
		
		String name = new Long(add.getAddid()).toString()+add.getAddname(); //get the file path
		String filel = name+".jpg";
		
		Merchant mer = merchantdao.findByMuname(muname);
		String a=null;
		ModelAndView mv;
		if(mer==null){
		a= "Merchant Username is not Valid";	
	mv = new ModelAndView("redirect:merchants");
		}
		else if(result.hasErrors()){
			a="Addvertisement is not upload please try again";
			 mv = new ModelAndView("redirect:merchants");
		}
		else{
		add.setMerchants(mer);
	
	        add.setAddpath(filel);
		addao.save(add);
		
		
		 if (fileupload != null) {
			 BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream("src/main/resources/public/adds/"+filel));
	         FileCopyUtils.copy(fileupload.getInputStream(), stream);
				stream.close();
				stream.flush();
				a = "file upload success"+filel;
				 mv = new ModelAndView("redirect:index");
	         }
			 
			 else{
				 a = "File dont upload try again . . ";
				  mv = new ModelAndView("redirect:merchants");
			 }
		  
		}
		

		 return mv;
	}
	
	@Autowired
	public AdvertisementDAO addao; 
	
	@Autowired
	public MerchantDAO merchantdao;
	
}
