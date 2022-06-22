<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>    
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%
	Connection conn = null;
	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/hotelServiceDB");
		conn = ds.getConnection();
		out.println("DBCP 성공!");
	}catch(Exception e){
		out.println("DBCP 에러 : " + e.getMessage());
	}
%>