package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import commons.DBUtil;
import vo.OrderComment;

public class OrderCommentDao {
	
	// [회원] 내가 주문한 상품 평가 페이지
	public void insertOrderComment(OrderComment ordercomment) throws ClassNotFoundException, SQLException {

		// MariaDB 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
				
		// 디버깅 코드
		System.out.println("conn : "+conn);
		
		// 쿼리문 작성
		String sql = "INSERT INTO order_comment(order_no, ebook_no, order_score, order_comment_content, create_date, update_date) VALUES(?, ?, ?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ordercomment.getOrderNo());
		stmt.setInt(2, ordercomment.getEbookNo());
		stmt.setInt(3, ordercomment.getOrderScore());
		stmt.setString(4, ordercomment.getOrderCommentContent());
		stmt.executeUpdate();
		
		// 디버깅 코드	
		System.out.println("stmt : "+stmt);
		
		// 연결 끊기
		stmt.close();
		conn.close();
	}
}
