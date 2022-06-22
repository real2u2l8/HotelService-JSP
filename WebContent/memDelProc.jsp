<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String uId = request.getParameter("uId");
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/hotelServiceDB");

	Connection conn = ds.getConnection();
	PreparedStatement pstmt = null;
	
	try{
		
		String sql = "delete from member where uId=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uId);
		pstmt.executeUpdate();
		response.sendRedirect("memList.jsp");
		
	}catch(Exception e){
		out.println("Exception : " + e.getMessage());
	}
%>