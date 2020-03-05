package com.kgitbank.front.vodao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Repository;
@Repository
public class FrontDAO {
	public ArrayList<String> APIRoadKind(FrontVO vo) throws IOException, ParseException {
		String skey = "eZ%2F7pGiWqqvhlkGmf57JYKGih5zv%2FZImo%2FCS%2F6bJy3oE4WFYHiLlXBw2nctMQ4nPRxbH9d0sCXtci%2Bpv4nC0dg%3D%3D";
		StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/restarea-std?serviceKey="+skey); /*URL*/
        
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/
	    
        
        URL url = new URL(urlBuilder.toString());
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/json");
	    System.out.println("Response code: " + conn.getResponseCode());
	    BufferedReader rd;
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	    	rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    } else {
	    	rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	    }
	    StringBuilder sb = new StringBuilder();
	        
	    String line;
	    while ((line = rd.readLine()) != null) {
	    	sb.append(line);
	    }
	        
	    rd.close();
	    conn.disconnect();
	      
	    JSONParser parser = new JSONParser();
		JSONObject job = (JSONObject) parser.parse(sb.toString());
		JSONObject job2 =  (JSONObject) job.get("response");
		JSONObject job3 =  (JSONObject) job2.get("body");
		JSONArray ja = (JSONArray) job3.get("items");
		ArrayList<String> ar1 = new ArrayList<String>();
	    for (int i = 0; i < ja.size(); i++) {
	    	JSONObject unitname = (JSONObject) ja.get(i);
			ar1.add((String) unitname.get("roadKnd"));
			
		}
	    HashSet<String> hs = new HashSet<String>(ar1);
		
		ArrayList<String> ar2 = new ArrayList<String>(hs);
		
		System.out.println(ar2);
		
	    return ar2;
	}
	
	public ArrayList<String> APIRoadName(FrontVO vo) throws IOException, ParseException {
		String skey = "eZ%2F7pGiWqqvhlkGmf57JYKGih5zv%2FZImo%2FCS%2F6bJy3oE4WFYHiLlXBw2nctMQ4nPRxbH9d0sCXtci%2Bpv4nC0dg%3D%3D";
		StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/restarea-std?serviceKey="+skey); /*URL*/
        
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/
        urlBuilder.append("&" + URLEncoder.encode("roadKnd","UTF-8") + "=" + URLEncoder.encode(vo.getRoadKnd(), "UTF-8"));
	    
        
        URL url = new URL(urlBuilder.toString());
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/json");
	    System.out.println("Response code: " + conn.getResponseCode());
	    BufferedReader rd;
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	    	rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    } else {
	    	rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	    }
	    StringBuilder sb = new StringBuilder();
	        
	    String line;
	    while ((line = rd.readLine()) != null) {
	    	sb.append(line);
	    }
	        
	    rd.close();
	    conn.disconnect();
	      
	    JSONParser parser = new JSONParser();
		JSONObject job = (JSONObject) parser.parse(sb.toString());
		JSONObject job2 =  (JSONObject) job.get("response");
		JSONObject job3 =  (JSONObject) job2.get("body");
		JSONArray ja = (JSONArray) job3.get("items");
	    ArrayList<String> ar1 = new ArrayList<String>();
	    for (int i = 0; i < ja.size(); i++) {
			JSONObject unitname = (JSONObject) ja.get(i);
			ar1.add((String) unitname.get("roadRouteNm"));
		}
	    HashSet<String> hs = new HashSet<String>(ar1);
		
		ArrayList<String> ar2 = new ArrayList<String>(hs);
		
	    return ar2;
	}
	
	public ArrayList<String> APIRestName(FrontVO vo) throws IOException, ParseException {
		String skey = "eZ%2F7pGiWqqvhlkGmf57JYKGih5zv%2FZImo%2FCS%2F6bJy3oE4WFYHiLlXBw2nctMQ4nPRxbH9d0sCXtci%2Bpv4nC0dg%3D%3D";
		StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/restarea-std?serviceKey="+skey); /*URL*/
        
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/
        urlBuilder.append("&" + URLEncoder.encode("roadRouteNm","UTF-8") + "=" + URLEncoder.encode(vo.getRoadRouteNm(), "UTF-8"));
	    
        
        URL url = new URL(urlBuilder.toString());
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/json");
	    System.out.println("Response code: " + conn.getResponseCode());
	    BufferedReader rd;
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	    	rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    } else {
	    	rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	    }
	    StringBuilder sb = new StringBuilder();
	        
	    String line;
	    while ((line = rd.readLine()) != null) {
	    	sb.append(line);
	    }
	        
	    rd.close();
	    conn.disconnect();
	      
	    JSONParser parser = new JSONParser();
		JSONObject job = (JSONObject) parser.parse(sb.toString());
		JSONObject job2 =  (JSONObject) job.get("response");
		JSONObject job3 =  (JSONObject) job2.get("body");
		JSONArray ja = (JSONArray) job3.get("items");
	    ArrayList<String> ar1 = new ArrayList<String>();
	    for (int i = 0; i < ja.size(); i++) {
			JSONObject unitname = (JSONObject) ja.get(i);
			ar1.add((String) unitname.get("entrpsNm"));
		}
	    HashSet<String> hs = new HashSet<String>(ar1);
		
		ArrayList<String> ar2 = new ArrayList<String>(hs);
		
	    return ar2;
	}
}
