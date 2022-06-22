<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "board.*" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDBBean dbBean = BoardDBBean.getInstance();
	BoardDataBean article = dbBean.getArticle(num);
	if (article != null){
		
%>
<body>
<table>
	<tr>
		<th width=125>글번호</th>
		<td width=125><%=article.getNum() %></td>
		<th width=125>조회수</th>
		<td width=125><%=article.getReadcount()%></td>
	</tr>
	<tr>
		<th >작성자</th>
		<td><%=article.getWriter() %></td>
		<th >작성일</th>
		<td><%=article.getReg_date() %></td>
	</tr>
	<tr>
		<th >글제목</th>
		<td colspan=3><%=article.getSubject() %></td>
	</tr>
	<tr>
		<th >글내용</th>
		<td colspan=3><%=article.getContent() %></td>
	</tr>
	<tr>
		<th colspan =4>
			<input type=button value=글삭제 onClick="location.href='deleteForm.jsp?num=<%=article.getNum() %>'">
			<input type=button value=글목록 onClick="location.href='qnaForm.jsp'">
		
		</th>
			
	</tr>
</table>
</body>
<%
	}
%>