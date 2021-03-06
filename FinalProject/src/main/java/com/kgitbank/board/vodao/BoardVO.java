package com.kgitbank.board.vodao;

import java.util.Date;

public class BoardVO {
	private int board_number;
	private String category;
	private String title;
	private String text;
	private String writer;
	private Date w_date;
	private int view_cnt;
	private String img_name;
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getBoard_number() {
		return board_number;
	}


	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}


	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}


	public String getImg_name() {
		return img_name;
	}


	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

}
