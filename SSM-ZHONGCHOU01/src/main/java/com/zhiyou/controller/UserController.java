package com.zhiyou.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.zhiyou.exception.RegisterException;
import com.zhiyou.exception.UserException;
import com.zhiyou.pojo.Project;
import com.zhiyou.pojo.Result;
import com.zhiyou.pojo.User;
import com.zhiyou.service.PingLunService;
import com.zhiyou.service.ProjectService;
import com.zhiyou.service.UserService;
import com.zhiyou.util.SendMessageUtil;
import com.zhiyou.util.Yanzhengma;

@Controller
public class UserController {
	// 用户操作
	@Autowired
	UserService suerService;
	@Autowired
	ProjectService projectService;
	
	
	@Autowired
	PingLunService pingLunService;
	ModelAndView moudAndView = new ModelAndView();

	// 接收ajax的请求，telnumber 和password
	@RequestMapping("loginuser")
	@ResponseBody
	public Result addUser(String telnumber, String password, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		try {
			// 数据的修改
			User loginUser = suerService.loginUser(telnumber, password);
			String yan = (String) session.getAttribute("yanzheng");
			System.out.println("sdfasdfasdfasdfasdfasdf");
			return new Result(4, null, null);
		} catch (UserException e) {
			// TODO Auto-generated catch block
			return new Result(5, e.getMessage(), null);
		}
	}

	@RequestMapping("register")
	@ResponseBody
	public Result registerUser(String telnumber, String password,String yanzheng,HttpSession session) {
		// ModelAndView moudAndView = new ModelAndView();
		try {
		    String yanzhengma =(String)session.getAttribute("yanzheng");
		    if(yanzheng.equals(yanzhengma)){
		    	User loginUser= suerService.register(telnumber, password);
		    	User user=new User();
		    	user.setTelnumber(telnumber);
		    	user.setPassword(password);
		    	session.setAttribute("user", user);
		    }
			return new Result(1, null, null);
		} catch (RegisterException e) {
			// TODO Auto-generated catch block
			return new Result(2, e.getMessage(), null);
		}
	}

	@RequestMapping("forregister")
	public String forregister() {
		return "register";
	}

	@RequestMapping("login")
	public String loginUser() {
		// ModelAndView moudAndView = new ModelAndView();
		return "login";
	}

	@RequestMapping("ceshilogin")
	@ResponseBody
	// 登录页面的ajax的请求 返回错误的请求的返回
	public Result ceshilogin(String telnumber, String password, HttpSession session) {
		try {
			System.out.println("sdfsdf");
			User loginUser = suerService.loginUser(telnumber, password);
			session.setAttribute("user", loginUser);
			// 登录成功 将用户的对象加入session中
			return new Result(0, null, null);
		} catch (UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new Result(-1, e.getMessage(), null);
		}
	}

	// 进行发送验证法的操作
	// 进行验证码的操作
	@RequestMapping("yanzheng")
	@ResponseBody
	public String addUser(String telnumber, HttpSession session) {
		System.out.println(Yanzhengma.yangzheng());
		System.out.println(telnumber);
		try {
			SendMessageUtil.sendms(telnumber, Yanzhengma.yangzheng());
			User user = new User();
			user.setTelnumber(telnumber);
			session.setAttribute("yanzheng", Yanzhengma.yangzheng());
			session.setAttribute("user", user);
			System.out.println(session.getAttribute("yanzheng"));
		} catch (ServerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	@RequestMapping("add")
	public String see() {
		return "login";
	}

	// 产看参与的项目
	@RequestMapping("canyu")
	public ModelAndView canYun(int id) {
		List<Project> seeCanYu = suerService.seeCanYu(id);
		moudAndView.addObject("canyu", seeCanYu);
		moudAndView.setViewName("user/canyu");
		return moudAndView;
	}

	// 查看发起的项目情况
	// @RequestMapping("faqi")
	public ModelAndView faQi(int id) {
		List<Project> seeFaQi = suerService.seeFaQi(id);
		moudAndView.addObject("faqi", seeFaQi);
		moudAndView.setViewName("user/faqi");
		return moudAndView;
	}

	// 进行用户信息的修改
	@RequestMapping("changeuser")
	public void pingLun(User user, MultipartFile file, HttpSession session) {
		System.out.println("54564564645");
		String destPath = session.getServletContext().getRealPath("upload/user");
		String fileName = file.getOriginalFilename();
		// 进行数据文件名字的获取,并且进行文件名字的拼接
		UUID uuid = UUID.randomUUID();
		String destFileName = uuid + "." + FilenameUtils.getExtension(fileName);
		File destFile = new File(destPath, destFileName);
		// 将文件的名称进行存储
		user.setImage(destFileName);
		user.setId(1);
		// 写入
		System.out.println(destFileName);
		try {
			file.transferTo(destFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		suerService.changeUser(user);
		System.out.println("信息修改成功");
	}

	@RequestMapping("register1")
	@ResponseBody
	public Result regist() {
		return null;
	}

	@RequestMapping("userinforchange")
	public ModelAndView forChange(HttpSession session) {
		User user = (User) session.getAttribute("user");
		ModelAndView modelAndView = new ModelAndView();
		User seeUser = suerService.seeUser(1);
		modelAndView.addObject("user", seeUser);
		modelAndView.setViewName("user/changefile");
		return modelAndView;
	}

	// 资金的管理
	// 进行页面的跳转
	@RequestMapping("found")
	public ModelAndView moneyManager(HttpSession session) {
		User user = (User) session.getAttribute("user");
		ModelAndView modelAndView = new ModelAndView();
		User seeUser = suerService.seeUser(1);
		modelAndView.addObject("user", seeUser);
		modelAndView.setViewName("user/found");
		return modelAndView;
	}

	/*@RequestMapping("registeruser")
	@ResponseBody
	public Result registerUser(String telnumber, String password, HttpSession session) {
		return null;
	}*/

	// 处理表单的实名请求
	@RequestMapping("shiming")
	public void shiming(User user, @RequestParam("file1") MultipartFile file1,
			@RequestParam("file2") MultipartFile file2, HttpSession session) {
		// 对文件进行接收 使用user类进行接收
		System.out.println(file1);
		// 进行文件的接收
		String fileName = file1.getOriginalFilename();
		String videoname = file2.getOriginalFilename();
		System.out.println(fileName);
		ModelAndView modelAndView = new ModelAndView();
		// 将身份证图片正面和背面进行上传
		String destPath = session.getServletContext().getRealPath("upload/user");
		UUID uuid = UUID.randomUUID();
		UUID uuid1 = UUID.randomUUID();

		User user2 = (User) session.getAttribute("user");
		System.out.println(user2.getId());

		String destFileName = uuid + "." + FilenameUtils.getExtension(fileName);
		String videoString = uuid1 + "." + FilenameUtils.getExtension(videoname);
		File destFile = new File(destPath, destFileName);
		// 将身份证的图片进行上传
		File videofile = new File(destPath, videoString);
		// 写入
		try {
			file1.transferTo(destFile);
			// 将视频数据进行上传
			file2.transferTo(videofile);
			// 进行视频文件名的存储
			user.setId(user2.getId());
			user.setIdimage(videoString);
			// 进行图片的文件名的存储
			user.setIdimageback(destFileName);
			// 实名信息的上传
			suerService.shiming(user);
			System.out.println("实名信息上传成功");

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 页面修改成功后进行页面的跳转
	}

	// 进行注册页面的跳转 成功进入主界面，并且将页面，不成功继续进行注册
	@RequestMapping("")
	public String regis(String telnumber, String pwd) {
		try {
			suerService.register(telnumber, pwd);
			return "forward:hello";
		} catch (RegisterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "forward:";
	}

	@RequestMapping("forshiming")
	public String forshiming() {
		return "user/shiming";
	}

	// 查看所有的信息的查看
	@RequestMapping("tongguo")
	public ModelAndView tongguo() {
		List<User> tongguo = suerService.tongguo();
		List<User> weitongguo = suerService.weitongguo();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("tongguo", tongguo);
		List<Project> seeAll = projectService.seeAll();
		modelAndView.addObject("projectlist", seeAll);
		// modelAndView.addObject("weitongguo", weitongguo);
		modelAndView.setViewName("admin/usershenhe");
		return modelAndView;
	}
	// 进行状态的改变
	// 状态改变后不进行页面的跳转 ,采用重定向的方法返回一个字符串，不经过试图解析器直接去找映射路径
	@RequestMapping("changetong/{id}")
	public String changeztong(@PathVariable("id") Integer id) {
		suerService.changetongguo(id);
		System.out.println(id);
		// 将数据进行传入
		return "redirect:/tongguo";
	}
	  @RequestMapping("addpinglun")
	  public String addping(String ping,HttpSession session){
		  User user=(User)session.getAttribute("user");
		  Integer id = (Integer)session.getAttribute("pid");
		 //将评论的数据添加到数据库中  将数据进行添加数据库
		  suerService.addPing(user.getId(), id, ping);
		  return "redirect:/seeping";
	  }
	  @RequestMapping("tianjiapinglun")
	  @ResponseBody
	  public Project receive(int pid,HttpSession session){
		  System.out.println("78979");
		  session.setAttribute("pid", pid);
		  
		  Project seeProjectbyid = projectService.seeProjectbyid(pid);
		  
		  return seeProjectbyid;
		  
	  }
}
