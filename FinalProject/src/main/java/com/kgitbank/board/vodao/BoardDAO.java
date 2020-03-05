package com.kgitbank.board.vodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Repository;

import com.kgitbank.dbconn.Dbconn;

@Repository("boardDAO")
public class BoardDAO {
	private Connection con;
	private PreparedStatement st;
	private ResultSet rs;
	
	public BoardDAO() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated constructor stub
		con = new Dbconn().getConnection();
	}
	
	public boolean BoardWrite(BoardVO vo) throws SQLException {
		String sql = "insert into boardtable values((SELECT NVL(MAX(board_number),0)+1 FROM boardtable),?,?,?,?,?,0,?)";
		st = con.prepareStatement(sql);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(new Date());
		st.setString(1, vo.getCategory());
		st.setString(2, vo.getTitle());
		st.setString(3, vo.getText());
		st.setString(4, vo.getWriter());
		st.setString(5, sysdate);
		st.setString(6, vo.getImg_name());
		int aa = st.executeUpdate();
		
		if(aa==1) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public boolean BoardDelete(BoardVO vo) throws SQLException {
		String sql = "delete from boardtable where board_number = ? ";
		st = con.prepareStatement(sql);
		
		st.setInt(1, vo.getBoard_number());
		
		int aa = st.executeUpdate();
		
		if(aa==1) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public boolean BoardUpdate(BoardVO vo) throws SQLException {
		String sql = "update boardtable set category = ?, title = ?, text = ?, writer = ?, w_date = ?"
				+ " where board_number = ? ";
		st = con.prepareStatement(sql);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		st.setString(1, vo.getCategory());
		st.setString(2, vo.getTitle());
		st.setString(3, vo.getText());
		st.setString(4, vo.getWriter());
		st.setString(5, sdf.format(new Date()));
		st.setInt(6, vo.getBoard_number());
		
		int aa = st.executeUpdate();
		
		if(aa==1) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public boolean BoardView_cnt(BoardVO vo) throws SQLException {
		String sql = "update boardtable set view_cnt = view_cnt+1 where board_number = ?";
		st = con.prepareStatement(sql);
		
		st.setInt(1, vo.getBoard_number());
		
		int aa = st.executeUpdate();
		
		if(aa==1) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public ArrayList<BoardVO> BoardList() throws SQLException, ParseException {
		String sql = "select * from boardtable";
		
		st = con.prepareStatement(sql);
		
		rs = st.executeQuery();
		
		ArrayList<BoardVO> ar1 = new ArrayList<BoardVO>();
		
		while(rs.next()) {
			BoardVO vo = new BoardVO();
			vo.setBoard_number(rs.getInt("board_number"));
			vo.setCategory(rs.getString("category"));
			vo.setTitle(rs.getString("title"));
			vo.setText(rs.getString("text"));
			vo.setWriter(rs.getString("writer"));
			vo.setW_date(rs.getDate("w_date"));
			vo.setView_cnt(rs.getInt("view_cnt"));
			vo.setImg_name(rs.getString("img_name"));
			
			ar1.add(vo);
		}
		
		return ar1;
		
	}
	
	public ArrayList<BoardVO> BoardSearch_Category(BoardVO vo) throws SQLException {
		String sql = "select * from boardtable where category = ?";
		
		st = con.prepareStatement(sql);
		st.setString(1, vo.getCategory());
		rs = st.executeQuery();
		
		ArrayList<BoardVO> ar1 = new ArrayList<BoardVO>();
		
		while(rs.next()) {
			BoardVO vo1 = new BoardVO();
			vo1.setBoard_number(rs.getInt("board_number"));
			vo1.setCategory(rs.getString("category"));
			vo1.setTitle(rs.getString("title"));
			vo1.setText(rs.getString("text"));
			vo1.setWriter(rs.getString("writer"));
			vo1.setW_date(rs.getDate("w_date"));
			vo1.setView_cnt(rs.getInt("view_cnt"));
			vo1.setImg_name(rs.getString("img_name"));
			
			ar1.add(vo1);
		}
		
		return ar1;
		
	}
	
	public ArrayList<BoardVO> BoardSearch_title(BoardVO vo) throws SQLException {
		String sql = "select * from boardtable where title = ?";
		
		st = con.prepareStatement(sql);
		st.setString(1, vo.getTitle());
		rs = st.executeQuery();
		
		ArrayList<BoardVO> ar1 = new ArrayList<BoardVO>();
		
		while(rs.next()) {
			BoardVO vo1 = new BoardVO();
			vo1.setBoard_number(rs.getInt("board_number"));
			vo1.setCategory(rs.getString("category"));
			vo1.setTitle(rs.getString("title"));
			vo1.setText(rs.getString("text"));
			vo1.setWriter(rs.getString("writer"));
			vo1.setW_date(rs.getDate("w_date"));
			vo1.setView_cnt(rs.getInt("view_cnt"));
			vo1.setImg_name(rs.getString("img_name"));
			
			ar1.add(vo1);
		}
		
		return ar1;
		
	}
	
	public ArrayList<BoardVO> BoardSearch_writer(BoardVO vo) throws SQLException {
		String sql = "select * from boardtable where writer = ?";
		
		st = con.prepareStatement(sql);
		st.setString(1, vo.getWriter());
		rs = st.executeQuery();
		
		ArrayList<BoardVO> ar1 = new ArrayList<BoardVO>();
		
		while(rs.next()) {
			BoardVO vo1 = new BoardVO();
			vo1.setBoard_number(rs.getInt("board_number"));
			vo1.setCategory(rs.getString("category"));
			vo1.setTitle(rs.getString("title"));
			vo1.setText(rs.getString("text"));
			vo1.setWriter(rs.getString("writer"));
			vo1.setW_date(rs.getDate("w_date"));
			vo1.setView_cnt(rs.getInt("view_cnt"));
			vo1.setImg_name(rs.getString("img_name"));
			
			ar1.add(vo1);
		}
		
		return ar1;
		
	}
}
