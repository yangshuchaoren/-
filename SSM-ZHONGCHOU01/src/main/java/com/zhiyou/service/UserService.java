package com.zhiyou.service;

import java.util.List;

import com.zhiyou.exception.RegisterException;
import com.zhiyou.exception.UserException;
import com.zhiyou.pojo.PingLun;
import com.zhiyou.pojo.Project;
import com.zhiyou.pojo.User;

public interface UserService {

	User loginUser(String telnumber,String pwd) throws UserException;
 
    List<User> seeAll();
   
    void addUser(String name,String pwd);
    
    User  seeUser(int id);
    
    List<Project> seeCanYu(int id);
    
    List<Project> seeFaQi(int id);
    
    //List<Liuyan>  seeLiuYan(int id,int pid);
    
    void changeUser(User user);
    
    void shiming(User user);
    
    User register(String telnumber,String password) throws RegisterException;
    
    List<User> tongguo();
    
    List<User> weitongguo();
    
    void  changetongguo(int id);
    
    public void addPing(int uid,int pid,String content);
}
