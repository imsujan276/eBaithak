package com.khwopa.ebaithak;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.khwopa.ebaithak.dao.BaithakDao;
import com.khwopa.ebaithak.dao.BaithakMembersDao;
import com.khwopa.ebaithak.dao.FriendsDao;
import com.khwopa.ebaithak.dao.NotificationDao;
import com.khwopa.ebaithak.dao.UserDao;
import com.khwopa.ebaithak.models.Baithak;
import com.khwopa.ebaithak.models.BaithakMembers;
import com.khwopa.ebaithak.models.Friends;
import com.khwopa.ebaithak.models.User;

@Controller
public class BaithakController {

	@Autowired
	private UserDao uDao;
	
	@Autowired
	private BaithakDao bDao;
	
	@Autowired
	private BaithakMembersDao bmDao;
	
	@Autowired
	private FriendsDao fDao;
	
	@Autowired
	private NotificationDao nDao;
	
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/baithak", method=RequestMethod.GET)
	public String baithak(@ModelAttribute User user, HttpSession session, Model model){
		
		if (StringUtils.isEmpty(session.getAttribute("username"))) {

			logger.info("/login - Session value is empty - redirected to login from baithak");
			return "login";
		}
		
		String username = (String)session.getAttribute("username");
		model.addAttribute("myUsername",username);
		return "baithak";
		
	}
	
	/*	@RequestMapping(value="/baithak/{id}", method=RequestMethod.GET)
	public String getBaithak(@PathVariable("id") Long id,HttpSession session, Model model){

		model.addAttribute("baithak",bDao.getBaithak(id));
		return "baithak";
		
	}*/
	
	@RequestMapping(value="/baithak", method=RequestMethod.POST)
	public String getBaithak(HttpServletRequest request, HttpSession session, Model model){

		String username = request.getParameter("userName");
		String str = request.getParameter("groupId");
		Long id = Long.parseLong(str);
		model.addAttribute("baithak",bDao.getBaithak(id));
		model.addAttribute("myUsername",username);
		// model.addAttribute("friendsList",bmDao.getFriends(username,id));
		 model.addAttribute("friendsList",fDao.getFriends(username));
		return "baithak";
		
	}
	
	@RequestMapping(value="/creategroup", method=RequestMethod.POST)
	public String userRegister(@RequestParam("gPhoto") MultipartFile file,HttpSession session, @ModelAttribute Baithak baithak, Model model) throws IOException{

			logger.info("/creategroup - Creation of Baithak - "+baithak.getName() +" successful");
			// System.out.println(baithak.getName());
			 
			byte[] bytes;
			if(!file.isEmpty()){
				bytes = file.getBytes();
				//	Write in the file.
				FileOutputStream out = new FileOutputStream("F:\\JavaClass\\Spring Framework\\SpringWorkspace\\eBaithak\\src\\main\\webapp\\resources\\baithakImg\\" + file.getOriginalFilename());
				//System.out.println(file.getOriginalFilename());
				baithak.setImage(file.getOriginalFilename());
				out.write(bytes);
				out.close();
			}
			String name = (String) session.getAttribute("username");
			Long userId = uDao.getUserId(name);
			
			baithak.setCreated_by(userId);
			
			baithak.setCreated_at(new Date().toString().substring(0, 20));
			
			//System.out.println(new Date().toString().substring(0, 20));
			//System.out.println(userId);
			//System.out.println(b.getCreated_by());
			
			bDao.createBaithak(baithak);
			
			//model.addAttribute("messge", "Baithak : <u>"+baithak.getName()+"</u> Created...!! ");
			return "redirect:/home";
		}
		
	
	
	@RequestMapping(value="/addMembers", method=RequestMethod.POST)
	public String addMembers(HttpServletRequest request,@ModelAttribute BaithakMembers member, HttpSession session, Model model){
		
		
		String added_By = request.getParameter("created_by");
		Long addedBy = Long.parseLong(added_By);
		String group_Id = request.getParameter("groupId");
		Long groupId = Long.parseLong(group_Id);
		String user_Id = request.getParameter("userId");
		Long userId = Long.parseLong(user_Id);
		
		BaithakMembers members = new BaithakMembers();
		members.setAddedBy(addedBy);
		
		

//		model.addAttribute("myUsername", session.getAttribute("username"));
//		
//		logger.info("/searchFriend - Result for "+friendName+" Found");
//
//		String name = (String) session.getAttribute("username");
//		model.addAttribute("friendsList", fDao.getFriends(name));
//
//		Long userId = uDao.getUserId(name);
//		User u = uDao.getUser(userId);
//		model.addAttribute("name", u.getName());
//		model.addAttribute("userDetail", uDao.getDetail(userId));
//		model.addAttribute("notifications",nDao.getNotifications(userId));
//		model.addAttribute("baithakList", bDao.getAllBaithak(userId));
//		String username = (String)session.getAttribute("username");
//		model.addAttribute("myUsername",username);
		return "baithak";
		
	}
	
}
