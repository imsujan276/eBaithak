package com.khwopa.ebaithak.dao;

import java.util.List;

import com.khwopa.ebaithak.models.Baithak;
import com.khwopa.ebaithak.models.User;

public interface BaithakDao {

	public void createBaithak(Baithak b);
	
	public boolean deletebaithak(long id);
	
	public List<Baithak> getAllBaithak(long createrId);
	
	public Baithak getBaithak(Long id);

	
}
