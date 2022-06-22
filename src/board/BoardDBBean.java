package board;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;


public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	
	private BoardDBBean() {};
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/hotelServiceDB");
		
		return ds.getConnection();
	}
	
	public void insertArticle(BoardDataBean article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "insert into board(writer, email, subject, passwd, reg_date, ref,"
					+ "re_step, re_level, content, ip) values (?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, article.getRef());
			pstmt.setInt(7, article.getRe_step());
			pstmt.setInt(8, article.getRe_level());
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("insert Exception : "+ e.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					System.out.println("PreparedStatement Release Exception : " + e.getMessage());
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					System.out.println("Connection Release Exception : " + e.getMessage());
				}
			}
		}
	}
	
	public List<BoardDataBean> getArticles(int start, int end){
		List<BoardDataBean> articles = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql ="select * from board limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs != null) {
				articles = new ArrayList<BoardDataBean>();
				while(rs.next()) {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					articles.add(article);
				}
			}
		}catch(Exception e) {
			System.out.println("Select Exception : "+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					System.out.println("PreparedStatement Release Exception : " + e.getMessage());
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					System.out.println("PreparedStatement Release Exception : " + e.getMessage());
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					System.out.println("Connection Release Exception : " + e.getMessage());
				}
			}
		}	
		return articles;
	}
	
	public BoardDataBean getArticle(int num) {
		BoardDataBean article = null;
		
		List<BoardDataBean> articles = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql ="select * from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					
			}
		}catch(Exception e) {
			System.out.println("Select Exception : "+ e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					System.out.println("PreparedStatement Release Exception : " + e.getMessage());
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					System.out.println("PreparedStatement Release Exception : " + e.getMessage());
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					System.out.println("Connection Release Exception : " + e.getMessage());
				}
			}
		}
		
		
		return article;
	}

	public int deleteArticle(int num, String passwd) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "delete from board where num=? and passwd=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, passwd);
			check = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("delete Exception : "+ e.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					System.out.println("PreparedStatement Release Exception : " + e.getMessage());
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					System.out.println("Connection Release Exception : " + e.getMessage());
				}
			}
		}
		
		return check;
	}
}
