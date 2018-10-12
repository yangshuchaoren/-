package com.zhiyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.pojo.PingLun;
import com.zhiyou.pojo.Project;
import com.zhiyou.pojo.User;


public interface UserMapper {
    
	User login(String telnumber);
	
	void addUser(@Param("telnumber")String telnumber,@Param("password")String password);
	
	List<User> seeAllUser();
	
	User seeUserById(int id);
	
	List<Project> seeCanYu(int id);
	
	List<Project> seeFaQi(int id);
	
	//List<Liuyan> seeLiuYan(int id);
	
	void changeUser(User user);
 	
	void truename(User user);
	
	//产看已经通过的数据
	List<User> tongguo();
	//查看未通过的数据
	List<User> weitongguo();
	//进行修改转台
	void changetongguo(int id);
}
