package com.pramati.controllers;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.pramati.dao.UsersDAO;
import com.pramati.model.Users;

public class FrontControllerTest {

	@Test
	public void testGetLoginValidate() {
		//fail("Not yet implemented");
		String username="suresh";
		String password="456";
		//ApplicationContext context = new ClassPathXmlApplicationContext("/home/sureshy/eclipse-workspace/turvomanagement/src/main/webapp/WEB-INF/applicationContext.xml");
		ApplicationContext context1 = new FileSystemXmlApplicationContext("/home/sureshy/eclipse-workspace/turvomanagement/src/main/resources/applicationContext.xml"); 
		UsersDAO usersDAO = (UsersDAO) context1.getBean("usersDAO");
		String role = usersDAO.getRole(username,password);
		assertEquals("teller", role);
	}

}
