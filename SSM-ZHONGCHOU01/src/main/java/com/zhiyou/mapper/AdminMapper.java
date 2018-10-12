package com.zhiyou.mapper;

import java.util.List;

import com.zhiyou.pojo.Admin;
import com.zhiyou.pojo.User;

public interface AdminMapper {

	Admin adminlogin(String name);
	
	List<Admin> seeAll();
	
	void deletUser(int id);
	
	List<User> seeAllUser();
}
