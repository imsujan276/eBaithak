package com.khwopa.ebaithak;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.khwopa.ebaithak.dao.BaithakDao;
import com.khwopa.ebaithak.dao.BaithakMembersDao;
import com.khwopa.ebaithak.dao.FriendsDao;
import com.khwopa.ebaithak.dao.MessageDao;
import com.khwopa.ebaithak.dao.NotificationDao;
import com.khwopa.ebaithak.dao.UserDao;
import com.khwopa.ebaithak.models.Baithak;
import com.khwopa.ebaithak.models.BaithakMembers;
import com.khwopa.ebaithak.models.Message;
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
	private MessageDao mDao;
	
	@Autowired
	private NotificationDao nDao;
	
	private String username;
	private static long group_id;
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/baithak", method=RequestMethod.GET)
	public String baithak(@ModelAttribute User user, HttpSession session, Model model){
		
		if (StringUtils.isEmpty(session.getAttribute("username"))) {

			logger.info("/login - Session value is empty - redirected to login from baithak");
			return "login";
		}
		
		String username = (String)session.getAttribute("username");
		System.out.println(username);
		Long uid = uDao.getUserId(username);
		
		System.out.println(uid);
		
		model.addAttribute("myId", uid);
		model.addAttribute("myUsername",username);
		model.addAttribute("friendsList",fDao.getFriends(username));
		
//		Baithak b = bDao.getBaithak(uid);
//		System.out.println(b.getName());
//		group_id = b.getId();
		model.addAttribute("memberList",bmDao.getMembers(group_id));
		model.addAttribute("activeMemberList", bmDao.getActiveMembers(group_id));
		model.addAttribute("baithak",bDao.getBaithak(group_id));
		model.addAttribute("messageList", mDao.getMessage(group_id));
		model.addAttribute("allUserList", uDao.getAllUser());
		return "baithak";
		
	}
	
/*	@RequestMapping(value="/baithak/{id}", method=RequestMethod.GET)
	public String getBaithak(HttpSession session, Model model){

		return "baithak";
		
	}*/
	
	@RequestMapping(value="/baithak", method=RequestMethod.POST)
	public String getBaithak(HttpServletRequest request, HttpSession session, Model model){

		username = request.getParameter("userName");
		String str = request.getParameter("groupId");
		Long id = Long.parseLong(str);
		model.addAttribute("baithak",bDao.getBaithak(id));
		model.addAttribute("myUsername",username);
		Long uid = uDao.getUserId(username);
		model.addAttribute("myId", uid);
		
		model.addAttribute("friendsList",fDao.getFriends(username));
		model.addAttribute("memberList",bmDao.getMembers(id));
		model.addAttribute("activeMemberList", bmDao.getActiveMembers(id)); 
		model.addAttribute("messageList", mDao.getMessage(id));
		model.addAttribute("allUserList", uDao.getAllUser());
		return "baithak";
		
	}
	
	@RequestMapping(value="/creategroup", method=RequestMethod.POST)
	public String userRegister(@RequestParam("gPhoto") MultipartFile file,HttpSession session, @ModelAttribute Baithak baithak, Model model) throws IOException{

			logger.info("/creategroup - Creation of Baithak - "+baithak.getName() +" successful");
			byte[] bytes;
			if(!file.isEmpty()){
				bytes = file.getBytes();
				//	Write in the file.
				FileOutputStream out = new FileOutputStream("F:\\JavaClass\\Spring Framework\\SpringWorkspace\\eBaithak-03\\src\\main\\webapp\\resources\\baithakImg\\" + file.getOriginalFilename());
				//System.out.println(file.getOriginalFilename());
				baithak.setImage(file.getOriginalFilename());
				out.write(bytes);
				out.close();
			}
			String name = (String) session.getAttribute("username");
			Long userId = uDao.getUserId(name);
			baithak.setCreated_by(userId);
			baithak.setCreated_at(new Date().toString());
			
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
		members.setGroupId(groupId);
		members.setUserId(userId);
		
		bmDao.addMembers(members);
		
		model.addAttribute("allUserList", uDao.getAllUser());
		model.addAttribute("baithak",bDao.getBaithak(groupId));
		model.addAttribute("friendsList",fDao.getFriends(username));
		model.addAttribute("memberList",bmDao.getMembers(groupId));
		model.addAttribute("activeMemberList", bmDao.getActiveMembers(groupId));

		return "baithak";
		
	}
	
	@RequestMapping(value="/textbaithak", method=RequestMethod.POST)
	public String textBaithak(@ModelAttribute Message msg, HttpServletRequest request, HttpSession session, Model model){

		String str = request.getParameter("groupId");
		Long gId = Long.parseLong(str);
		group_id = gId;
		model.addAttribute("baithak",bDao.getBaithak(gId));
		String name = (String) session.getAttribute("username");
		Long userId = uDao.getUserId(name);
		//System.out.println(gId + " and " + userId);
		//System.out.println(msg.getMessage());
		
		/*List<User> list = fDao.getFriends(name);
		for (User user : list) {
			long uid = user.getId();
			System.out.println(uid);
			if(uDao.isOnline(uid) == 1){
				model.addAttribute("msg",msg.getMessage());
			}
			else {
				model.addAttribute("msg",msg.getMessage());
			}
		}*/
		if(msg.getMessage().isEmpty()){
			logger.info("Empty message Ignored...");
		}else{
			msg.setGroupId(gId);
			msg.setSenderId(userId);
			msg.setCreatedAt(new Date().toString());
			
			mDao.createMessage(msg);
			
			logger.info("message = " +msg.getMessage());
		}
	
		model.addAttribute("allUserList", uDao.getAllUser());
		model.addAttribute("messageList", mDao.getMessage(gId));
		model.addAttribute("myId", userId);
		return "redirect:/baithak";
	}
	
	@RequestMapping(value="chatframe", method=RequestMethod.GET)
	public String allChat(@RequestParam("bId") Long bId,Model model, HttpSession session) {
	   
		String username = (String)session.getAttribute("username");
		Long userId = uDao.getUserId(username);
		
		model.addAttribute("allUserList", uDao.getAllUser());
		model.addAttribute("messageList", mDao.getMessage(bId));
		model.addAttribute("myId", userId);
		
	   return "chatframe";
	}
	
	@RequestMapping(value="setMessages", method=RequestMethod.GET)
	@ResponseBody 
	public String setMessage(Model model,@RequestParam("bId") Long bId,@RequestParam("uId") Long uId,@RequestParam("message") String msg) {
	   	
		Message msg1 = new Message();
		msg1.setGroupId(bId);
		msg1.setSenderId(uId);
		msg1.setMessage(msg);
		msg1.setCreatedAt(new Date().toString());
		
		mDao.createMessage(msg1);
		
		logger.info("message = " +msg1.getMessage());
		
		return bId+uId+msg;
	}

	@RequestMapping(value="getMessages", method=RequestMethod.GET)
	@ResponseBody 
	public List<Message> getMessage(@RequestParam("bId") Long bId,Model model) {
	   
		System.out.println(bId);
		
	   return mDao.getMessage(bId);
	}

	
//	@RequestMapping(value="getMessages", method=RequestMethod.GET)
//	public @ResponseBody String getMessage(@RequestParam("bId") Long bId) {
//	   
//		return "hello" + bId;
//	}
	
}
