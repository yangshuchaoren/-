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
  //�鿴���е�����
  public  ModelAndView allPing(){
	  //List<PingLun> seePing = pingLunService.seePing(1,1);
	  ModelAndView modelAndView=new ModelAndView();
	  List<Project> seeAll = project.seeAll();
	  //�������е����۵Ĳ鿴                                    ���еĲ�Ʒ�����
	  List<PingLun> seePing = pingLunService.seePing(1, 1);
	  modelAndView.addObject("pinglunlist", seePing);
	  modelAndView.addObject("pinglist", seeAll);
	  System.out.println(seePing.toString());
	  modelAndView.setViewName("user/pinglun");
	 return modelAndView;
  }
  @RequestMapping("addping")
  //������۵Ĳ��������õ���������ӵ����ݿ���
  public String add(int uid,int pid,String content){
	  PingLun pingLun =new PingLun();
	  pingLun.setContent(content);
	  //pingLunService.addPing(pingLun);
	  //�����۽������
	return  "forward:seeping";  
  }
  //����ҳ�����ת
  //������Ŀ����Ϣ�����
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
	    //�������е����۵Ĳ鿴      ���еĲ�Ʒ�����
	  List<PingLun> seePing = pingLunService.seePing(1, 1);
	  //���е����۵Ĳ鿴
	  return seePing;
  }
}
