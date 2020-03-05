package com.kgitbank.front.service;

import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.parser.ParseException;

import com.kgitbank.front.vodao.FrontVO;

public interface FrontService {
	public ArrayList<String> APIRoadKind(FrontVO vo) throws IOException, ParseException;
	
	public ArrayList<String> APIRoadName(FrontVO vo) throws IOException, ParseException;
	
}
