package com.pramati.controllers;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Queue;

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
import com.pramati.dao.UsersDAO;
import com.pramati.model.Customer;
import com.pramati.model.Token;
import com.pramati.model.WaitingToken;

@Controller
public class FrontController {

	XmlWebApplicationContext context = null;

	int limit = 5;

	// Active Queues
	Queue<Integer> counterIQ = new LinkedList<Integer>();
	Queue<Integer> counterIIQ = new LinkedList<Integer>();
	Queue<Integer> counterIIIQ = new LinkedList<Integer>();
	Queue<Integer> counterIIIIQ = new LinkedList<Integer>();

	// Waiting Queues
	Queue<WaitingToken> counterWQ = new LinkedList<WaitingToken>();

	@RequestMapping(value = "/")
	public ModelAndView getHome(HttpServletRequest request) {
		loadPendingTokensIntoQueue(request);
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

	public void loadPendingTokensIntoQueue(HttpServletRequest request) {
		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();

		Map mp = new HashMap();
		try {

			CountersDAO counterDAO = (CountersDAO) context.getBean("countersDAO");
			List<Token> ptokenList = counterDAO.getPendingTokens();
			Iterator<Token> it = ptokenList.iterator();
			while(it.hasNext()) {
				Token tt = it.next();
				int tid = tt.getTokenId();
				int cid = tt.getCounter();
				if (cid == 1) {
					counterIQ.add(tid);
				}
				if (cid == 2) {
					counterIIQ.add(tid);
				}
				if (cid == 3) {
					counterIIIQ.add(tid);
				}
				if (cid == 4) {
					counterIIIIQ.add(tid);
				}
			}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
	}
	@RequestMapping(value = "/loginvalidate", method = RequestMethod.POST)
	public ModelAndView getLoginValidate(@RequestParam("username") String username,
			@RequestParam("password") String password, HttpServletRequest request) {

		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();

		UsersDAO usersDAO = (UsersDAO) context.getBean("usersDAO");

		ModelAndView view = null;
		Map mp = new HashMap();
		String role = usersDAO.getRole(username, password);
		if (role.equals("teller")) {
			view = new ModelAndView("tokenmanagement");
			return view;
		} else if (role.equals("operator") || role.equals("manager")) {
			view = new ModelAndView("managecounterspage");
			return view;
		} else {
			mp.put("response", "Invalid Username and Password");
			view = new ModelAndView("login", mp);
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
			String servicetype = c.getServiceType();
			String address = c.getAddress();
			System.out.println("Record: " + id + ":" + name + ":" + phno + ":" + servicetype + ":" + address);
			mp.put("id", id);
			mp.put("name", name);
			mp.put("phno", phno);
			mp.put("servicetype", servicetype);
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
		TokenDAO tokenDAO = (TokenDAO) context.getBean("tokenDAO");

		if (counterWQ.size() > 0) {

			WaitingToken waitingToken = counterWQ.peek();

			Integer tokenId = waitingToken.getTokenId();
			Integer customerId = waitingToken.getCustomerId();
			String serviceOpt = waitingToken.getServices();
			String status = waitingToken.getStatus();
			Integer counter = 0;

			List<Integer> countersList = countersDAO.getCounters(serviceOpt);
			System.out.println("countersList: " + countersList);
			Iterator<Integer> it = countersList.iterator();

			while (it.hasNext()) {
				counter = it.next();
				if (counter == 1) {
					if (counterIQ.size() < limit) {
						waitingToken.setCounter(counter);
						Token t = new Token(waitingToken);
						tokenDAO.save(t);
						counterIQ.add(tokenId);
						counterWQ.remove();
						break;
					}
				}
				if (counter == 2) {
					if (counterIIQ.size() < limit) {
						waitingToken.setCounter(counter);
						Token t = new Token(waitingToken);
						tokenDAO.save(t);
						counterIIQ.add(tokenId);
						counterWQ.remove();
						break;
					}
				}
				if (counter == 3) {
					if (counterIIIQ.size() < limit) {
						waitingToken.setCounter(counter);
						Token t = new Token(waitingToken);
						tokenDAO.save(t);
						counterIIIQ.add(tokenId);
						counterWQ.remove();
						break;
					}
				}
			}
		}

		Map mp = new HashMap();

		String services1 = countersDAO.getServices(1);
		mp.put("services1", services1);
		mp.put("queueOfTokens1", counterIQ);
		mp.put("currentToken1", counterIQ.peek());

		String services2 = countersDAO.getServices(2);
		mp.put("services2", services2);
		mp.put("queueOfTokens2", counterIIQ);
		mp.put("currentToken2", counterIIQ.peek());

		String services3 = countersDAO.getServices(3);
		mp.put("services3", services3);
		mp.put("queueOfTokens3", counterIIIQ);
		mp.put("currentToken3", counterIIIQ.peek());

		String services4 = countersDAO.getServices(4);
		mp.put("services4", services4);
		mp.put("queueOfTokens4", counterIIIIQ);
		mp.put("currentToken4", counterIIIIQ.peek());

		ModelAndView view = new ModelAndView("displaycounters", mp);
		return view;
	}

	@RequestMapping(value = "/createnewtoken", method = RequestMethod.POST)
	public ModelAndView getCreateNewToken(@RequestParam("customerId") Integer customerId,
			@RequestParam("tokenId") Integer tokenId, @RequestParam("services") String services,
			@RequestParam("servicetype") String serviceType, HttpServletRequest request) {

		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();

		Map mp = new HashMap();
		try {

			synchronized (this) {
				Integer counter = 0;
				TokenDAO tokenDAO = (TokenDAO) context.getBean("tokenDAO");
				Token t = new Token();
				t.setTokenId(tokenId);
				t.setCustomerId(customerId);
				if (serviceType.equalsIgnoreCase("prime")) {
					counter = 4;
					t.setCounter(4);
				} else {
					CountersDAO countersDAO = (CountersDAO) context.getBean("countersDAO");
					List<Integer> countersList = countersDAO.getCounters(services);
					System.out.println("countersList: " + countersList);
					Iterator<Integer> it = countersList.iterator();
					while (it.hasNext()) {
						counter = it.next();
						if (counter == 1) {
							if (counterIQ.size() >= limit) {
								continue;
							}
							t.setCounter(counter);
							break;
						}
						if (counter == 2) {
							if (counterIIQ.size() >= limit) {
								continue;
							}
							t.setCounter(counter);
							break;
						}
						if (counter == 3) {
							if (counterIIIQ.size() >= limit) {
								continue;
							}
							t.setCounter(counter);
							break;
						}
					}
				}
				t.setServices(services);
				t.setStatus("progress");

				if (counter == 1) {
					counterIQ.add(tokenId);
					tokenDAO.save(t);
				}
				if (counter == 2) {
					counterIIQ.add(tokenId);
					tokenDAO.save(t);
				}
				if (counter == 3) {
					counterIIIQ.add(tokenId);
					tokenDAO.save(t);
				}
				if (counter == 4) {
					counterIIIIQ.add(tokenId);
					tokenDAO.save(t);
				} else {
					WaitingToken wq = new WaitingToken();
					wq.setTokenId(tokenId);
					wq.setCustomerId(customerId);
					wq.setServices(services);
					wq.setStatus("progress");
					wq.setCounter(5);
					counterWQ.add(wq);
				}
			}
			mp.put("responseBack2", "Token Assigned Successfully");
			ModelAndView view = new ModelAndView("redirect:/createtokenpage", mp);
			// RedirectView view = new RedirectView("createtokenpage");
			return view;
		} catch (Exception e) {
			mp.put("responseBack2", "Token Assignment Failed");
			ModelAndView view = new ModelAndView("redirect:/createtokenpage", mp);
			// RedirectView view = new RedirectView("createtokenpage");
			return view;
		}

	}

	@RequestMapping(value = "/managecounters", method = RequestMethod.GET)
	public ModelAndView getManageCounters(HttpServletRequest request) {

		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();

		CountersDAO countersDAO = (CountersDAO) context.getBean("countersDAO");
		TokenDAO tokenDAO = (TokenDAO) context.getBean("tokenDAO");

		/*
		 * if (counterWQ.size() > 0) {
		 * 
		 * WaitingToken waitingToken = counterWQ.peek();
		 * 
		 * Integer tokenId = waitingToken.getTokenId(); Integer customerId =
		 * waitingToken.getCustomerId(); String serviceOpt = waitingToken.getServices();
		 * String status = waitingToken.getStatus(); Integer counter = 0;
		 * 
		 * List<Integer> countersList = countersDAO.getCounters(serviceOpt);
		 * System.out.println("countersList: " + countersList); Iterator<Integer> it =
		 * countersList.iterator();
		 * 
		 * while (it.hasNext()) { counter = it.next(); if (counter == 1) { if
		 * (counterIQ.size() < limit) { waitingToken.setCounter(counter); Token t = new
		 * Token(waitingToken); tokenDAO.save(t); counterIQ.add(tokenId);
		 * counterWQ.remove(); break; } } if (counter == 2) { if (counterIIQ.size() <
		 * limit) { waitingToken.setCounter(counter); Token t = new Token(waitingToken);
		 * tokenDAO.save(t); counterIIQ.add(tokenId); counterWQ.remove(); break; } } if
		 * (counter == 3) { if (counterIIIQ.size() < limit) {
		 * waitingToken.setCounter(counter); Token t = new Token(waitingToken);
		 * tokenDAO.save(t); counterIIIQ.add(tokenId); counterWQ.remove(); break; } } }
		 * }
		 */
		Map mp = new HashMap();

		String services1 = countersDAO.getServices(1);
		mp.put("services1", services1);
		mp.put("queueOfTokens1", counterIQ);
		mp.put("currentToken1", counterIQ.peek());

		String services2 = countersDAO.getServices(2);
		mp.put("services2", services2);
		mp.put("queueOfTokens2", counterIIQ);
		mp.put("currentToken2", counterIIQ.peek());

		String services3 = countersDAO.getServices(3);
		mp.put("services3", services3);
		mp.put("queueOfTokens3", counterIIIQ);
		mp.put("currentToken3", counterIIIQ.peek());

		String services4 = countersDAO.getServices(4);
		mp.put("services4", services4);
		mp.put("queueOfTokens4", counterIIIIQ);
		mp.put("currentToken4", counterIIIIQ.peek());

		ModelAndView view = new ModelAndView("managecounters", mp);
		return view;
	}

	@RequestMapping(value = "/showcounters", method = RequestMethod.GET)
	public ModelAndView getShowCounters(HttpServletRequest request) {

		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();

		CountersDAO countersDAO = (CountersDAO) context.getBean("countersDAO");
		TokenDAO tokenDAO = (TokenDAO) context.getBean("tokenDAO");

		/*
		 * if (counterWQ.size() > 0) {
		 * 
		 * WaitingToken waitingToken = counterWQ.peek();
		 * 
		 * Integer tokenId = waitingToken.getTokenId(); Integer customerId =
		 * waitingToken.getCustomerId(); String serviceOpt = waitingToken.getServices();
		 * String status = waitingToken.getStatus(); Integer counter = 0;
		 * 
		 * List<Integer> countersList = countersDAO.getCounters(serviceOpt);
		 * System.out.println("countersList: " + countersList); Iterator<Integer> it =
		 * countersList.iterator();
		 * 
		 * while (it.hasNext()) { counter = it.next(); if (counter == 1) { if
		 * (counterIQ.size() < limit) { waitingToken.setCounter(counter); Token t = new
		 * Token(waitingToken); tokenDAO.save(t); counterIQ.add(tokenId);
		 * counterWQ.remove(); break; } } if (counter == 2) { if (counterIIQ.size() <
		 * limit) { waitingToken.setCounter(counter); Token t = new Token(waitingToken);
		 * tokenDAO.save(t); counterIIQ.add(tokenId); counterWQ.remove(); break; } } if
		 * (counter == 3) { if (counterIIIQ.size() < limit) {
		 * waitingToken.setCounter(counter); Token t = new Token(waitingToken);
		 * tokenDAO.save(t); counterIIIQ.add(tokenId); counterWQ.remove(); break; } } }
		 * }
		 */
		Map mp = new HashMap();

		String services1 = countersDAO.getServices(1);
		mp.put("services1", services1);
		mp.put("queueOfTokens1", counterIQ);
		mp.put("currentToken1", counterIQ.peek());

		String services2 = countersDAO.getServices(2);
		mp.put("services2", services2);
		mp.put("queueOfTokens2", counterIIQ);
		mp.put("currentToken2", counterIIQ.peek());

		String services3 = countersDAO.getServices(3);
		mp.put("services3", services3);
		mp.put("queueOfTokens3", counterIIIQ);
		mp.put("currentToken3", counterIIIQ.peek());

		String services4 = countersDAO.getServices(4);
		mp.put("services4", services4);
		mp.put("queueOfTokens4", counterIIIIQ);
		mp.put("currentToken4", counterIIIIQ.peek());

		ModelAndView view = new ModelAndView("showcounters", mp);
		return view;
	}

	@RequestMapping(value = "/managetoken", method = RequestMethod.POST)
	public ModelAndView getManageToken(@RequestParam("tokenId") Integer tokenId, @RequestParam("action") String status,
			HttpServletRequest request) {

		context = new XmlWebApplicationContext();
		context.setConfigLocations("/WEB-INF/applicationContext.xml");
		context.setServletContext(request.getServletContext());
		context.refresh();

		Map mp = new HashMap();
		try {

			synchronized (this) {
				TokenDAO tokenDAO = (TokenDAO) context.getBean("tokenDAO");
				Token t = tokenDAO.getTokenDetails(tokenId);
				System.out.println("Token: " + t);
				t.setStatus(status);
				System.out.println("Token: " + t);
				tokenDAO.update(t);
				Integer counter = t.getCounter();
				if (counter == 1) {
					counterIQ.remove();
				}
				if (counter == 2) {
					counterIIQ.remove();
				}
				if (counter == 3) {
					counterIIIQ.remove();
				}
				if (counter == 4) {
					counterIIIIQ.remove();
				}
				mp.put("response", "Token " + status + " Successfully");
				ModelAndView view = new ModelAndView("redirect:/managecounters", mp);
				return view;
			}
		} catch (Exception e) {
			mp.put("response", "Token " + status + " Successfully");
			ModelAndView view = new ModelAndView("redirect:/managecounters", mp);
			return view;
		}

	}

}
