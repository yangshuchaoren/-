package com.zhiyou.service;

import java.util.List;

import com.zhiyou.exception.UserException;
import com.zhiyou.pojo.Admin;
import com.zhiyou.pojo.Support;
import com.zhiyou.pojo.User;

public interface AdminService {
    
	Admin login(String name,String password)  throws UserException;
	
	List<Support> dianZan();
	
	List<Admin> seeall();
	
	void deletadmin(int id);
	
	List<User> seeAllUser();
	
	
}
