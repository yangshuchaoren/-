package com.zhiyou.service.Impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhiyou.mapper.ProjectMapper;
import com.zhiyou.pojo.Project;
import com.zhiyou.service.ProjectService;

@Service
public class ProjectServiceImpl  implements ProjectService{
	@Autowired
	ProjectMapper projectMapper;
	public List<Project> seeAll() {
		// TODO Auto-generated method stub
		List<Project> seeAllProjects = projectMapper.seeAllProjects();
		System.out.println(seeAllProjects);
		return seeAllProjects;
	}
	public List<Project> seeSupport(int id) {
		// TODO Auto-generated method stub
		List<Project> seeSupport = projectMapper.seeSupport(id);
		return seeSupport;
	}
	public void addProject(Project project) {
		// TODO Auto-generated method stub
		projectMapper.addProject(project);
		
	}
	public List<Project> seeFaqi(int i) {
		// TODO Auto-generated method stub
		List<Project> seeCanyu = projectMapper.seeCanyu(i);
		return seeCanyu;
	}
	public void changeTong(int id) {
		// TODO Auto-generated method stub
		projectMapper.prochangetong(id);
		
	}
	public Project seeProjectbyid(int id) {
		// TODO Auto-generated method stub
		Project seeProjectById = projectMapper.seeProjectById(id);
		return seeProjectById;
	}
	public List<Project> mohuchazhao(String state, String type) {
		// TODO Auto-generated method stub
		List<Project> mohuchazhao = projectMapper.mohuchazhao(state, type);
		return mohuchazhao;
	}
	
}
