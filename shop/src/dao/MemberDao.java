package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import commons.DBUtil;
import vo.Member;

public class MemberDao {
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
