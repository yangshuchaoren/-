package com.zhiyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.pojo.Support;

public interface SupportMapper {
	List<Support> seeAll();
	
	//�������޵���Ŀ
	List<Support>  seeAllUser(int id);
	//������Ϣ�Ĳ���
	int addInsert(@Param("uid")int id,@Param("pid")int uid);
	
	
	
}
