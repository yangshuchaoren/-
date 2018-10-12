package com.zhiyou.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.exception.UserException;
import com.zhiyou.mapper.AdminMapper;
import com.zhiyou.pojo.Admin;
import com.zhiyou.pojo.Support;
import com.zhiyou.pojo.User;
import com.zhiyou.service.AdminService;

@Service
public class AdminServiceImpl  implements AdminService{
    @Autowired
	AdminMapper adminMapper;
	public Admin login(String name, String password) throws UserException {
		// TODO Auto-generated method stub
		Admin adminlogin = adminMapper.adminlogin(name);
		if(adminlogin==null){
			throw new UserException("”√ªß√˚¥ÌŒÛ");
		}
		else{
			if(adminlogin.getPassword()!=password){
				throw new UserException("√‹¬Î¥ÌŒÛ");
			}
		}
		return adminlogin;
	}
	public List<Support> dianZan() {
		// TODO Auto-generated method stub
		return null;
	}
	public List<Admin> seeall() {
		// TODO Auto-generated method stub
		List<Admin> seeAll = adminMapper.seeAll();
		return seeAll;
	}

	public void deletadmin(int id) {
		// TODO Auto-generated method stub
		adminMapper.deletUser(id);
	}
	public List<User> seeAllUser() {
		// TODO Auto-generated method stub
		List<User> seeAllUser = adminMapper.seeAllUser();
		return seeAllUser;
	}
}
