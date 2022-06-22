<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>호텔 룸 소개 페이지 입니다.</title>

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
    <h1 class="mt-4 mb-3">호텔 룸 소개
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="main.jsp">Home</a>
      </li>
      <li class="breadcrumb-item active">호텔 룸 소개</li>
    </ol>

    <!-- Project One -->
    <div class="row">
      <div class="col-md-7">
          <img class="img-fluid rounded mb-3 mb-md-0" src="image/1.jpg" alt="">
      </div>
      <div class="col-md-5">
        <h3>스탠다드룸</h3>
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Project Two -->
    <div class="row">
      <div class="col-md-7">
          <img class="img-fluid rounded mb-3 mb-md-0" src="image/2.jpg" alt="">
      </div>
      <div class="col-md-5">
        <h3>디럭스 룸</h3>
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Project Three -->
    <div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="image/3.jpg" alt="">
        </a>
      </div>
      <div class="col-md-5">
        <h3>스위트룸</h3>
      </div>
    </div>
    <!-- /.row -->

    <hr>
    <hr>

    <!-- Pagination -->
   
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

</body>

</html>
