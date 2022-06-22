<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "board.*" %>
<%@ page import = "java.util.*"%>
<%
	int ref=1;
	int re_step = 0;
	int re_level = 0;

	BoardDBBean dbBean = BoardDBBean.getInstance();
	List<BoardDataBean> articles = dbBean.getArticles(0, 10);
	
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script type="text/javascript" src="script.js"></script>
</head>
  <title>Q&A</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="main.jsp">더 힐-호텔</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="reservationForm.jsp">호텔 룸 소개</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="placesForm.jsp">부대시설</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="qnaForm.jsp">Q&A</a>
          </li>
<% 
		if(session.getAttribute("sessionId") == null) {%>
	          <li class="nav-item">
	            <a class="nav-link" href="loginForm.jsp">LOGIN</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="memRegForm.jsp">JOIN</a>
	          </li>
      <%} else{%>
      		<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <%=session.getAttribute("sessionId") %>님 어서오세요.
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="logoutPro.jsp">LOGOUT</a>
            </div>
          </li>
      
      <%} %>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Q&A
      <small>무엇이든지 물어보세요!</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="main.jsp">Home</a>
      </li>
      <li class="breadcrumb-item active">Q&A</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Map Column -->
      <div class="col-lg-8 mb-4">
      <div class="table">
			<table style="text-align: center; border: 1px">
			<thead>
				<tr>
					<th width=80>번호</th>
					<th width=250>제목</th>
					<th width=100>작성자</th>
					<th width=150>작성일</th>
					<th width=80>조회</th>
					<th width=100>IP</th>
				</tr>
			</thead>	
			<% 
				if(articles != null){
					for(int i=0; i<articles.size(); i++){
						BoardDataBean article = articles.get(i);
					
			%>
				<tr>
					<td><%=article.getNum() %></td>
					<td><a href ="content.jsp?num=<%=article.getNum() %>"><%=article.getSubject() %></td>
					<td><%=article.getWriter() %></td>
					<td><%=article.getReg_date() %></td>
					<td><%=article.getReadcount() %></td>
					<td><%=article.getIp() %></td>
				</tr>
			<%
					}
				}
			%>
			</table>
		</div>
		</div>
      <div class="col-lg-4 mb-4">
        <h3>Q&A 공지</h3>
        <p>
          	양식에 따라 작성 해주시면 기재하신
          	<br>이메일에 답변 드립니다!
          <br>(개발자의 지식 한계..)
          <br>
        </p>
        <p>
          <abbr title="Ps">PS1</abbr>: '솔직히 게으름 피우긴 했음'
        </p>
        <p>
          <abbr title="Ps">PS2</abbr>: '모듈 구현하기 넘나 어려워따....'
        </p>
        <p>
          <abbr title="Ps">PS3</abbr>: '혼내주시면, 달게 받고 열심히 하께요...'
        </p>
      </div>
    </div>
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <h3>Send us a Message</h3>
-
        <form name="writeform" action="writePro.jsp" onsubmit="return writeSave()">
	<input type=hidden name=ref value=<%=ref %>>
	<input type=hidden name=re_step value=<%=re_step %>>
	<input type=hidden name=re_level value=<%=re_level %>>
          <div class="control-group form-group">
            <div class="controls">
              <label>이름</label>
              <input type="text" class="form-control" id="name" name="writer" required data-validation-required-message="이름을 쓰세요.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>제목:</label>
              <input type="text" name="subject"class="form-control" id="subject" required data-validation-required-message="제목을 적으세요">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>이메일:</label>
              <input type="text" name="email" class="form-control" id="email" required data-validation-required-message="이메일을 적으세요.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>내용:</label>
              <textarea name="content" rows="10" cols="100" class="form-control" id="content" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
            </div>
          </div>
         <div class="control-group form-group">
            <div class="controls">
              <label>비밀번호:</label>
              <input type="text" name="passwd" class="form-control" id="passwd" required data-validation-required-message="비밀번호를 입력하세요.">
            </div>
          </div>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Send Message</button>
	</form>
      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Contact form JavaScript -->
  <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>

</body>

</html>
