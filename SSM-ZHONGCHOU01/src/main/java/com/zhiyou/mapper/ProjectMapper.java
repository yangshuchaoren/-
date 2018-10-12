package com.zhiyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.pojo.Project;

public interface ProjectMapper {
	//查看所有的项目文件
	List<Project> seeAllProjects();
	//参看项目文件
	Project seeProjectById(int id);
	//进行项目的添加
	void addProject(Project project);
	//删除项目
	void deletProject(int id);
	
    List<Project> seeSupport(int id);
    
    List<Project> seeCanyu(int uid);
    
   void prochangetong(int id);
    
    List<Project> mohuchazhao(@Param("state")String state,@Param("type")String type);
}
