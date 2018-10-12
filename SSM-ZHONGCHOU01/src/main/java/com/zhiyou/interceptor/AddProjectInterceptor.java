package com.zhiyou.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zhiyou.pojo.Result;
import com.zhiyou.pojo.User;

//���в���������
public class AddProjectInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//���ݷ���ֵ�ǲ���true false��controller����
		// TODO Auto-generated method stub
		//��������
		//����������سɹ�
		//�������ݵ��ж� �������ķ���ֵ���и�ֵ
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		//�ж��û��Ƿ��Ѿ���¼
		if (user == null) {
			//�û�δ��¼
			Result result = new Result(-1, "�û�δ��¼", null);
			//�Ѷ���ת����json����
			ObjectMapper mapper = new ObjectMapper();
			String jsonData = mapper.writeValueAsString(result);
			System.out.println(jsonData);
			//��json������Ӧ���ͻ���
			response.getWriter().write(jsonData);
			//����������ֱ�ӽ��з���
			return false;
		}
		return true;
	}
}
