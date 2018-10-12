package com.zhiyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.pojo.Support;

public interface SupportMapper {
	List<Support> seeAll();
	
	//产看点赞的项目
	List<Support>  seeAllUser(int id);
	//点赞信息的插入
	int addInsert(@Param("uid")int id,@Param("pid")int uid);
	
	
	
}
