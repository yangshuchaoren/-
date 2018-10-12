package com.zhiyou.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.exception.RegisterException;
import com.zhiyou.exception.UserException;
import com.zhiyou.mapper.PingLunMapper;
import com.zhiyou.mapper.UserMapper;
import com.zhiyou.pojo.Project;
import com.zhiyou.pojo.User;
import com.zhiyou.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;
	
	
	@Autowired
	PingLunMapper pingLunMapper;
	public User loginUser(String telnumber, String pwd) throws UserException {
		// TODO Auto-generated method stub
		User login = userMapper.login(telnumber);
		if (login == null) {
			//没有此用户
			throw new UserException("手机号不正确");
		}else{
			if (!login.getPassword().equals(pwd)) {
				//密码错误
			throw new UserException("密码不正确");
			}
		}
		return login;

	}
	public List<User> seeAll() {
		// TODO Auto-generated method stub
		List<User> seeAllUser = userMapper.seeAllUser();
		return seeAllUser;
	}
	public void addUser(String name, String pwd) {
		// TODO Auto-generated method stub
		//
	}
	public User seeUser(int id) {
		// TODO Auto-generated method stub
		User seeUserById = userMapper.seeUserById(id);
		return seeUserById;
	}
	public List<Project> seeCanYu(int id) {
		// TODO Auto-generated method stub
		List<Project> seeCanYu = userMapper.seeCanYu(id);
		return seeCanYu;
	}
	public List<Project> seeFaQi(int id) {
		// TODO Auto-generated method stub
		List<Project> seeFaQi = userMapper.seeFaQi(id);
		return seeFaQi;
	}
	public void changeUser(User user) {
		// TODO Auto-generated method stub
		userMapper.changeUser(user);
		//用户信息的修改
	}
	public User register(String telnumber, String password) throws RegisterException {
		// TODO Auto-generated method stub
		User login = userMapper.login(telnumber);
		if (login != null) {
			//没有此用户
			throw new RegisterException("已经有人使用号码");
		}else{
			//如果没有用户进行注册成功
			userMapper.addUser(telnumber, password);
			return login;
		}
	}
	public void shiming(User user) {
		// TODO Auto-generated method stub
		userMapper.truename(user);
	}
	public List<User> tongguo(){
		List<User> tongguo = userMapper.tongguo();
		return tongguo;
	}
	public List<User> weitongguo(){
		List<User> weitongguo = userMapper.weitongguo();
		return weitongguo;
	}
	public void changetongguo(int id){
		userMapper.changetongguo(id);
	}
	public void addPing(int uid, int pid, String content) {
		// TODO Auto-generated method stub
		pingLunMapper.addping(uid, pid, content);
	}
}

