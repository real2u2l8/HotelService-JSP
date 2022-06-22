<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "board.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Timestamp regdate = new Timestamp(System.currentTimeMillis());
	
%>
<jsp:useBean id="article" class="board.BoardDataBean">
	<jsp:setProperty property="*" name="article"/>
	<jsp:setProperty property="reg_date" name="article" value="<%=regdate %>"/>
</jsp:useBean>

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	BoardDBBean dbBean = BoardDBBean.getInstance();
	dbBean.insertArticle(article);
	response.sendRedirect("qnaForm.jsp");
%>