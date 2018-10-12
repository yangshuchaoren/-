package com.zhiyou.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zhiyou.pojo.Result;
import com.zhiyou.pojo.User;

//进行操作的拦截
public class AddProjectInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//根据返回值是不是true false不controller处理
		// TODO Auto-generated method stub
		//数据拦截
		//如果进行拦截成功
		//进行数据的判断 将方法的返回值进行赋值
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		//判断用户是否已经登录
		if (user == null) {
			//用户未登录
			Result result = new Result(-1, "用户未登录", null);
			//把对象转换成json数据
			ObjectMapper mapper = new ObjectMapper();
			String jsonData = mapper.writeValueAsString(result);
			System.out.println(jsonData);
			//把json数据响应给客户端
			response.getWriter().write(jsonData);
			//如果处理错误直接进行返回
			return false;
		}
		return true;
	}
}
