package com.khwopa.ebaithak.dao;

import java.util.List;

import com.khwopa.ebaithak.models.Baithak;
import com.khwopa.ebaithak.models.BaithakMembers;
import com.khwopa.ebaithak.models.User;

public interface BaithakMembersDao {

	public List<User> getFriends(String uName,long groupId);
	
	public void addMembers(BaithakMembers bmember);
	
	public List<User> getMembers(long groupId);
	
	public List<User> getActiveMembers(long groupId);
	
	public List<Baithak> getAllGroup(long userId);
}
