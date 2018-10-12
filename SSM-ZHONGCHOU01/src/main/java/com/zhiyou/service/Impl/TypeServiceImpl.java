package com.zhiyou.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.TypeMapper;
import com.zhiyou.pojo.Type;
import com.zhiyou.service.TypeService;

@Service
public class TypeServiceImpl  implements  TypeService{
    @Autowired
	TypeMapper typeMapper;
	public List<Type> seeAlltype() {
		// TODO Auto-generated method stub
		List<Type> allType = typeMapper.allType();
		return allType;
	}
	public void addtype(Type type) {
		// TODO Auto-generated method stub
		typeMapper.addtype(type);
		
	}

}
