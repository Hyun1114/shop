package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Member;

public class MemberDao {
	// [관리자] 회원목록 출력
	public ArrayList<Member> selectMemberListAllBysearchMemberID(int beginRow, int rowPerPage, String searchMemberId) throws ClassNotFoundException, SQLException {
		ArrayList<Member> list = new ArrayList<Member>();
	
		// MariaDB 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
						
		// 디버깅 코드
		System.out.println("conn : "+conn);
		
		/*		 
		 * SELECT member_no memberNo, 
		 * member_id memberId, 
		 * member_level memberLevel, 
		 * member_name memberName, 
		 * member_age memberAge, 
		 * member_gender memberGender, 
		 * update_date updateDate, 
		 * create_date createDate
		 * FROM member 
		 * WHERE member_id LIKE ?
		 * ORDER BY create_date DESC LIMIT ?,?
		 */
		
		// 쿼리문 작성
		String sql = "SELECT member_no memberNo, member_id memberId, member_level memberLevel, member_name memberName, member_age memberAge, member_gender memberGender, update_date updateDate, create_date createDate "
				+ "FROM member WHERE member_id LIKE ? ORDER BY create_date desc LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+searchMemberId+"%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Member member = new Member();
			member.setMemberNo(rs.getInt("memberNo"));
			member.setMemberId(rs.getString("memberId"));
			member.setMemberLevel(rs.getInt("memberLevel"));
			member.setMemberName(rs.getString("memberName"));
			member.setMemberAge(rs.getInt("memberAge"));
			member.setMemberGender(rs.getString("memberGender"));
			member.setUpdateDate(rs.getString("updateDate"));
			member.setCreateDate(rs.getString("createDate"));
			list.add(member);
		}
		// 연결 끊기
		rs.close();
		stmt.close();
		conn.close();
		return list;
		}
		
	// [관리자] 라스트 페이지
	// ISSUE : 검색을 했을 때 totalCount 다르게 하기 해결
	public int selectLastPage(int rowPerPage, String searchMemberId) throws ClassNotFoundException, SQLException {
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
		String sql = "";
		if(searchMemberId.equals("") == true) {
			sql = "SELECT COUNT(*) from member";
		} else {
			sql = "SELECT COUNT(*) from member WHERE member_id LIKE '%"+searchMemberId+"%'";
		}
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
	
	
	// [관리자] 회원목록 출력
	public ArrayList<Member> selectMemberListAllByPage(int beginRow, int rowPerPage) throws ClassNotFoundException, SQLException {
		ArrayList<Member> list = new ArrayList<Member>();
	
		// MariaDB 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
						
		// 디버깅 코드
		System.out.println("conn : "+conn);
		
		/*		 
		 * SELECT member_no memberNo,
		 * member_id memberId,
		 * member_level memberLevel,
		 * member_name memberName,
		 * member_age memberAge,
		 * member_gender memberGender,
		 * update_date updateDate,
		 * create_date createDate
		 * FROM member
		 * ORDER BY create_date DESC LIMIT ?,?
		 */
		
		// 쿼리문 작성
		String sql = "SELECT member_no memberNo, member_id memberId, member_level memberLevel, member_name memberName, member_age memberAge, member_gender memberGender, update_date updateDate, create_date createDate "
				+ "FROM member ORDER BY create_date desc limit ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		// 디버깅 코드
		System.out.println("stmt : "+stmt);
		System.out.println("rs : "+rs);
		
		while(rs.next()) {
			Member member = new Member();
			member.setMemberNo(rs.getInt("memberNo"));
			member.setMemberId(rs.getString("memberId"));
			member.setMemberLevel(rs.getInt("memberLevel"));
			member.setMemberName(rs.getString("memberName"));
			member.setMemberAge(rs.getInt("memberAge"));
			member.setMemberGender(rs.getString("memberGender"));
			member.setUpdateDate(rs.getString("updateDate"));
			member.setCreateDate(rs.getString("createDate"));
			list.add(member);
		}
		
		// 연결 끊기
		rs.close();
		stmt.close();
		conn.close();
		return list;
		}
	
	// [비회원] 회원가입
	public void insertMember(Member member) throws ClassNotFoundException, SQLException {
		/*
		 * INSERT INTO member (
		 * member_id,
		 * member_pw, // 암호화
		 * member_level,
		 * member_name,
		 * member_age,
		 * member_gender,
		 * update_date,
		 * create_date)
		 * VALUES (
		 * ?, PASSWORD(?), 0, ?, ?, NOW(), NOW()
		 * )
		 */
		// 디버깅 코드
		System.out.println(member.getMemberId()+ " <--- memberId");
		System.out.println(member.getMemberPw()+ " <--- memberPw");
		System.out.println(member.getMemberName()+ " <---memberName");
		System.out.println(member.getMemberAge()+ " <--- memberAge");
		System.out.println(member.getMemberGender()+ " <--- memberGender");
		
		// MariaDB 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
				
		// 디버깅 코드
		System.out.println("conn : "+conn);
		
		// 쿼리문 작성
		String sql = "INSERT INTO member(member_id, member_pw, member_level, member_name, member_age, member_gender, update_date, create_date) VALUES(?, PASSWORD(?), 0, ?, ?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		stmt.setInt(4, member.getMemberAge());
		stmt.setString(5, member.getMemberGender());
		stmt.executeUpdate();
		
		// 디버깅 코드	
		System.out.println("stmt : "+stmt);
		
		// 연결 끊기
		stmt.close();
		conn.close();
	}
	// [회원]
	public Member login(Member member) throws ClassNotFoundException, SQLException {
		/*
		 * SELECT
		 * member_no memberNo,
		 * member_id memberId,
		 * member_level memberLevel
		 * FROM
		 * member
		 * WHERE member_id=? AND member_pw=PASSWORD(?)
		 */
		
		// 디버깅 코드
		System.out.println(member.getMemberId()+" <-- MemberDao.login param : memberId");
		System.out.println(member.getMemberPw()+" <-- MemberDao.login param : memberPw");
		
		// MariaDB 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		// 쿼리문 작성
		String sql = "SELECT member_no memberNo, member_id memberId, member_level memberLevel, member_name memberName FROM member WHERE member_id=? AND member_pw=PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		
		// 디버깅 코드
		System.out.println("stmt : "+stmt);
		System.out.println("rs : "+rs);
		
		if(rs.next()) {
			Member returnMember = new Member();
			returnMember.setMemberId(rs.getString("memberId"));
			returnMember.setMemberLevel(rs.getInt("memberLevel"));
			returnMember.setMemberName(rs.getString("memberName"));
			return returnMember;
		}
		// 연결 끊기
		rs.close();
		stmt.close();
		conn.close();
		return null;
	}
	
}
