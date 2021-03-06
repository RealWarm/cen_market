<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" 	prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" 	prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>나라중고장터</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/jpg" href="/resources/img/shopping.png">
    
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/resources/css/join.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/common2.css">  
    <!-- Bootstrap core CSS -->
	<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
  	<!-- Bootstrap core JavaScript -->
  	<script src="/resources/vendor/jquery/jquery.min.js"></script>
  	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<!-- <script src="/resources/js/join.js"></script> -->
  	 
</head>
<body>	
    <jsp:include page="navbar.jsp" flush="false"/>
	   <div class="main-join-wrap">
	    <form class="join-form" action="/info/mypage/modify" method="POST">
	      <div class="join-title-main">
	        <h2 class="join-title">회원정보수정</h2>
	      </div>
	      <!-- 입력양식 -->
	      <div class="join-insert-wrap">
	        <table class="join-table">
	          <colgroup>
	            <col style="width:20%">
	          </colgroup>
	          <tbody>
	            <tr>
	              <th scope="row">
	                <label for="id">*아이디</label>
	              </th>
	              <td>
	                ${login.id}
	              </td>
	            </tr>
	            <tr>
	              <th scope="row"><label for="password">*비밀번호</label></th>
	              <td>
	                <input type="password" title="비밀번호" id="password" name="password">
	                <span class="error-message" id="pwMessage" role="alert" style="display:none"></span>
	              </td>
	            </tr>
	            <tr>
	              <th scope="row"><label for="passwordCheck">*비밀번호 확인</label></th>
	              <td>
	                <input type="password" title="비밀번호 확인" id="passwordCheck" name="user-check-pw">
	                <span class="error-message" id="pwCheckMessage" role="alert" style="display:none"></span>
	              </td>
	            </tr>
	            <tr>
	              <th><label for="name">*이름</label></th>
	              <td>
	                ${login.name}
	              </td>
	            </tr>
	            <!-- 닉네임 -->
	            <tr>
	              <th><label for="nickname">*닉네임</label></th>
	              <td>
	                <input type="text" title="닉네임" id="nickname" name="nickname" value=${login.nickname}>
	                <span class="error-message" id="nicknameMessage" role="alert" style="display:none"></span>
	              </td>
	            </tr>
	            <!-- 기관명 -->
	            <tr>
	              <th><label for="org_name">*기관명</label></th>
	              <td>
	                <input type="text" title="기관명" id="org_name" name="org_name" value="${login.org_name}">
	                <span class="error-message" id="org_nameMessage" role="alert" style="display:none"></span>
	              </td>
	            </tr>
	            <!-- 핸드폰 번호 -->
	            <tr>
	              <th><label for="phnum">*휴대폰</label></th>
	              <td>
	                <input type="text" title="닉네임" id="phnum" name="phnum" value="${login.phnum}">
	                <span class="error-message" id="phnumMessage" role="alert" style="display:none"></span>
	              </td>
	            </tr>
	            <!-- 이메일 -->
	            <tr>
	              <th scope="row"><label for="email">*이메일</label></th>
	              <td>
	                <input type="email" id="email" name="email" value="${login.email}">
	                <span class="error-message" id="emailMessage" role="alert" style="display:none"></span>
	              </td>
	            </tr>
	          </tbody>
	        </table>
	      </div> <!-- 입력양식 -->
	      <div class="join-button-wrap">
	        <button type="submit" class="join-button join-submit">정보수정</button>
	        <input type="reset" value="취소" class="join-button">
	        <a href="#" class="join-button member-delete-btn">회원탈퇴</a>
	      </div>
	    </form>
	  </div>
    <jsp:include page="footer.jsp" flush="false"/>
</body>
<script>
  $(document).ready(function () {

    var idReg = /^[a-zA-Z0-9]{6,10}$/;
    var pwReg = /^[a-zA-Z0-9]{6,10}$/;
    var nameReg = /^[가-힣]+$/;
    var orgReg = /^[가-힣\s]+$/; //한글+공백   
    var nicknameReg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
    var emailReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    var phnumReg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

    $('.join-submit').on('click', function (event) {
      
      // 비밀번호
      if (!pwReg.test($("#password").val())) {
        alert("비밀번호를 입력해주세요!!");
        $("#password").focus();
        return false;
      }
      // 비밀번호 확인
      if ($("#password").val() !== $("#passwordCheck").val()) {
        alert("비밀번호 확인을 다시 입력해주세요!!!");
        $("#passwordCheck").focus();
        return false;
      }
      
      // 기관명
      if ($("#org_name").val() == "") {
        alert("기관명을 입력해주세요!!");
        $("#org_name").focus();
        return false;
      }

      // 휴대폰 번호
      if (!phnumReg.test($("#phnum").val())) {
        alert("휴대폰 번호를 형식에 맞게 입력해주세요!!");
        $("#phnum").focus();
        return false;
      }

      //이메일
      if (!emailReg.test($("#email").val())) {
        alert("이메일을 형식에 맞게 입력해주세요!!");
        $("#email").focus()
        return false;
      }

    }); //submit

    //======================================================================================================================//
        

    $("#org_name").on("blur", function (event) {
      if ($("#org_name").val() === "") {
        $("#org_nameMessage").show();
        $("#org_nameMessage").text("기관명을 입력해주세요.");
        return false;
      } else if (!orgReg.test($("#org_name").val())) {
        $("#org_nameMessage").show();
        $("#org_nameMessage").text("빈칸을 포함한 한글을 입력해주세요.");
        return false;
      } else {
        $("#org_nameMessage").hide();
        return false;
      }
    });

    $('#password').on('blur', function (event) {
      if ($('#password').val() === "") {
        $("#pwMessage").show();
        $("#pwMessage").text("비밀번호를 입력해주세요.");
        return false;
      } else if (!pwReg.test($("#password").val())) {
        $("#pwMessage").show();
        $("#pwMessage").text("비밀번호는 숫자 문자 포함 6~10자로 입력해주세요.");
        return false;
      } else {
        $("#pwMessage").hide();
        return false;
      }
    });

    $('#passwordCheck').on('blur', function (event) {
      if ($('#passwordCheck').val() == "") {
        $("#pwCheckMessage").show();
        $("#pwCheckMessage").text("비밀번호 확인을 입력해주세요.");
        return false;
      } else if ($("#password").val() !== $("#passwordCheck").val()) {
        $("#passwordCheck").val("");
        $("#pwCheckMessage").show();
        $("#pwCheckMessage").text("비밀번호랑 비밀번호 확인이 다릅니다.");
        return false;
      } else {
        $("#pwCheckMessage").hide();
        return false;
      }
    });
   

    $('#phnum').on('blur', function (event) {
      if ($('#phnum').val() == "") {
        $("#phnumMessage").show();
        $("#phnumMessage").text("휴대폰 번호를 입력해주세요.");
        return false;
      } else if (!phnumReg.test($("#phnum").val())) {
        $("#phnumMessage").show();
        $("#phnumMessage").text("휴대폰 번호 형식에 맞지 않습니다.");
        return false;
      } else {
        $("#phnumMessage").hide();
        return false;
      }
    });


  });
</script>


</html>