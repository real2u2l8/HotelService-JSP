<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<%@ page import = "member.*" %>
<%@ page import = "java.util.*" %>
<%
	MemberDBBean dbBean = MemberDBBean.getInstance();
	List<MemberDataBean> memList = dbBean.getMembers(); 
%>    
<h1>회원 리스트</h1>
<a href= "adminPage.jsp">관리자페이지로..</a>
<table border=1>
	<tr>
		<th>아이디</th>
		<th>비번</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>기능</th>
	</tr>
	
<% 
	if(memList!=null){
		for(int i=0; i<memList.size(); i++){
			MemberDataBean member = memList.get(i);
%>	
	<tr>
		<td><%=member.getuId() %></td>
		<td><%=member.getPwd() %></td>
		<td><%=member.getuName() %></td>
		<td><%=member.getPhoneNumber()%></td>
		<td>
			<input type=button value=수정 onClick="location.href='memUpForm.jsp?uId=<%=member.getuId() %>'">
			<input type=button value=삭제 onClick="location.href='memDelProc.jsp?uId=<%=member.getuId() %>'">
		</td>
	</tr>
<% 
		}
	}

%>	
	
</table>







