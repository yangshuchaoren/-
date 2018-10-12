package com.zhiyou.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.PingLunMapper;
import com.zhiyou.pojo.PingLun;
import com.zhiyou.service.PingLunService;

@Service
public class PingLunServiceImpl  implements PingLunService{
    @Autowired
	PingLunMapper pingLunMapper;
	public List<PingLun> seePing(int uid, int pid) {
		// TODO Auto-generated method stub
		List<PingLun> allping = pingLunMapper.allping();
		return allping;
	}
	public void addPing(int uid,int pid,String content) {
		// TODO Auto-generated method stub
		//进行所有的评论的查看
		pingLunMapper.addping(uid,pid,content);
	}

}
