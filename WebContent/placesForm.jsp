<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>더 힐-호텔 부대시설입니다.</title>

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
    <h1 class="mt-4 mb-3">부대시설
      <small>행복한 여행을 위한 많은 것들</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="main.jsp">home</a>
      </li>
      <li class="breadcrumb-item active">부대시설</li>
    </ol>

    <div class="row">
      <div class="col-lg-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="image/swimmingpool.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              	수영장
            </h4>
            <p class="card-text">
            	원래 그런거래요. 호텔 가면 수영장 있는지 없는지 알아야한다고,
            </p>
          </div>
        </div>
      </div>
      <div class="col-lg-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="image/yosemitiaround.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              	호서-국립공원
            </h4>
            <p class="card-text">
            	사실 저희 '호호' 옆에 국립공원이 있어요. 줄여서 '호구-욱'입니다.
            </p>
          </div>+
        </div>
      </div>
      <div class="col-lg-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="image/yosemitibf.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              	조식 서비스
            </h4>
            <p class="card-text">
            	맛있는 조식이 준비 되어있습니다. 호서 호텔조리과 학생 들이 직접 요리 하죠 조식 서비스 이름은 '호-요!'입니다.
            </p>
          </div>
        </div>
      </div>
      <div class="col-lg-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="image/yosemitibar.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              	칵테일-바
            </h4>
            <p class="card-text">
            	식사 후엔 달콤한 칵테일이죠. 호서 호텔식음료서비스과 학생들이 직접 제조 합니다. 이름은 '호칵!'입니다.
            </p>
          </div>
        </div>
      </div>
     
    <!-- /.row -->

    
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
