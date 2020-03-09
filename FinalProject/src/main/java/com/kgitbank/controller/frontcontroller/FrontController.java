package com.kgitbank.controller.frontcontroller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	public String APIRoadName(HttpServletRequest req, Model model) throws IOException, ParseException {
		
		FrontVO vo = new FrontVO();
		vo.setRoadKnd((String) req.getParameter("roadKind"));
		model.addAttribute("APIRoadName",frontService.APIRoadName(vo));
		
		return "RoadName";
		
	}
	
	@RequestMapping(value = "/getAPIRestName", method = RequestMethod.POST)
	public String APIRestName(HttpServletRequest req, Model model) throws IOException, ParseException {
		
		FrontVO vo = new FrontVO();
		vo.setRoadRouteNm((String) req.getParameter("roadName"));
		model.addAttribute("APIRestName",frontService.APIRestName(vo));
		
		return "RestName";
		
	}
	
	@RequestMapping(value = "/getAPIList", method = RequestMethod.GET)
	public String APIList(FrontVO vo, Model model) throws IOException, ParseException {
		
		model.addAttribute("APIList",frontService.APIList(vo));
		
		return "List";
		
	}
	
}
