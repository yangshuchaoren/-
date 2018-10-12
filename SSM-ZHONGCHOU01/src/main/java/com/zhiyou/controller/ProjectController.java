package com.zhiyou.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.UpdatableSqlQuery;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou.pojo.Project;
import com.zhiyou.pojo.Support;
import com.zhiyou.pojo.User;
import com.zhiyou.service.ProjectService;

@Controller
public class ProjectController {
    @Autowired
	ProjectService projectService;
	@RequestMapping("project")
	public ModelAndView allProject(HttpSession session){
		//�����ݽ��д���
		List<Project> seeAll = projectService.seeAll();
		ModelAndView modelAndView=new ModelAndView();
		User user =(User)session.getAttribute("user");
		modelAndView.addObject("user",user);
		modelAndView.addObject("project", seeAll);
		modelAndView.setViewName("product/index");
		return modelAndView;
	}
	//������Ϣ�����
	@RequestMapping("addproject")
	//�������ݵİ�
	public String addProject(@RequestParam("jack")MultipartFile file1,HttpSession session,Project project,@RequestParam("tom")MultipartFile video){
		System.out.println(file1);
		//�����ļ��Ľ���
		String fileName = file1.getOriginalFilename();
		String videoname = video.getOriginalFilename();
		System.out.println(fileName);
		ModelAndView modelAndView=new ModelAndView();
		String destPath = session.getServletContext().getRealPath("upload/project");
		UUID uuid = UUID.randomUUID();
		UUID uuid1 = UUID.randomUUID();
		String destFileName = uuid+"."+FilenameUtils.getExtension(fileName);
		String videoString =uuid1+"."+FilenameUtils.getExtension(videoname);
		File destFile = new File(destPath,destFileName);
		//����Ƶ���д洢
		File videofile = new File(destPath,videoString);
		//д��
		try {
			file1.transferTo(destFile);
			//����Ƶ���ݽ����ϴ�
			video.transferTo(videofile);
			//������Ƶ�ļ����Ĵ洢
			project.setVideo(videoString);
			//����ͼƬ���ļ����Ĵ洢
			project.setFileid(destFileName);
			//��Ŀ�����
			projectService.addProject(project);
			System.out.println("��Ŀ�޸ĳɹ�");
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //ҳ���޸ĳɹ������ҳ�����ת ��ת����Ŀ�б���
		return "redirect:/allproject";
	}
	@RequestMapping("all")
	@ResponseBody
	//�������е���Ŀ�Ĳ鿴
	public List<Project> all(HttpSession session){
		System.out.println("�μӵ���Ŀ");
		//���û�������е���Ŀ����չʾ
		List<Project> seeAll = projectService.seeAll();
		//�鿴���е����ݽ��з���һ��json����
		System.out.println("hello jack");
		return seeAll;
	}
	//�鿴�μӵ���Ŀ
	@RequestMapping("join")
	@ResponseBody
	public List<Project> join(HttpSession session){
		System.out.println("�μӵ���Ŀ");
		List<Project> seeAll = projectService.seeAll();
		//ajax�����ݵ������������
		//�鿴���е����ݽ��з���һ��json����
		return seeAll;
	}
	//�������е���Ŀ�Ĳ鿴
	@RequestMapping("project1")
	public ModelAndView userAndProject(HttpSession session){
		//���е���Ŀ����չʾ
		System.out.println("������Ŀ");
		ModelAndView modelAndView=new ModelAndView();
		List<Project> seeAll = projectService.seeAll();
		//�鿴���е����ݽ��з���һ��json����
		modelAndView.addObject("projectlist", seeAll);
		modelAndView.setViewName("/user/canyu");
		return modelAndView;
	}
	//�鿴���û����޵���Ŀ ����ҳ����ת�����޵����ݵ�ҳ��
	//������Ϣ����û���ҵ����ݿ�û����Ϣ 
	@RequestMapping("zan")
	@ResponseBody
	public List<Project> userSupport(HttpSession session){
		User user=(User)session.getAttribute("user");
		//�����û�������Ŀ�Ĳ鿴
		List<Project> seeSupport = projectService.seeSupport(1);
		return seeSupport;
	}
	//���빫���ڳ�
	@RequestMapping("allproject")
	public ModelAndView allZhongChou(){
		//�����ݽ��д���
		List<Project> seeAll = projectService.seeAll();
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("project", seeAll);
		modelAndView.setViewName("product/productlist");
		return modelAndView;
	}
	//��Ŀ����ϸ��Ϣ�鿴
	@RequestMapping("seedetail/{id}")
	public ModelAndView  seeDetail(@PathVariable("id")Integer id){
		System.out.println("id:::::"+id);
		List<Project> seeAll = projectService.seeAll();
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("project", seeAll);
		modelAndView.setViewName("product/product-detail");
		return modelAndView;
	}
	@RequestMapping("foraddproject")
	public String foradd(){
		return "product/addproduct";
	}
	@RequestMapping("forzan")
	public ModelAndView forZan(){
		ModelAndView modelAndView=new ModelAndView();
		List<Project> seeAll = projectService.seeAll();
		//�鿴���е����ݽ��з���һ��json����
		modelAndView.setViewName("/user/dianzan");
		return modelAndView;
	}
	@RequestMapping("forfaqi")
	public ModelAndView forfa(){
		ModelAndView modelAndView=new ModelAndView();
		List<Project> seeAll = projectService.seeAll();
		//�鿴���е����ݽ��з���һ��json����
		modelAndView.setViewName("/user/faqi");
		return modelAndView;
	}
	@RequestMapping("faqi")
	@ResponseBody
	public List<Project> forFaqi(){
		ModelAndView modelAndView=new ModelAndView();
		List<Project> seeAll = projectService.seeFaqi(1);
		//�鿴���е����ݽ��з���һ��json����
		return seeAll;
	}
}
