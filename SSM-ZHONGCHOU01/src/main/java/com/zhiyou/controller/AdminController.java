package com.zhiyou.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou.exception.UserException;
import com.zhiyou.pojo.Admin;
import com.zhiyou.pojo.Project;
import com.zhiyou.pojo.Result;
import com.zhiyou.pojo.Type;
import com.zhiyou.pojo.User;
import com.zhiyou.service.AdminService;
import com.zhiyou.service.ProjectService;
import com.zhiyou.service.TypeService;

@Controller
public class AdminController {

	@Autowired
	AdminService admin;
	@Autowired
	TypeService protype;

	@Autowired
	ProjectService project;
	// �������Ա�������� ����Ŀ�����е���Ϣ���д�����л�ȡ
	@RequestMapping("adminindex")
	public ModelAndView admin() {
		ModelAndView modelAndView = new ModelAndView();
		List<Project> seeAll = project.seeAll();
		modelAndView.addObject("project", seeAll);
		modelAndView.setViewName("admin/index");
		return modelAndView;
	}
	// ��ת������Ա�ĵ�¼����
	@RequestMapping("foradmin")
	public String fortiaozhuan() {
		return "admin/login";
	}
	// ������Ŀҳ�����ʾ
	@RequestMapping("type")
	public ModelAndView seetype() {
		ModelAndView modelAndView = new ModelAndView();
		//
		List<Type> seeAlltype = protype.seeAlltype();
		modelAndView.addObject("typelist", seeAlltype);
		modelAndView.setViewName("admin/addclass");
		return modelAndView;
	}
	// ��Ŀ����������
	@RequestMapping("addtype")
	public String addtype(Type type) {
		// ������������
		protype.addtype(type);
		return "redirect:/type";
	}
	@RequestMapping("prochange/{id}")
	public String shenhe(@PathVariable("id") Integer id) {
		project.changeTong(id);
		System.out.println("ok");
		return "redirect:/tongguo";
	}
	// ����Ա�ĵ�¼�Ĳ���
	// ����Ϣ���з���
	@RequestMapping("adminlogin")
	@ResponseBody
	public Result adminLogin(String name, String password, HttpSession session) {
		// ����Ա�ĵ�¼����
		try {
			// ���е�¼ ����Ϣ���м���
			System.out.println(name + "" + "" + password);
			Admin login = admin.login(name, password);
			System.out.println("jacktom");
			session.setAttribute("admin", login);
			System.out.println(login);
			return new Result(89, null, null);
		} catch (UserException e) {
			// TODO Auto-generated catch block
			return new Result(80, e.getMessage(), null);
		}
	}
	@RequestMapping("adminmanager")
	public ModelAndView usermana() {
		ModelAndView modelAndView = new ModelAndView();
		// �����е��û�����Ϣ���в鿴
		List<User> seeall = admin.seeAllUser();
		modelAndView.addObject("userlist", seeall);
		modelAndView.setViewName("admin/usermanager");
		return modelAndView;
	}

	@RequestMapping("deletesuer/{id}")
	public String delteuser(@PathVariable("id") Integer id) {
		admin.deletadmin(id);
		return "forward:adminmanager";
	}

	@RequestMapping(value = "weather", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String weather(String city1, HttpServletResponse response) {
		// ƴ��ַ
		System.out.println(city1);
		response.setCharacterEncoding("text/html,charset=utf-8");
		try {
			String city = java.net.URLEncoder.encode(city1, "utf-8");
			System.out.println("sdfsdf");
			String apiUrl = String.format("https://www.sojson.com/open/api/weather/json.shtml?city=%s", city);
			URL url = new URL(apiUrl);
			URLConnection open = url.openConnection();
			InputStream input = open.getInputStream();
			// ���õ������ݽ��з�װ
			String result = org.apache.commons.io.IOUtils.toString(input, "utf-8");
			System.out.println(result);
			return result;
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return city1;
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return city1;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return city1;
		}
	}
	@RequestMapping("adminproject")
	public ModelAndView allproject(){
		ModelAndView modelAndView=new ModelAndView();
		List<Project> seeAll = project.seeAll();
		modelAndView.addObject("projectlist",seeAll);
		modelAndView.setViewName("admin/productlist");
		return modelAndView;
	}
	//������������
	@RequestMapping("mohuchazhao")
	@ResponseBody
	public List<Project> mohuchanzhao(String type,String state,String name){
		List<Project> mohuchazhao = project.mohuchazhao(state, type);

		return mohuchazhao;
		
	}

}
