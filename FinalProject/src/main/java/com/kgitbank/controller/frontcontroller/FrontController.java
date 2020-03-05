package com.kgitbank.controller.frontcontroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kgitbank.front.service.FrontServiceImpl;
import com.kgitbank.front.vodao.FrontVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class FrontController {
	
	@Resource(name="frontService")
	private FrontServiceImpl frontService;
	
	@RequestMapping(value = "/getAPIRoadKind", method = RequestMethod.GET)
	public String APIRoadKind(FrontVO vo, Model model) throws IOException, ParseException {
		
		model.addAttribute("APIRoadKind", frontService.APIRoadKind(vo));
		
		return "home";
	}
	
	
	@RequestMapping(value = "/getAPIRoadName", method = RequestMethod.POST)
	public ArrayList<String> APIRoadName(FrontVO vo, Model model) throws IOException, ParseException {
		
		return frontService.APIRoadName(vo);
		
	}
	
}
