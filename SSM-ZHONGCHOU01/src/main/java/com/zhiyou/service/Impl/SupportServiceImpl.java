package com.zhiyou.service.Impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhiyou.exception.UserException;
import com.zhiyou.mapper.SupportMapper;
import com.zhiyou.pojo.Support;
import com.zhiyou.service.SupportService;
@Service
public class SupportServiceImpl  implements SupportService{
    @Autowired
    SupportMapper supportMapper;
	public List<Support> seeAllByUser(int id) {
		// TODO Auto-generated method stub
	   List<Support> seeAllUser = supportMapper.seeAllUser(id);	
	   return seeAllUser;
	}
	public List<Support> seeAll() {
		// TODO Auto-generated method stub
		return null;
	}
	//���е��޵Ĳ���
	public void addSupport(int uid, int pid) throws UserException {
		// TODO Auto-generated method stub
		//���е��޼�¼�Ĳ�������ɹ�����1  �������0���ʾû�в���ɹ�
		if(supportMapper.addInsert(uid, pid)==1){
			System.out.println("���޼�¼����ɹ�");
		}
		else{
			throw new UserException("���޼�¼����ʧ��");
		}
	}
}
