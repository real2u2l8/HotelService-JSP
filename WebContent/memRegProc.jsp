<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>    
<%@ page import = "member.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Timestamp regdate1 = new Timestamp(System.currentTimeMillis());
%>
<jsp:useBean id="member" class="member.MemberDataBean">
	<jsp:setProperty name="member" property="*" />
	<jsp:setProperty name="member" property="regdate" value="<%=regdate1 %>" />
</jsp:useBean>
<%	
	MemberDBBean dbBean = MemberDBBean.getInstance();
	dbBean.insert(member);

	response.sendRedirect("loginForm.jsp");
%>    






