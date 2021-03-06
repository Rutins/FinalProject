package com.kgitbank.controller.clientcontroller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.client.service.ClientServiceImpl;
import com.kgitbank.client.vodao.ClientVO;

@Controller
public class ClientController {
	@Resource(name="clientService")
	private ClientServiceImpl clientService;
	
	@RequestMapping(value = "/getSignup", method = RequestMethod.GET)
	public String Signup(ClientVO vo, Model model) throws SQLException {
		
		if(clientService.Signup(vo)) {
			return "Main";
		}else {
			return "Signup";
		}
	}
	
	
	@RequestMapping(value = "/getIDCheck", method = RequestMethod.GET)
	public @ResponseBody int IDCheck(@ModelAttribute ClientVO vo,HttpServletRequest req) throws SQLException {
		
		if(clientService.IdDoubleCheck(vo)) {
			return 100;
		}else {
			return 101;
		}
	}
	
	
	@RequestMapping(value = "/getNickNameCheck", method = RequestMethod.GET)
	public @ResponseBody int NickNameCheck(@ModelAttribute ClientVO vo,HttpServletRequest req) throws SQLException {
		
		if(clientService.NicknameDoubleCheck(vo)) {
			HttpSession session = req.getSession();
			ClientVO vo1=(ClientVO)session.getAttribute("loginfo");
			vo1.setNickname(vo.getNickname());
			session.setAttribute("loginfo", vo1);
			return 100;
		}else {
			return 101;
		}
	}
	
	@RequestMapping(value = "/getLogin", method = RequestMethod.GET)
	public String Login(ClientVO vo, Model model, HttpServletRequest req) throws SQLException {
		
		if(clientService.Login(vo)) {
			HttpSession session = req.getSession();
			session.setAttribute("loginfo", clientService.Session(vo));
			return "Main";
		}else {
			model.addAttribute("loginerror", "error");
			return "Main";
		}
	}
	
	@RequestMapping(value = "/getDelete", method = RequestMethod.GET)
	public String Delete(ClientVO vo, Model model, HttpSession session) throws SQLException {
		
		if(clientService.Delete(vo)) {
			session.removeAttribute("loginfo");
			return "Main";
		}else {
			model.addAttribute("deleterror", "error");
			return "Main";
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
	
	@RequestMapping(value = "/NickName", method = RequestMethod.GET)
	public String NickName(ClientVO vo, Model model) throws SQLException {
		
		return "NickName";
	}
	
	@RequestMapping(value = "/IdCheck", method = RequestMethod.GET)
	public String IdCheck(ClientVO vo, Model model) throws SQLException {
		
		return "IdCheck";
	}
	
	@RequestMapping(value = "/getlogout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) throws SQLException {
		HttpSession session = req.getSession();
		session.removeAttribute("loginfo");
		return "Main";
	}


}
