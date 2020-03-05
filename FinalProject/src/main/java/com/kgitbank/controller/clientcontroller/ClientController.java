package com.kgitbank.controller.clientcontroller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kgitbank.client.service.ClientServiceImpl;
import com.kgitbank.client.vodao.ClientVO;

@Controller
public class ClientController {
	@Resource(name="clientService")
	private ClientServiceImpl clientService;
	
	@RequestMapping(value = "/getSignup", method = RequestMethod.GET)
	public String Signup(ClientVO vo, Model model) throws SQLException {
		
		if(clientService.Signup(vo)) {
			return "home";
		}else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/getIDCheck", method = RequestMethod.GET)
	public String IDCheck(ClientVO vo, Model model) throws SQLException {
		
		if(clientService.IdDoubleCheck(vo)) {
			return "home";
		}else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/getNickNameCheck", method = RequestMethod.GET)
	public String NickNameCheck(ClientVO vo, Model model) throws SQLException {
		
		if(clientService.NicknameDoubleCheck(vo)) {
			return "home";
		}else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/getLogin", method = RequestMethod.GET)
	public String Login(ClientVO vo, Model model,HttpServletRequest req) throws SQLException {
		
		if(clientService.Login(vo)) {
			return "home";
		}else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/getDelete", method = RequestMethod.GET)
	public String Delete(ClientVO vo, Model model) throws SQLException {
		
		if(clientService.Delete(vo)) {
			return "home";
		}else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/getClientList", method = RequestMethod.GET)
	public String ClientList(ClientVO vo, Model model) throws SQLException {
		
		model.addAttribute("clientlist", clientService.ClientList());
		
		return "home";
	}
	
	@RequestMapping(value = "/getClientSearch", method = RequestMethod.GET)
	public String ClientSearch(ClientVO vo, Model model) throws SQLException {
		
		model.addAttribute("clientlist", clientService.ClientSearchNameList(vo));
		
		return "home";
	}
	
	@RequestMapping(value = "/getClientSearchId", method = RequestMethod.GET)
	public String ClientSearchId(ClientVO vo, Model model) throws SQLException {
		
		model.addAttribute("clientlist", clientService.SearchId(vo));
		
		return "home";
	}
	
	@RequestMapping(value = "/getClientSearchPw", method = RequestMethod.GET)
	public String ClientSearchPw(ClientVO vo, Model model) throws SQLException {
		
		model.addAttribute("clientlist", clientService.SearchPw(vo));
		
		return "home";
	}
	
	@RequestMapping(value = "/getClientUpdatePw", method = RequestMethod.GET)
	public String ClientUpdatePw(ClientVO vo, Model model) throws SQLException {
		
		model.addAttribute("clientlist", clientService.UpdatePw(vo));
		
		return "home";
	}

}
