<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>    
<%@ page import = "member.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%
	request.setCharacterEncoding("utf8");
	String uId = request.getParameter("uId");
	String pwd = request.getParameter("pwd");
	String uName = request.getParameter("uName");
	String phoneNumber = request.getParameter("phoneNumber");
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/hotelServiceDB");

%>
<%
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = null;
	
	try
	{
		
		String sql = "update member set pwd=?,uName=?,phoneNumber=? where uId=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.setString(2, uName);
		pstmt.setString(3, phoneNumber);
		pstmt.setString(4, uId);
		pstmt.executeUpdate();
		response.sendRedirect("memList.jsp");
	} 
	catch(Exception e)
	{
		System.out.println("Exception : " + e.getMessage());	
	}
%>
