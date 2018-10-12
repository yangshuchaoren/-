package com.zhiyou.service;

import java.util.List;

import com.zhiyou.pojo.Project;

public interface ProjectService {

	List<Project> seeAll();
	
	List<Project> seeSupport(int id);
	
	void addProject(Project project);
	
	List<Project> seeFaqi(int i);
	
	Project  seeProjectbyid(int id);
	
	void changeTong(int id);
	
	List<Project>  mohuchazhao(String state,String type);
}
