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
	// �û�����
	@Autowired
	UserService suerService;
	@Autowired
	ProjectService projectService;
	
	
	@Autowired
	PingLunService pingLunService;
	ModelAndView moudAndView = new ModelAndView();

	// ����ajax������telnumber ��password
	@RequestMapping("loginuser")
	@ResponseBody
	public Result addUser(String telnumber, String password, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		try {
			// ���ݵ��޸�
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
	// ��¼ҳ���ajax������ ���ش��������ķ���
	public Result ceshilogin(String telnumber, String password, HttpSession session) {
		try {
			System.out.println("sdfsdf");
			User loginUser = suerService.loginUser(telnumber, password);
			session.setAttribute("user", loginUser);
			// ��¼�ɹ� ���û��Ķ������session��
			return new Result(0, null, null);
		} catch (UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new Result(-1, e.getMessage(), null);
		}
	}

	// ���з�����֤���Ĳ���
	// ������֤��Ĳ���
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

	// �����������Ŀ
	@RequestMapping("canyu")
	public ModelAndView canYun(int id) {
		List<Project> seeCanYu = suerService.seeCanYu(id);
		moudAndView.addObject("canyu", seeCanYu);
		moudAndView.setViewName("user/canyu");
		return moudAndView;
	}

	// �鿴�������Ŀ���
	// @RequestMapping("faqi")
	public ModelAndView faQi(int id) {
		List<Project> seeFaQi = suerService.seeFaQi(id);
		moudAndView.addObject("faqi", seeFaQi);
		moudAndView.setViewName("user/faqi");
		return moudAndView;
	}

	// �����û���Ϣ���޸�
	@RequestMapping("changeuser")
	public void pingLun(User user, MultipartFile file, HttpSession session) {
		System.out.println("54564564645");
		String destPath = session.getServletContext().getRealPath("upload/user");
		String fileName = file.getOriginalFilename();
		// ���������ļ����ֵĻ�ȡ,���ҽ����ļ����ֵ�ƴ��
		UUID uuid = UUID.randomUUID();
		String destFileName = uuid + "." + FilenameUtils.getExtension(fileName);
		File destFile = new File(destPath, destFileName);
		// ���ļ������ƽ��д洢
		user.setImage(destFileName);
		user.setId(1);
		// д��
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
		System.out.println("��Ϣ�޸ĳɹ�");
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

	// �ʽ�Ĺ���
	// ����ҳ�����ת
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

	// �������ʵ������
	@RequestMapping("shiming")
	public void shiming(User user, @RequestParam("file1") MultipartFile file1,
			@RequestParam("file2") MultipartFile file2, HttpSession session) {
		// ���ļ����н��� ʹ��user����н���
		System.out.println(file1);
		// �����ļ��Ľ���
		String fileName = file1.getOriginalFilename();
		String videoname = file2.getOriginalFilename();
		System.out.println(fileName);
		ModelAndView modelAndView = new ModelAndView();
		// �����֤ͼƬ����ͱ�������ϴ�
		String destPath = session.getServletContext().getRealPath("upload/user");
		UUID uuid = UUID.randomUUID();
		UUID uuid1 = UUID.randomUUID();

		User user2 = (User) session.getAttribute("user");
		System.out.println(user2.getId());

		String destFileName = uuid + "." + FilenameUtils.getExtension(fileName);
		String videoString = uuid1 + "." + FilenameUtils.getExtension(videoname);
		File destFile = new File(destPath, destFileName);
		// �����֤��ͼƬ�����ϴ�
		File videofile = new File(destPath, videoString);
		// д��
		try {
			file1.transferTo(destFile);
			// ����Ƶ���ݽ����ϴ�
			file2.transferTo(videofile);
			// ������Ƶ�ļ����Ĵ洢
			user.setId(user2.getId());
			user.setIdimage(videoString);
			// ����ͼƬ���ļ����Ĵ洢
			user.setIdimageback(destFileName);
			// ʵ����Ϣ���ϴ�
			suerService.shiming(user);
			System.out.println("ʵ����Ϣ�ϴ��ɹ�");

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ҳ���޸ĳɹ������ҳ�����ת
	}

	// ����ע��ҳ�����ת �ɹ����������棬���ҽ�ҳ�棬���ɹ���������ע��
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

	// �鿴���е���Ϣ�Ĳ鿴
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
	// ����״̬�ĸı�
	// ״̬�ı�󲻽���ҳ�����ת ,�����ض���ķ�������һ���ַ�������������ͼ������ֱ��ȥ��ӳ��·��
	@RequestMapping("changetong/{id}")
	public String changeztong(@PathVariable("id") Integer id) {
		suerService.changetongguo(id);
		System.out.println(id);
		// �����ݽ��д���
		return "redirect:/tongguo";
	}
	  @RequestMapping("addpinglun")
	  public String addping(String ping,HttpSession session){
		  User user=(User)session.getAttribute("user");
		  Integer id = (Integer)session.getAttribute("pid");
		 //�����۵�������ӵ����ݿ���  �����ݽ���������ݿ�
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
