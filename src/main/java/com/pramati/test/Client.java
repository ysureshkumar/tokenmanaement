package com.pramati.test;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.pramati.dao.CustomerDAO;
import com.pramati.model.Customer;

public class Client {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("resources1/test.xml");
		CustomerDAO custDAO = (CustomerDAO) context.getBean("custDAO");
		Customer c = new Customer();
		
		Integer max  = custDAO.maxId();
		System.out.println("success: "+ max);
		if( max == null) {
			c.setId(1);	
		}
		else {
			c.setId(max);
		}
		c.setName("suresh");
		c.setPhno("9393681779");
		c.setServiceType("prime");
		c.setAddress("hyderabad");
		System.out.println("Inserted: "+custDAO.save(c));
		
		context.close();
	}

}
