package com.pramati.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="validations")

public class LoginController {

	@RequestMapping(value="/login" , method = RequestMethod.POST)
	public ModelAndView getLogin() {
		ModelAndView view = new ModelAndView("logincntroller");
		return view;
	}
}
