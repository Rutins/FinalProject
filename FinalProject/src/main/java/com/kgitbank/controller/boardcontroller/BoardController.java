package com.kgitbank.controller.boardcontroller;

import java.sql.SQLException;
import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kgitbank.board.service.BoardServiceImpl;
import com.kgitbank.board.vodao.BoardVO;

@Controller
public class BoardController {
	@Resource(name="boardService")
	private BoardServiceImpl boardService;
	
	@RequestMapping(value = "/Board_Write", method = RequestMethod.GET)
	public String BoardWrite(BoardVO vo, Model model) throws SQLException {
		
		if(boardService.BoardWrite(vo)) {
			return "home";
		}else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/Board_Delete", method = RequestMethod.GET)
	public String BoardDelete(BoardVO vo, Model model) throws SQLException {
		
		if(boardService.BoardDelete(vo)) {
			return "home";
		}else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/Board_Update", method = RequestMethod.GET)
	public String BoardUpdate(BoardVO vo, Model model) throws SQLException {
		
		if(boardService.BoardUpdate(vo)) {
			return "home";
		}else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/Board_View_cnt", method = RequestMethod.GET)
	public String BoardView_cnt(BoardVO vo, Model model) throws SQLException {
		if(boardService.BoardView_cnt(vo)) {
			return "home";
		}else {
			return "home";
		}
	}
	
	
	@RequestMapping(value = "/Board_List", method = RequestMethod.GET)
	public String BoardList(HttpServletRequest req, Model model) throws SQLException, ParseException {
		
		model.addAttribute("board_list", boardService.BoardList());
		
		return "Board_List";
	}
	
	@RequestMapping(value = "/Board_Search", method = RequestMethod.GET)
	public String BoardSearch_Category(BoardVO vo, Model model,HttpServletRequest req) throws SQLException, ParseException {
		if(req.getAttribute("option").equals("category")) {
			
			model.addAttribute("board_search_category", boardService.BoardSearch_Category(vo));
			return "Board_List";
		
		}else if(req.getAttribute("option").equals("title")) {
			
			model.addAttribute("board_list", boardService.BoardSearch_title(vo));
			return "Board_List";
			
		}else if(req.getAttribute("option").equals("writer")) {
		
			model.addAttribute("board_list", boardService.BoardSearch_writer(vo));
			return "Board_List";
		
		}else {
			return "Board_List";
		}
		
	}
	
}
