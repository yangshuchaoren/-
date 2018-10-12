package com.zhiyou.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou.exception.UserException;
import com.zhiyou.pojo.Result;
import com.zhiyou.pojo.Support;
import com.zhiyou.pojo.User;
import com.zhiyou.service.SupportService;
@Controller
public class SupportController {
	@Autowired
	SupportService support;
	//���е��޵���Ŀ�Ĳ鿴
	@RequestMapping("support")
	public ModelAndView seeSupport(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Support> seeAllByUser = support.seeAllByUser(1);
		//����ҳ�����ת
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("support", seeAllByUser);
		//���ݵĸ�ֵ
        modelAndView.setViewName("user/dianzan");
		return modelAndView;
	}
	//��Ŀ������Ϊ��ʵ��
	//���е�����е��޵Ĺ���
	@RequestMapping("dianzan")
	@ResponseBody
	public Result clickSupport(int  id,HttpSession session){
	  User user=(User)session.getAttribute("user");
	  try {
		support.addSupport(1,id);
		return new Result(1, "���޳ɹ�", 0);
	} catch (UserException e) {
		// TODO Auto-generated catch block
		//���в������ݵ��ж�
		return new Result(0, e.getMessage(), 0);
	}
		
	}

}
