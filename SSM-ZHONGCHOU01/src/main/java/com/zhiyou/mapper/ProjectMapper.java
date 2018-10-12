package com.zhiyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.pojo.Project;

public interface ProjectMapper {
	//�鿴���е���Ŀ�ļ�
	List<Project> seeAllProjects();
	//�ο���Ŀ�ļ�
	Project seeProjectById(int id);
	//������Ŀ�����
	void addProject(Project project);
	//ɾ����Ŀ
	void deletProject(int id);
	
    List<Project> seeSupport(int id);
    
    List<Project> seeCanyu(int uid);
    
   void prochangetong(int id);
    
    List<Project> mohuchazhao(@Param("state")String state,@Param("type")String type);
}
