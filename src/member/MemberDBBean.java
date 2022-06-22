package member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;
public class MemberDBBean {
	private static MemberDBBean instance = new MemberDBBean();
	
	private MemberDBBean() {};
	public static MemberDBBean getInstance() {
		return instance;
	}
	public Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/hotelServiceDB");
		return ds.getConnection();
	}
	public void insert(MemberDataBean member) { 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = getConnection();
			String sql = "insert into member(uId,pwd,uName,phoneNumber,regdate) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getuId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getuName());
			pstmt.setString(4, member.getPhoneNumber());
			pstmt.setTimestamp(5, member.getRegdate());
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("insert Exception : " + e.getMessage());
		}finally {
			try {
				pstmt.close();
			}catch(Exception e1) {
				System.out.println("PrepareStatement Exception : " + e1.getMessage());
			}
			try {
				conn.close();
			}catch(Exception e1) {
				System.out.println("Connection Exception : " + e1.getMessage());
			}
			
		}
	}
	public void update(MemberDataBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "update member set pwd=?, uName=?, phoneNumber=? where uId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPwd());
			pstmt.setString(2, member.getuName());
			pstmt.setString(3, member.getPhoneNumber());
			pstmt.setString(4, member.getuId());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("update Exception : "+ e.getMessage());
		}finally {
			try {
				pstmt.close();
			}catch(Exception e1) {
				System.out.println("PrepareStatement Exception : " + e1.getMessage());
			}
			try {
				conn.close();
			}catch(Exception e1) {
				System.out.println("Connection Exception : " + e1.getMessage());
			}
		}
	}
	public List<MemberDataBean> getMembers(){
		List<MemberDataBean> memList = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = getConnection();
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memList = new ArrayList<MemberDataBean>();
				do {
					MemberDataBean member = new MemberDataBean();
					member.setuId(rs.getString("uId"));
					member.setPwd(rs.getString("pwd"));
					member.setuName(rs.getString("uName"));
					member.setPhoneNumber(rs.getString("phoneNumber"));
					member.setRegdate(rs.getTimestamp("regdate"));
					memList.add(member);
				}while(rs.next());
			}
		}catch(Exception e){
			System.out.println("select Exception : " + e.getMessage());
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch(Exception e1) {
					System.out.println("ResultSet Exception : " + e1.getMessage());
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e1) {
					System.out.println("PrepareStatement Exception : " + e1.getMessage());
				}
			}
			if(conn != null) {
				try {
					conn.close();
				}catch(Exception e1) {
					System.out.println("Connection Exception : " + e1.getMessage());
				}
			}
		}		
		
		return memList;		
	}
	public int loginCheck(String uId, String pwd) {
		int check = 0;
		String chkPwd = "";
		String admin = "admin";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = getConnection();
			String sql = "select pwd from member where uId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chkPwd = rs.getString("pwd");
				if(chkPwd.equals(pwd)) {
					if(chkPwd.equals(admin)) {
						check = 44;
						return check;
					}
					check = 1; //인증성공
				}else{
					check=0; //비밀번호 틀림
				}
			}else {
				check = -1; //아이디 없음
			}
		}catch(Exception e){
			System.out.println("select Exception : " + e.getMessage());
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch(Exception e1) {
					System.out.println("ResultSet Exception : " + e1.getMessage());
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e1) {
					System.out.println("PrepareStatement Exception : " + e1.getMessage());
				}
			}
			if(conn != null) {
				try {
					conn.close();
				}catch(Exception e1) {
					System.out.println("Connection Exception : " + e1.getMessage());
				}
			}
		}		
		
		return check;
	}
	
}














