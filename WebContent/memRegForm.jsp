<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>회원가입</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">회원가입</div>
      <div class="card-body">
        <form action="memRegProc.jsp">
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" name="uId" id="ID" class="form-control" placeholder="ID" required="required">
              <label for="ID">아이디</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" name="uName" id="name" class="form-control" placeholder="name" required="required">
              <label for="name">이름</label>
            </div>
          </div>
          <div class="form-group">
			<div class="form-label-group">
			  <input type="password" name="pwd" id="inputPassword" class="form-control" placeholder="Password" required="required">
              <label for="inputPassword">비밀번호</label>
            </div>
          </div>
          <div class="form-group">
			<div class="form-label-group">
			  <input type="text" name="phoneNumber" id="num" class="form-control" placeholder="phoneNumber" required="required">
              <label for="num">전화번호</label>
            </div>
          </div>
          <a class="btn btn-primary btn-block">
          		<input type="submit" value="등록" style="background-color:transparent;  border:0px transparent solid;">
          </a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="loginForm.jsp">로그인페이지</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
