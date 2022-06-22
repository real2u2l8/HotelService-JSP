<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.*" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("passwd");
	
	BoardDBBean dbBean = BoardDBBean.getInstance();
	int check = dbBean.deleteArticle(num ,pwd);
	
	if(check == 1){
		response.sendRedirect("qnaForm.jsp");
	}else{
%>
	<script>
		alert("비밀번호를 다시 넣어주세요!");
		history.back();
	</script>

<%
	}
%>