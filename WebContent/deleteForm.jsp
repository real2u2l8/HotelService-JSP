<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.*" %>
<script>
	function check(){
		if(!document.frm.passwd.value){
			alert("비밀번호를 입력하세요!");
			document.frm.passwd.focus();
			return false;
		}
		return true;
		
	}
</script>
<body>
<form name=frm action="deletePro.jsp" onSubmit="return check()">
<p>글삭제 </p>
<table>
	<input type=hidden name=num value=<%=request.getParameter("num") %>>
	<tr>
		<th heigth=30 align=center>비밀번호를 입력해 주세요</th>
	</tr>
	<tr>
		<td heigth=30 align=center>
			비밀번호 : <input type=password name=passwd>
		</td>
	</tr>
	<tr>
		<td heigth=30 align=center>
			<input type=submit value=글삭제>
			<input type=button value=글목록 onClick="location.href='qnaForm.jsp'">
		</td>
	</tr>
	
</table>
</body>
</form>