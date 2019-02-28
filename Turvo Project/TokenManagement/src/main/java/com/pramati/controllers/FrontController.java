package com.pramati.controllers;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.XmlWebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.pramati.dao.CountersDAO;
import com.pramati.dao.CustomerDAO;
import com.pramati.dao.TokenDAO;
import com.pramati.model.Customer;
import com.pramati.model.Token;

@Controller
public class FrontController {

	XmlWebApplicationContext context = null;

	@RequestMapping(value = "/")
	public ModelAndView getHome() {
		ModelAndView view = new ModelAndView("home");
		return view;
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView getPage() {
		ModelAndView view = new ModelAndView("home");
		return view;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView getLogin() {
		ModelAndView view = new ModelAndView("login");
		return view;
	}

	@RequestMapping(value = "/aboutus", method = RequestMethod.GET)
	public ModelAndView getAboutus() {
		ModelAndView view = new ModelAndView("aboutus");
		return view;
	}

	/*
	 * @RequestMapping(value="/loginvalidate" , method = RequestMethod.POST) //
	 * public ModelAndView getLoginValidate(@RequestParam("username") Strig
	 * username,@RequestParam("password") String password) { public ModelAndView
	 * getLoginValidate(@PathVariable("username") String
	 * username,@PathVariable("password") String password) {
	 * System.out.println("username:" + username); System.out.println("password:"+
	 * password); ModelAndView view = new ModelAndView("output"); return view; }
	 */

	@RequestMapping(value = "/loginvalidate", method = RequestMethod.POST)
	public ModelAndView getLoginValidate(@RequestParam("username") String username,
			@RequestParam("password") String password) {
//		System.out.println("username:" + username);
//		System.out.println("password:" + password);

		ModelAndView view = null;

		if (username.equals("pramati") && password.equals("123")) {
			view = new ModelAndView("tokenmanagement");
			return view;
		} else {
			view = new ModelAndView("failure");
			return view;
		}
	}

	@RequestMapping(value = "/createcustomerpage", method = RequestMethod.GET)
	public ModelAndView getCreateCustomerPage() {

		ModelAndView view = new ModelAndView("createcustomerpage");
		return view;
	}

	@RequestMapping(value = "/createnewcustomer", method = RequestMethod.POST)
	public ModelAndView getCreateNewCustomer(@RequestParam("name") String name, @RequestParam("phno") String phno,
			@RequestParam("service") String service, @RequestParam("address") String address,
			HttpServletRequest request) {
		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();
		Map<String, String> mp = new HashMap<String, String>();
		try {
			CustomerDAO custDAO = (CustomerDAO) context.getBean("custDAO");
			Customer c = new Customer();
			Integer max = custDAO.maxId();
			if (max == null) {
				c.setId(1);
			} else {
				c.setId(max);
			}
			c.setName(name);
			c.setPhno(phno);
			c.setServiceType(service);
			c.setAddress(address);
			System.out.println("Inserted: " + custDAO.save(c));

			mp.put("responseBack1", "Customer Saved Successfully");
			ModelAndView view = new ModelAndView("createcustomerpage", mp);
			return view;
		} catch (Exception e) {
			mp.put("responseBack1", "Customer Not Saved");
			ModelAndView view = new ModelAndView("createcustomerpage", mp);
			return view;
		}

	}

	@RequestMapping(value = "/createtokenpage", method = RequestMethod.GET)
	public ModelAndView getCreateTokenPage() {

		ModelAndView view = new ModelAndView("createtokenpage");
		return view;
	}

	// actions related to create token page
	// For getting customer Details
	@RequestMapping(value = "/customerdetails", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getCustomerDetails(@RequestParam("id") Integer id, HttpServletRequest request) {

		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();
		TokenDAO tokenDAO = (TokenDAO) context.getBean("tokenDAO");
		Token t = new Token();
		Integer max = tokenDAO.maxId();
		Map mp = new HashMap();
		if (max == null) {
			mp.put("nextTokenId", 1);
		} else {
			mp.put("nextTokenId", max);
		}
		CustomerDAO custDAO = (CustomerDAO) context.getBean("custDAO");
		Customer c = null;
		try {
			c = custDAO.getCustomerDetails(id);
			String name = c.getName();
			String phno = c.getPhno();
			String service = c.getServiceType();
			String address = c.getAddress();
			System.out.println("Record: " + id + ":" + name + ":" + phno + ":" + service + ":" + address);
			mp.put("id", id);
			mp.put("name", name);
			mp.put("phno", phno);
			mp.put("service", service);
			mp.put("address", address);
			System.out.println("mp.put(\"customerDetails_status\", \"\");");
			mp.put("customerDetails_status", "");
			ModelAndView view = new ModelAndView("createtokenpage", mp);
			return view;
		} catch (Exception e) {
			mp.put("customerDetails_status", "Invalid Customer Id");
			System.out.println("mp.put(\"customerDetails_status\", \"Invalid Customer Id\");");
			ModelAndView view = new ModelAndView("createtokenpage", mp);
			return view;
		}

	}

	// For refreshing page to enter new token
	@RequestMapping(value = "/nexttoken", method = RequestMethod.POST)
	public ModelAndView getNextToken(HttpServletRequest request) {

		/*
		 * context = new XmlWebApplicationContext();
		 * context.setConfigLocations("/WEB-INF/applicationContext.xml");
		 * context.setServletContext(request.getServletContext()); context.refresh();
		 */
		TokenDAO tokenDAO = (TokenDAO) context.getBean("tokenDAO");
		Token t = new Token();
		Integer max = tokenDAO.maxId();
		Map mp = new HashMap();

		if (max == null) {
			mp.put("nextTokenId", 1);
		} else {
			mp.put("nextTokenId", max);
		}
		String id = "";
		String name = "";
		String phno = "";
		String service = "";
		String address = "";
		System.out.println("Record: " + id + ":" + name + ":" + phno + ":" + service + ":" + address);
		mp.put("id", id);
		mp.put("name", name);
		mp.put("phno", phno);
		mp.put("service", service);
		mp.put("address", address);
		ModelAndView view = new ModelAndView("createtokenpage", mp);
		return view;
	}

	// actions related to create token page
	// For getting customer Details
	@RequestMapping(value = "/services", method = RequestMethod.POST)
	public ModelAndView getServices(@RequestParam("counter") Integer counterId, HttpServletRequest request) {

		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();

		CountersDAO countersDAO = (CountersDAO) context.getBean("countersDAO");

		String services = countersDAO.getServices(counterId);
		Map mp = new HashMap();
		if (services == null) {
			mp.put("services", "No Services");
		} else {
			mp.put("services", services);
		}
		ModelAndView view = new ModelAndView("createtokenpage", mp);
		return view;

	}

	@RequestMapping(value = "/displaycounters", method = RequestMethod.GET)
	public ModelAndView getDisplayCounters(HttpServletRequest request) {

		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();

		CountersDAO countersDAO = (CountersDAO) context.getBean("countersDAO");

		Map mp = new HashMap();

		String services1 = countersDAO.getServices(1);
		mp.put("services1", services1);

		String services2 = countersDAO.getServices(2);
		mp.put("services2", services2);

		String services3 = countersDAO.getServices(3);
		mp.put("services3", services3);

		String services4 = countersDAO.getServices(4);
		mp.put("services4", services4);

		ModelAndView view = new ModelAndView("displaycounters", mp);
		return view;
	}

	@RequestMapping(value = "/createnewtoken", method = RequestMethod.POST)
	public ModelAndView getCreateNewToken(
			@RequestParam("customerId") String customerId, @RequestParam("tokenId") String tokenId, @RequestParam("services") String services, @RequestParam("counter") String counter, HttpServletRequest request) {

		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();
		Map mp = new HashMap();
		try {
			TokenDAO tokenDAO = (TokenDAO) context.getBean("tokenDAO");
			Token t = new Token();
			t.setTokenId(Integer.parseInt(tokenId));
			t.setCustomerId(Integer.parseInt(customerId));
			t.setCounter(counter);
			t.setServices(services);
			t.setStatus("progress");
			tokenDAO.save(t);
			mp.put("responseBack2", "Token Assigned Successfully");
			ModelAndView view = new ModelAndView("redirect:/createtokenpage", mp);
			//RedirectView view = new RedirectView("createtokenpage");
			return view;
		} catch (Exception e) {
			mp.put("responseBack2", "Token Assignment Failed");
			ModelAndView view = new ModelAndView("redirect:/createtokenpage", mp);
			//RedirectView view = new RedirectView("createtokenpage");
			return view;
		}
		
	}
	

}
