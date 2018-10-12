package com.zhiyou.service;

import java.util.List;

import com.zhiyou.pojo.PingLun;

public interface PingLunService {

	List<PingLun> seePing(int uid,int pid);
	
	void addPing(int uid,int pid,String content);
}
