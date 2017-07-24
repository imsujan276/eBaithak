package com.khwopa.ebaithak.dao;

import java.util.List;

import com.khwopa.ebaithak.models.User;

public interface FriendsDao {
	
	public List<User> searchFriend(String name);

	public boolean isFriend(long friendId);
	
	public List<User> getFriends(String uName);
		
	public boolean addFriend(Long id, Long userId);
	
}
