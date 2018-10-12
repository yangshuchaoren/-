package com.zhiyou.service;

import java.util.List;

import com.zhiyou.exception.UserException;
import com.zhiyou.pojo.Support;

public interface SupportService {

	List<Support> seeAllByUser(int id);
	
	List<Support> seeAll();
	
	void addSupport(int uid,int pid) throws UserException;
}
