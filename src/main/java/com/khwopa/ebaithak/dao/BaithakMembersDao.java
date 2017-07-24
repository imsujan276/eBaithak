package com.khwopa.ebaithak.dao;

import java.util.List;

import com.khwopa.ebaithak.models.BaithakMembers;
import com.khwopa.ebaithak.models.User;

public interface BaithakMembersDao {

	public List<User> getFriends(String uName,long groupId);
	
	public void addMembers(long created_by, long groupId, BaithakMembers membersTobeAdded);
}
