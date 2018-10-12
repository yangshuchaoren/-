package com.zhiyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import com.zhiyou.pojo.PingLun;

public interface PingLunMapper {

	
	List<PingLun>  allping();
	
	void addping(@Param("uid")int uid,@Param("pid")int pid,@Param("content")String content);
	
}
