package com.zhiyou.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.zhiyou.pojo.PingLun;
import com.zhiyou.pojo.Project;
import com.zhiyou.pojo.User;
import com.zhiyou.service.PingLunService;
import com.zhiyou.service.ProjectService;

@Controller
public class PinLunController {
  @Autowired
  PingLunService pingLunService;
  @Autowired
  ProjectService project;
  @RequestMapping("seeping")
  //查看所有的评论
  public  ModelAndView allPing(){
	  //List<PingLun> seePing = pingLunService.seePing(1,1);
	  ModelAndView modelAndView=new ModelAndView();
	  List<Project> seeAll = project.seeAll();
	  //进行所有的评论的查看                                    所有的产品的浏览
	  List<PingLun> seePing = pingLunService.seePing(1, 1);
	  modelAndView.addObject("pinglunlist", seePing);
	  modelAndView.addObject("pinglist", seeAll);
	  System.out.println(seePing.toString());
	  modelAndView.setViewName("user/pinglun");
	 return modelAndView;
  }
  @RequestMapping("addping")
  //添加评论的操作，将得到的数据添加到数据库中
  public String add(int uid,int pid,String content){
	  PingLun pingLun =new PingLun();
	  pingLun.setContent(content);
	  //pingLunService.addPing(pingLun);
	  //将评论进行添加
	return  "forward:seeping";  
  }
  //进行页面的跳转
  //进行项目的信息的浏览
  @RequestMapping("foraddpinglun/{id}")
  public  String add(@PathVariable("id")int id,HttpSession session){
	  System.out.println(id);
	  session.setAttribute("pid", id);
	  Project seeProjectbyid = project.seeProjectbyid(id);
	  return "user/pinglun";
  }

  @RequestMapping("allpinglun")
  @ResponseBody
  public  List<PingLun> allPinglun(){
	  //List<PingLun> seePing = pingLunService.seePing(1,1);
	  List<Project> seeAll = project.seeAll();
	    //进行所有的评论的查看      所有的产品的浏览
	  List<PingLun> seePing = pingLunService.seePing(1, 1);
	  //所有的评论的查看
	  return seePing;
  }
}
