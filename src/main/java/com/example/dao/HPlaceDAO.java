package com.example.dao;

import com.example.bean.HPlaceVO;
import com.example.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HPlaceDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String BOARD_INSERT = "insert into HPlace (title, placeName, address, mobile, runTime, dayOff, placeType, star, content) values (?,?,?,?,?,?,?,?,?)";
	private final String BOARD_UPDATE = "update HPlace set title=?, placeName=?, address=?, mobile=?, runTime=?, dayOff=?, placeType=?, star=?, content=? where seq=?";
	private final String BOARD_DELETE = "delete from HPlace  where seq=?";
	private final String BOARD_GET = "select * from HPlace  where seq=?";
	private final String BOARD_LIST = "select * from HPlace order by seq desc";

	public int insertBoard(HPlaceVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getPlaceName());
			stmt.setString(3, vo.getAddress());
			stmt.setString(4, vo.getMobile());
			stmt.setString(5, vo.getRunTime());
			stmt.setString(6, vo.getDayOff());
			stmt.setString(7, vo.getPlaceType());
			stmt.setInt(8, vo.getStar());
			stmt.setString(9, vo.getContent());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteBoard(HPlaceVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateBoard(HPlaceVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getPlaceName());
			stmt.setString(3, vo.getAddress());
			stmt.setString(4, vo.getMobile());
			stmt.setString(5, vo.getRunTime());
			stmt.setString(6, vo.getDayOff());
			stmt.setString(7, vo.getPlaceType());
			stmt.setInt(8, vo.getStar());
			stmt.setString(9, vo.getContent());
			stmt.setInt(10, vo.getSeq());
			
			
			System.out.println(vo.getTitle() + "-" + vo.getPlaceName() + "-" + vo.getAddress() + "-" + vo.getMobile() + "-" +  vo.getContent() + "-" + vo.getRunTime() + "-" + vo.getDayOff() + "-" +  vo.getPlaceType() + "-" + vo.getStar() + "-" + vo.getContent() + "-" + vo.getSeq());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public HPlaceVO getBoard(int seq) {
		HPlaceVO one = new HPlaceVO();
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, seq);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setSeq(rs.getInt("seq"));
				one.setTitle(rs.getString("title"));
				one.setPlaceName(rs.getString("placeName"));
				one.setAddress(rs.getString("address"));
				one.setMobile(rs.getString("mobile"));
				one.setRunTime(rs.getString("runTime"));
				one.setDayOff(rs.getString("dayOff"));
				one.setPlaceType(rs.getString("placeType"));
				one.setStar(rs.getInt("star"));
				one.setRegdate(rs.getDate("regdate"));
				one.setContent(rs.getString("content"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<HPlaceVO> getBoardList(){
		List<HPlaceVO> list = new ArrayList<HPlaceVO>();
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				HPlaceVO one = new HPlaceVO();
				one.setSeq(rs.getInt("seq"));
				one.setTitle(rs.getString("title"));
				one.setPlaceName(rs.getString("placeName"));
				one.setAddress(rs.getString("address"));
				one.setMobile(rs.getString("mobile"));
				one.setRunTime(rs.getString("runTime"));
				one.setDayOff(rs.getString("dayOff"));
				one.setPlaceType(rs.getString("placeType"));
				one.setStar(rs.getInt("star"));
				one.setRegdate(rs.getDate("regdate"));
				one.setContent(rs.getString("content"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
}
