<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>더 호서-호텔 입니다.</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="main.jsp">더 호서-호텔</a>
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
<%
          }
%>
        </li>
        </ul>
      </div>
    </div>
  </nav>

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('image/yosemiti.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>더 호서-호텔 전경</h3>
            <p>세계적 건축가 '나 잘만들어'선생님의 작품 더 힐-호텔 입니다.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('image/yosemiti2.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>낮중 더 호서-호텔 전경</h3>
            <p>아름 답지 않으신가요? 저희 호텔은 산넘어 산을 넘어야 도착 할 수 있답니다.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('image/yosemiti3.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>벌써부터 기대되는 호텔 바로 더 호서-호텔</h3>
            <p>오시기 전날은 행복해서 잠이 안 오실거에요 그게 더 호서-호텔에 매력입니다.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <h1 class="my-4">더 호서-호텔입니다. 줄여서 '호호'이죠.</h1>

    <!-- Marketing Icons Section -->
    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">부대시설</h4>
          <div class="card-body">
            <p class="card-text">저희는 아주 많은 부대시설이 준비되어 있습니다. '더보기'를 눌러주세요.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">더보기</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">호텔 룸 소개</h4>
          <div class="card-body">
            <p class="card-text">
            	'더보기'를 누르시게 되면 호텔의 모든 룸을 살피실 수 있습니다. 호호를 말이죠.
            </p>
          </div>
          <div class="card-footer">
            <a href="reservationForm.jsp" class="btn btn-primary">더보기</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Q&A</h4>
          <div class="card-body">
            <p class="card-text">
            	전화를 요즘 누가해요? 게시판에 글만 적으면, 바로 이메일로 답장이 간다니께요!
            </p>
          </div>
          <div class="card-footer">
            <a href="qnaForm.jsp" class="btn btn-primary">더보기</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Portfolio Section -->
    
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
