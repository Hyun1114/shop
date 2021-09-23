package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Ebook;

public class EbookDao {
	
	// [관리자] 전자책 라스트 페이지
	public int selectLastPage(int rowPerPage) throws ClassNotFoundException, SQLException {
		int lastPage = 0;
		int totalRowCount = 0;
		
		// MariaDB 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
								
		// 디버깅 코드
		System.out.println("conn : "+conn);
		
		// 쿼리문 작성
		// 검색한 아이디가 없으면 전체 데이터 수를 출력
		// 검색한 아이디가 있으면 그 검색한 데이터의 수를 출력
		String sql = "SELECT COUNT(*) from ebook";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		// 디버깅 코드
		System.out.println("stmt : "+stmt);
		System.out.println("rs : "+rs);
		
		// 토탈 페이지 구하는 코드
		if(rs.next()) {
			totalRowCount = rs.getInt("COUNT(*)");
		}
		lastPage = totalRowCount / rowPerPage;
		if(totalRowCount % rowPerPage != 0) {
			lastPage++;
		}
		
		// 연결 끊기
		rs.close();
		stmt.close();
		conn.close();
		return lastPage;
	}
	
	// [관리자] 전차책 리스트
	public ArrayList<Ebook> selectEbookList(int beginRow, int rowPerPage) throws SQLException, ClassNotFoundException {
		
		// ArrayList 생성
		ArrayList<Ebook> list = new ArrayList<>();
		
		// MariaDB 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		// 디버깅 코드
		System.out.println("conn : "+conn);
		
		/*
		 SELECT 
		 ebook_no ebookNo,
		 category_name categoryName,
		 ebook_title ebookTitle,
		 ebook_state eoobkState
		 FROM ebook
		 ORDER BY create_date DESC 
		 LIMIT ?,?
		*/
		
		// 쿼리문 작성
		String sql = "SELECT ebook_no ebookNo, category_name categoryName, ebook_title ebookTitle, ebook_state ebookState FROM ebook ORDER BY create_date DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		// 디버깅 코드	
		System.out.println("stmt : "+stmt);
		
		// 카테고리 값 가져오기
		while(rs.next()) {
		Ebook ebook = new Ebook();
		ebook.setEbookNo(rs.getInt("ebookNo"));
		ebook.setCategoryName(rs.getString("categoryName"));
		ebook.setEbookTitle(rs.getString("ebookTitle"));
		ebook.setEbookState(rs.getString("ebookState"));
		list.add(ebook);
		}
		
		// 연결 끊기
		rs.close();
		stmt.close();
		conn.close();
		return list;
	}
	
	// [관리자] 카테고리 별 전차책 리스트 생성
	public ArrayList<Ebook> selectEbookListByCategory(int beginRow, int rowPerPage, String categoryName) throws ClassNotFoundException, SQLException {
		// ArrayList 생성
		ArrayList<Ebook> list = new ArrayList<>();
		
		// MariaDB 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		// 디버깅 코드
		System.out.println("conn : "+conn);
		
		/*
		 SELECT 
		 ebook_no ebookNo,
		 category_name categoryName,
		 ebook_title ebookTitle,
		 ebook_state eoobkState
		 FROM ebook
		 WHERE category_name=?
		 ORDER BY create_date DESC 
		 LIMIT ?,?
		*/
		// 쿼리문 작성
		String sql = "SELECT ebook_no ebookNo, category_name categoryName, ebook_title ebookTitle, ebook_state ebookState FROM ebook WHERE category_name=? ORDER BY create_date DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryName);
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		// 디버깅 코드	
		System.out.println("stmt : "+stmt);
		
		// 카테고리 값 가져오기
		while(rs.next()) {
		Ebook ebook = new Ebook();
		ebook.setEbookNo(rs.getInt("ebookNo"));
		ebook.setCategoryName(rs.getString("categoryName"));
		ebook.setEbookTitle(rs.getString("ebookTitle"));
		ebook.setEbookState(rs.getString("ebookState"));
		list.add(ebook);
		}
		
		// 연결 끊기
		rs.close();
		stmt.close();
		conn.close();
		return list;	
		
	}
}
