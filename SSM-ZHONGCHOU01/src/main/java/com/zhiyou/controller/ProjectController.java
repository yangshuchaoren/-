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
		//将数据进行传入
		List<Project> seeAll = projectService.seeAll();
		ModelAndView modelAndView=new ModelAndView();
		User user =(User)session.getAttribute("user");
		modelAndView.addObject("user",user);
		modelAndView.addObject("project", seeAll);
		modelAndView.setViewName("product/index");
		return modelAndView;
	}
	//进行信息的添加
	@RequestMapping("addproject")
	//进行数据的绑定
	public String addProject(@RequestParam("jack")MultipartFile file1,HttpSession session,Project project,@RequestParam("tom")MultipartFile video){
		System.out.println(file1);
		//进行文件的接收
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
		//将视频进行存储
		File videofile = new File(destPath,videoString);
		//写入
		try {
			file1.transferTo(destFile);
			//将视频数据进行上传
			video.transferTo(videofile);
			//进行视频文件名的存储
			project.setVideo(videoString);
			//进行图片的文件名的存储
			project.setFileid(destFileName);
			//项目的添加
			projectService.addProject(project);
			System.out.println("项目修改成功");
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //页面修改成功后进行页面的跳转 跳转到项目列表中
		return "redirect:/allproject";
	}
	@RequestMapping("all")
	@ResponseBody
	//进行所有的项目的查看
	public List<Project> all(HttpSession session){
		System.out.println("参加的项目");
		//将用户参与的有的项目进行展示
		List<Project> seeAll = projectService.seeAll();
		//查看所有的数据进行返回一个json对象
		System.out.println("hello jack");
		return seeAll;
	}
	//查看参加的项目
	@RequestMapping("join")
	@ResponseBody
	public List<Project> join(HttpSession session){
		System.out.println("参加的项目");
		List<Project> seeAll = projectService.seeAll();
		//ajax的数据的请求出现问题
		//查看所有的数据进行返回一个json对象
		return seeAll;
	}
	//进行所有的项目的查看
	@RequestMapping("project1")
	public ModelAndView userAndProject(HttpSession session){
		//所有的项目进行展示
		System.out.println("所有项目");
		ModelAndView modelAndView=new ModelAndView();
		List<Project> seeAll = projectService.seeAll();
		//查看所有的数据进行返回一个json对象
		modelAndView.addObject("projectlist", seeAll);
		modelAndView.setViewName("/user/canyu");
		return modelAndView;
	}
	//查看该用户点赞的项目 进行页面跳转到点赞的数据的页面
	//错误信息数据没有找到数据库没有信息 
	@RequestMapping("zan")
	@ResponseBody
	public List<Project> userSupport(HttpSession session){
		User user=(User)session.getAttribute("user");
		//进行用户点赞项目的查看
		List<Project> seeSupport = projectService.seeSupport(1);
		return seeSupport;
	}
	//进入公益众筹
	@RequestMapping("allproject")
	public ModelAndView allZhongChou(){
		//将数据进行传入
		List<Project> seeAll = projectService.seeAll();
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("project", seeAll);
		modelAndView.setViewName("product/productlist");
		return modelAndView;
	}
	//项目的详细信息查看
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
		//查看所有的数据进行返回一个json对象
		modelAndView.setViewName("/user/dianzan");
		return modelAndView;
	}
	@RequestMapping("forfaqi")
	public ModelAndView forfa(){
		ModelAndView modelAndView=new ModelAndView();
		List<Project> seeAll = projectService.seeAll();
		//查看所有的数据进行返回一个json对象
		modelAndView.setViewName("/user/faqi");
		return modelAndView;
	}
	@RequestMapping("faqi")
	@ResponseBody
	public List<Project> forFaqi(){
		ModelAndView modelAndView=new ModelAndView();
		List<Project> seeAll = projectService.seeFaqi(1);
		//查看所有的数据进行返回一个json对象
		return seeAll;
	}
}
