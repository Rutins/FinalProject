package com.kgitbank.front.service;

import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.front.vodao.FrontDAO;
import com.kgitbank.front.vodao.FrontVO;
@Service("frontService")
public class FrontServiceImpl implements FrontService {
	@Autowired
	private FrontDAO frontDAO;
	
	@Override
	public ArrayList<String> APIRoadKind(FrontVO vo) throws IOException, ParseException {
		// TODO Auto-generated method stub
		return frontDAO.APIRoadKind(vo);
	}

	@Override
	public ArrayList<String> APIRoadName(FrontVO vo) throws IOException, ParseException {
		// TODO Auto-generated method stub
		return frontDAO.APIRoadName(vo);
	}
	
}
