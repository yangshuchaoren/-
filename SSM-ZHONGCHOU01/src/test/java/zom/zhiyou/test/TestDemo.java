package zom.zhiyou.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou.mapper.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestDemo {
    @Autowired
	UserMapper userMapper;
    @Test
    public void login(){
    	//userMapper.addStudent("sdfsdf", "78798");
    }
    
	
	
}
