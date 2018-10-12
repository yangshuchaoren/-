package com.zhiyou.service.Impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhiyou.exception.UserException;
import com.zhiyou.mapper.SupportMapper;
import com.zhiyou.pojo.Support;
import com.zhiyou.service.SupportService;
@Service
public class SupportServiceImpl  implements SupportService{
    @Autowired
    SupportMapper supportMapper;
	public List<Support> seeAllByUser(int id) {
		// TODO Auto-generated method stub
	   List<Support> seeAllUser = supportMapper.seeAllUser(id);	
	   return seeAllUser;
	}
	public List<Support> seeAll() {
		// TODO Auto-generated method stub
		return null;
	}
	//进行点赞的操作
	public void addSupport(int uid, int pid) throws UserException {
		// TODO Auto-generated method stub
		//进行点赞记录的插入如果成功返回1  如果返回0则表示没有插入成功
		if(supportMapper.addInsert(uid, pid)==1){
			System.out.println("点赞记录插入成功");
		}
		else{
			throw new UserException("点赞记录插入失败");
		}
	}
}
