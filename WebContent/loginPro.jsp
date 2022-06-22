<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="member.*" %>

<%
	String uId = request.getParameter("uId");
	String pwd = request.getParameter("pwd");
	
	MemberDBBean dbBean = MemberDBBean.getInstance();
	int check = dbBean.loginCheck(uId, pwd);
	if(check == 1){ //로그인 성공
		session.setAttribute("sessionId", uId);
	
		response.sendRedirect("main.jsp");
	}else if(check == 0){ //비밀번호 틀림
%>
		<script>
			alert("비밀번호가 틀렸습니다.");
			history.back();
		</script>
<%
	}else if(check == 44){ //어드민 접속
		session.setAttribute("sessionId", uId);
		response.sendRedirect("adminPage.jsp");
	}
	
	else { //아이디 없음
%>
		<script>
			alert("아이디를 찾을 수 없습니다.");
			histroy.back();
		</script>		
<%
	}

%>