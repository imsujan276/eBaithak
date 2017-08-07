package com.khwopa.ebaithak;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khwopa.ebaithak.models.User;

@Controller
public class FileUploadController {
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(@ModelAttribute User user, HttpSession session, Model model){
		
		System.out.println("hjhjhjhjhjjh");
		return "home";
		
	}
	
	@RequestMapping(value="/ajaxTest", method=RequestMethod.GET)
	public String test(){
		
		return "Tested.....";
		
	}
}
