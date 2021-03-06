<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<% request.setCharacterEncoding("UTF-8"); %>
 <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>나라중고장터</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/jpg" href="/resources/img/shopping.png">
    
    <!-- Bootstrap core CSS -->
	<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<!-- Bootstrap core JavaScript -->
  	<script src="/resources/vendor/jquery/jquery.min.js"></script>
  	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
       	
  	<!-- Custom styles for this template -->    
	<link rel="stylesheet" href="/resources/css/mypage.css">
	<link rel="stylesheet" href="/resources/css/common2.css">
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/join.css">
</head>
<body>
	<jsp:include page="navbar.jsp" flush="false"/>

		<div class="layout-content mypage-wrap">
		<div class="member-info-wrap">
			<div class="join-title-main">
				<h3 class="join-title">마이페이지</h3>
			</div>
			<div class="join-insert-wrap mypage-content">
				<h4 class="mypage-subtitle">회원정보</h4>
				<table class="member-info">
					<caption class="blind">회원정보내역</caption>
					<colgroup>
						<col style="width: 20%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">이름</th>
							<td>${login.name}</td>
							<th scope="row">닉네임</th>
							<td>${login.nickname}</td>
						</tr>
						<tr>
							<th scope="row">소속기관</th>
							<td>${login.org_name}</td>
							<th scope="row">최근거래지역</th>
							<td>${login.recent_address}</td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td>${login.phnum}</td>
							<th scope="row">이메일</th>
							<td>${login.email}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<a href="/info/mypage/update" class="member-modify-btn">회원정보수정</a>
			<a href="/info/withdrawal" class="member-modify-btn">회원탈퇴</a>
		</div>
		<div class="ticket-history-wrap">			

			<ul class="tab">
				<li class="current" data-tab="tab1"><a href="javascript:void(0);">판매중</a></li>
				<li data-tab="tab2"><a href="javascript:void(0);">판매완료</a></li>
				<li data-tab="tab3"><a href="javascript:void(0);">찜한내역</a></li>
			</ul>

			<!-- 판매중 -->
			<div id="tab1" class="tabcontent current">
				<table class="ticket-history">					
					<colgroup>
						<col style="width: 15%">
						<col style="width: 18%">
						<col style="width: 10%">
						<col style="width: 18%">
						<col style="width: 18%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<thead>
						<tr>
							<th>게시글번호</th>
							<th>제 목</th>							
							<th>가 격</th>
							<th>진행변경</th>
							<th>수정하기</th>
							<th>삭제하기</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list1}" var="list1" varStatus="status">
							<tr>
                                <td class="reservation-num">${list1.sb_num}</td>
                                <td><a href="/sale/detail?num=${list1.sb_num}" class="a__pic">${list1.sb_name}</a></td>             
                                <td>${list1.total_price}</td>
                                <td>
									<div>현재 : ${list1.trade_progress}</div>
									<br>
                                    <form role="form" action="/info/mypage/progress" method="POST">
										<input type="hidden" name="sb_num" value="${list1.sb_num}">
                                        <select name="trade_progress" id="pro">
                                            <option value="판매중">판 매 중</option>
                                            <option value="예약중">예 약 중</option>
                                            <option value="판매완료">판매완료</option>
                                        </select>
                                        <br><br>
                                        <button type="submit" class="mypage-btn">수 정 하 기</button>
                                    </form>
                                </td>
								<form role="form1"><!-- 웬지 찜찜하다 -->									
									<input type="hidden" name="sb_num" value="${list1.sb_num}">
									<td><button class="mypage-btn modify">게시글 수정</button></td>
                                	<td><button class="mypage-btn delete">게시글 삭제</button></td>								
								</form>                                
                            </tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- 판매완료 -->
			<div id="tab2" class="tabcontent">
				<table class="ticket-history">
					<colgroup>
						<col style="width: 15%">
						<col style="width: 18%">
						<col style="width: 10%">
						<col style="width: 18%">
						<col style="width: 18%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<thead>
						<tr>
							<th>게시글번호</th>
							<th>제 목</th>							
							<th>가 격</th>
							<th>진행변경</th>
							<th>수정하기</th>
							<th>삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list2}" var="list2" varStatus="status">
							<tr>
                                <td class="reservation-num">${list2.sb_num}</td>
                                <td><a href="/sale/detail?num=${list2.sb_num}" class="a__pic">${list2.sb_name}</a></td>           
                                <td>${list2.total_price}</td>
                                <td>									
                                    <form role="form" action="/info/mypage/progress" method="POST">
										<input type="hidden" name="sb_num" value="${list2.sb_num}">
                                        <select name="trade_progress" id="pro">
											<option value="판매완료">판매완료</option>
                                            <option value="판매중">판 매 중</option>
                                            <option value="예약중">예 약 중</option>                                            
                                        </select>
                                        <br><br>
                                        <button type="submit" class="mypage-btn">수 정 하 기</button>
                                    </form>
                                </td>
								<form role="form1"><!-- 웬지 찜찜하다 -->
									<input type="hidden" name="sb_num" value="${list2.sb_num}">
									<td><button class="mypage-btn modify">게시글 수정</button></td>
                                	<td><button class="mypage-btn delete">게시글 삭제</button></td>								
								</form>
                                
                            </tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- 찜하기 -->
			<div id="tab3" class="tabcontent">
				<table class="ticket-history">
					<colgroup>
						<col style="width: 15%">
						<col style="width: 18%">
						<col style="width: 10%">
						<col style="width: 18%">
						<col style="width: 18%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<thead>
						<tr>
							<th>게시글번호</th>
							<th>제 목</th>
							<th>작성자</th>
							<th>가 격</th>
							<th>진행내역</th>							
							<th>찜 삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list3}" var="list3" varStatus="status">
							<tr>
                                <td class="reservation-num">${list3.sb_num}</td>
                                <td><a href="/sale/detail?num=${list3.sb_num}" class="a__pic">${list3.sb_name}</a></td>
                                <td>${list3.sb_nickname}</td>
                                <td>${list3.total_price}</td>
                                <td>${list3.trade_progress}</td>                                
								<form role="form3">
									<input type="hidden" name="sb_num" value="${list3.sb_num}">
									<td><button class="mypage-btn bookCancel">찜 취소</button></td>                                								
								</form>                                
                            </tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script>
		$(document).ready(function () {

			// 테스트 주의 !!!!!!!!!!!!!!!!!
			var formObj=$("form[role='form1']");

			$(".modify").on("click", function(){
				if (confirm("수정하시겠습니까?! ")) { //alert창					
					formObj.attr("action", "/sale/detailmodify");
					formObj.attr("method", "GET");
					console.log("formObj :: ", formObj);
					formObj.submit();
				}				
			});//mypage-modify
			
			$(".delete").on("click", function(){
				if (confirm("삭제하시겠습니까?! ")) { //alert창
					console.log("formObj :: ", formObj);
					formObj.attr("action", "/info/mypage/cancel");
					formObj.attr("method", "POST");					
					formObj.submit();
				}
			});//mypage-cancel

			var bookObj=$("form[role='form3']");

			$(".bookCancel").on("click", function(){
				if(confirm("북마크를 취소 하시겠습니까?")){
					console.log("bookObj :: ", bookObj);
					bookObj.attr("action", "/info/mypage/bookcancel");
					bookObj.attr("method", "POST");					
					bookObj.submit();
				}
			});//bookcancel


			$('.mypage-btn1').on('click', function () {
				//시간 가져옴
				var movie_start_time = $(this).parent('td').siblings('.movie_start_time').text();

				if (confirm("삭제하시겠습니까? ")) { //alert창

					var reservation_num = $(this).parent('td').siblings('.reservation-num').text();
					console.log(reservation_num);
					$.ajax({
						url: '/member/mypage/delete',
						type: 'post',
						data: {
							"reservation_num": reservation_num
						},
						dataType: 'json',
						success: function (data) {
							console.log('aaa');
						}, //end-success
						error: function () {
							console.log("실패");
						} //end-error
					}); //ajax

					window.location.href = "mypage"
				}
			})

		});//document

		$(function () {
			$('ul.tab li').click(function () {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			});//ul.tab.li
		});//function

	</script>
		
	<jsp:include page="footer.jsp" flush="false"/>
		
</body>
</html>