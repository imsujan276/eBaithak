package com.khwopa.ebaithak.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.khwopa.ebaithak.models.BaithakMembers;
import com.khwopa.ebaithak.models.User;

@Repository
public class BaithakMembersDaoImpl implements BaithakMembersDao {
	
	//hibernate object
	@Resource
	private SessionFactory sessionFactory;
	
	//jdbc object
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public UserDao uDao;
	

	@Override
	public void addMembers(long created_by, long groupId, BaithakMembers membersTobeAdded) {

			
		
		
		
	}
	
	@Override
	public List<User> getFriends(String uName, long groupId) {
		
		Long id = uDao.getUserId(uName);
		
		JdbcTemplate template = new JdbcTemplate(dataSource);
		
		List<User> friendsList = new ArrayList<User>();
		
		String sql = "Select * from friends where userId = '"+id+"'";
		//System.out.println(sql);
		List<Map<String, Object>> rows = template.queryForList(sql);
		for (Map row : rows) {
			
			User user = new User();
			
			//String sql1 = "Select username from user where id = '"+row.get("friendId")+"'";
			//String username = template.queryForObject(sql1, String.class);

			String sql2 = "Select * from user where id = '"+row.get("friendId")+"'";
			
			//String sql2 = "Select * from user where id in (Select friendId from friends where userId = '"+id+"') order by status desc";
			
			List<Map<String, Object>> rows1 = template.queryForList(sql2);
			for (Map row1 : rows1) {
				
//				String sql3 = "Select userId from baithakmembers where userId = '"+row.get("friendId")+"' and groupId = '"+groupId+"'";
//				Long count = template.queryForObject(sql, Long.class);
//				
//				if( count != 0){
//
//					System.out.println((String) row1.get("name"));
//					user.setId((Long)row1.get("id"));
//					user.setName((String) row1.get("name"));
//					user.setUsername((String) row1.get("username"));
//					user.setPhoto((String) row1.get("photo"));
//					user.setStatus((Integer) row1.get("status"));
//					
//				}
//				
				System.out.println((String) row1.get("name"));
				user.setId((Long)row1.get("id"));
				user.setName((String) row1.get("name"));
				user.setUsername((String) row1.get("username"));
				user.setPhoto((String) row1.get("photo"));
				user.setStatus((Integer) row1.get("status"));
				//friendsList.add(user);
			}
			//user.setUsername(username);
			//System.out.println(user.getUsername());
			friendsList.add(user);
		}
		
		return friendsList;
	}



}
