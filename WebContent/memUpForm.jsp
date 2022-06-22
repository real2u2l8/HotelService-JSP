<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<h1>회원정보수정</h1>
<%
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/hotelServiceDB");
	
	request.setCharacterEncoding("utf8");
	String uId = request.getParameter("uId");
	
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try 
	{
		String sql = "select * from member where uId=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uId);
		rs = pstmt.executeQuery();
		if(rs.next())
		{
%>
<form action="memUpProc.jsp">
	<table border=1 width=300>
		<tr>
			<th>아이디</th>
			<td><input type=text name=uId readonly value=<%=rs.getString("uId") %>></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type=text name=uName value=<%=rs.getString("uName")%>></td>
		</tr>
		<tr>
			<th>비번</th>
			<td><input type=password name=pwd value=<%=rs.getString("pwd") %>></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type=text name=phoneNumber value=<%=rs.getString("phoneNumber") %>></td>
		</tr>
		<tr>
			<th colspan=2>
				<input type=submit value="수정">
				<input type=reset value="다시작성">
			</th>
		</tr>
	</table>
</form>
<%
		}
	}
	catch(Exception e)
	{
		System.out.println("select Exception : " + e.getMessage());
	}
	finally
	{
		if(pstmt != null)
		{
			try
			{
				pstmt.close();
			}
			catch(Exception ee)
			{
				System.out.println("connection release exception : " + ee.getMessage());
			}
		}
	}
%>