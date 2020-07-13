<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- CSS파일 -->
<link href="/resources/css/mypage02.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 달력JS/CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/sidebar.css">
<script type="text/javascript">
	$(document).ready(function() {
		$(".newsboard-nav-item").each(function() {
			$(this).click(function() {
				$(this).addClass("selected"); //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
				$(this).siblings().removeClass("selected"); //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
			});
		});
	});
</script>
<script>
$(document).ready(function(){
    $(".refresh").click(function(){
    	if(confirm("하루 2회 무료로 1000만원으로 초기화 가능합니다. \n초기화 하시겠습니까?")){
    		$.ajax({ url :'checkCharging', 
    				 type : 'GET', 
    				 success: function(result){ 
    					 		console.log(result);
    					 		if(result > 0)
    					 			alert("초기화 완료! 남은 횟수("+(result-1)+"회)");
    					 		else
    					 			alert("초기화를 다 사용하셨습니다.")
    					 			
    					 	},
    				 error: function(jqXHR, textStatus, errorThrown){
    			            alert("에러 발생 \n" + textStatus + " : " + errorThrown);
    			            self.close();
    			        	}
    		});
        }
    	else{
            alert("취소하셨습니다.");
        }
    	
    });/*
      $('#datetimepicker1').datetimepicker({ format: 'L'});
      $('#datetimepicker2').datetimepicker({ format: 'L', useCurrent: false});
      $("#datetimepicker1").on("change.datetimepicker", function (e) {$('#datetimepicker2').datetimepicker('minDate', e.date);});
      $("#datetimepicker2").on("change.datetimepicker", function (e) {$('#datetimepicker1').datetimepicker('maxDate', e.date);});

    // pagination 추가  
	$(function() {
		window.pagObj = $('#pagination').twbsPagination({
			totalPages : 35,
			visiblePages : 5,
			onPageClick : function(event, page) {
				console.info(page + ' (from options)');
			}
		}).on('page', function(event, page) {
			console.info(page + ' (from event listening)');
		});
	});     
    */
});
</script>
</head>
<body>

	<%@include file="../mainheader.jsp" %> 	

	<div class="containerNew">
		<div class="contents">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu">
						<ul>
							<li class="mid"><a href="/myPage01"><span>내 정보 관리</span></a></li>
							<c:set var="socialId" value="${loginUser.id}"/>
									<c:choose>
										<c:when test="${fn:contains(socialId,'_')}">
										</c:when>
										<c:otherwise>
							<li class="mid"><a href="/mypageUpdatePassword"><span>비밀번호 재설정</span></a></li>
										</c:otherwise>
									</c:choose>
							<li class="selected mid"><a href="/myPage02"><span>계좌정보</span></a></li>
							<li class="mid"><a href="/myPage03"><span>작성 글 | 댓글</span></a></li>
							<li><a href="/myPage04"><span>알림</span></a></li>
						</ul>
					</div>					
				</div>
				<div class="col-md-10">

					<div class="newsboard-area">
						<div class="drop-nav">
							<h1 class="tit-h1 line">계좌정보</h1>
						</div>
						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor: pointer;">나의 계좌정보 <i class="fas fa-angle-down"></i></h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
								<a href="/myPage01">내 정보 관리</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/mypageUpdatePassword">비밀번호 재설정</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/myPage02">계좌정보</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/myPage03">작성 글 | 댓글</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/myPage04">알림</a>
							</h1>
						</div>
						<div class="newsboard-nav">
							<ul class="nav newsboard-nav-tab" id="pills-tab" role="tablist">
								<li class="newsboard-nav-item <c:if test='${type eq "rate"}'>selected</c:if>" role="presentation"><a
									class="nav-link <c:if test='${type eq "rate"}'>active</c:if>" id="top-nav-font" data-toggle="pill"
									href="#pills-home" role="tab" aria-controls="pills-home"
									aria-selected="false">수익률</a></li>
								<li class="newsboard-nav-item <c:if test='${type eq "account"}'>selected</c:if>" role="presentation"><a
									class="nav-link <c:if test='${type eq "account"}'>active</c:if>" id="top-nav-font" data-toggle="pill"
									href="#pills-profile" role="tab" aria-controls="pills-profile"
									aria-selected="false">계좌</a></li>
								<li class="newsboard-nav-item <c:if test='${type eq "trade"}'>selected</c:if>" role="presentation"><a
									class="nav-link <c:if test='${type eq "trade"}'>active</c:if>" id="top-nav-font" data-toggle="pill"
									href="#pills-contact" role="tab" aria-controls="pills-contact"
									aria-selected="true" style="border-right: none;">거래내역</a></li>
							</ul>
						</div>

<!-- 						<div class="board-calendar">

							<div class="week ">
								<p class="date">
									<button onclick="setYesterday();" class="prev-week">어제</button>
									<strong id="test-date" value="setToday();">2020.06.18</strong>
									<span class="input-group-addon">
										<button type="button" class="calendar add-on">달력보기</button>
									</span>
									<button type="button" onclick="setToday();" class="btn-s">오늘</button>
									<button onclick="setTomorrow();" class="next-week"
										id="btn-tomorrow" style="display: none;">내일</button>
								</p>
							</div>
							//week
						</div>
						//board-calendar -->

				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade <c:if test='${type eq "rate"}'>show active</c:if>" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">
						<div class="noticeBox">
							<p class="notice">
								<em>${loginUser.nickname}</em>님의 수익률
							</p>
						</div>
						<div class="form-table">					
							<table>
								<caption>수익률 : 누적 순위, 누적 수익률, 손익금액, 투자원금</caption>
								<tbody>
									<tr>
										<th scope="row">
											<label for="ranking">누적 순위</label>
										</th>
										<td>
											<span class="input-style-case02">${ranking + 1}등</span>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="revenue">누적수익률</label>
										</th>
										<td>
											<span class="input-style-case02"><fmt:formatNumber value="${(accumAsset - 10000000)/100000}" type="number"/>%</span>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="profitloss">손익금액</label>
										</th>
										<td>
											<span class="input-style-case02"><fmt:formatNumber value="${accumAsset - 10000000}" type="number"/>원</span>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="profitloss">투자원금</label>
										</th>
										<td>
											<span class="input-style-case02">10,000,000원</span>
										</td>
									</tr>
									<tr>	
										<th scope="row">
											<label for="total-amount">보유금액</label>
										</th>
										<td>
										<div class="sell-wrap">
											<div class="money-my">
											<span class="input-style-case02"><fmt:formatNumber value="${loginUser.money}" type="number"/>원</span>
											</div>
											<button type="button" class="btn-t fantasy refresh">머니 초기화</button>
											
										</div>	
										</td>
									</tr>													
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade <c:if test='${type eq "account"}'>show active</c:if>" id="pills-profile" role="tabpanel"
						aria-labelledby="pills-profile-tab">
						<div class="noticeBox">
							<p class="notice">
								<em>${loginUser.nickname}</em>님의 계좌
							</p>
						</div>
						<div class="form-table">
							<div class="table-scroll">
								<table class="table-col">
									<caption>계좌정보</caption>
									<thead>
										<tr>
											<th scope="col" class="a-center">종목코드</th>
											<th scope="col" style="width: 300px;">종목명</th>
											<th scope="col" style="width: 150px;">평균매입가</th>
											<th scope="col" class="a-right">현재가</th>
											<th scope="col" class="a-center">보유주</th>
											<th scope="col" class="a-center">평가금액</th>
											<th scope="col" class="a-center">평가손익</th>
										</tr>
									</thead>
									<tbody>
									
									<c:if test="${holdingStockList.size() == 0}">
									    <tr>
									        <td colspan="7" style="text-align: center;">:::::보유 주식이 없습니다.::::::</td>
									    </tr>
									</c:if>
									    <c:forEach items="${holdingStockList}" var="stock">
											<tr>
												<td scope="col" class="a-center">${stock.stockCode}</td>
												<td scope="col" style="width: 300px;">${stock.stockName}</td>
												<td scope="col" style="width: 150px;"><fmt:formatNumber value="${stock.avgPrice}" type="number"/></td>
												<td scope="col" class="a-right"><fmt:formatNumber value="${stock.currentPrice}" type="number"/></td>
												<td scope="col" class="a-center">${stock.quantity}</td>
												<td scope="col" class="a-center"><fmt:formatNumber value="${stock.quantity*stock.currentPrice}" type="number"/></td>
												<td scope="col" class="a-center"><fmt:formatNumber value="${(stock.currentPrice-stock.avgPrice)*stock.quantity}" type="number"/></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- //table-col -->
							</div>
						</div>						
						<!-- 페이징 -->
						<div class="paging">
						
							<div class="paging-body">
								<nav aria-label="..." class="pagination">
									<ul class="pagination">


										
										<!-- 한번에 5개 페이지 보여줌 -->
										<c:forEach begin="${pv1.startPage }" end="${pv1.endPage }" var="p">
											<c:choose>
												<c:when test="${p == pv1.nowPage}">
													<li class="page-item active" aria-current="page">
														<a class="page-link" href="#">${p}
															<span class="sr-only">(current)</span>
														</a>
													</li>
												</c:when>
												<c:when test="${p != pv1.nowPage}">
													<li class="page-item">
														<a class="page-link" href="/myPage02?nowPage1=${p}&accountSearch=${accountSearch}&type=account">${p}</a>
													</li>
												</c:when>
											</c:choose>
										</c:forEach> 
										
									</ul>
								</nav>
							</div>
						</div>

						<div class="search-area">
							<div class="search-area-body">
								<form class="form-inline my-2 my-lg-0 underSearchForm" action="/myPage02">
									<input class="form-control mr-sm-2 board-search" type="search" placeholder="검색어 입력" name="accountSearch" value="${accountSearch}" aria-label="Search">
									<input type="hidden" name="type" value="account">
									<button class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn" type="submit">
										<i class="fas fa-search"></i>
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane fade <c:if test='${type eq "trade"}'>show active</c:if>" id="pills-contact" role="tabpanel"
						aria-labelledby="pills-contact-tab">
						<div class="noticeBox">
							<p class="notice">
								<em>${loginUser.nickname}</em>님의 거래내역
							</p>
						</div>						
<!-- 						<div class="board-free-nav">
							<form id="form" class="board-list-top policy-in" action="/board/free">
								<p class="pc-only">
									<input type="radio" class="ordeby" id="orderby1" name="orderby" value="new" checked=""><label for="orderby1" class="new-board">날짜순</label>
									<input type="radio" class="ordeby" id="orderby2" name="orderby" value="best"><label for="orderby2" class="hot-board">종목별</label>
								</p>
							</form>			 
						</div> -->
						
						<div class="form-table">
							<div class="table-scroll">
								<table class="table-col">
									<caption>거래 내역</caption>
									<thead>
										<tr>
											<th scope="col" style="width: 150px;"class="a-center">거래일자</th>
											<th scope="col" style="width: 300px;">종목명</th>
											<th scope="col" class="a-center">종류</th>
											<th scope="col" class="a-center">수량</th>
											<th scope="col" class="a-right">거래금액</th>
											<th scope="col" class="a-center">단가</th>
											<th scope="col" class="a-center">세금</th>
										</tr>
									</thead>
									<tbody>
									
									<c:if test="${stockHistoryList.size() == 0}">
									    <tr>
									        <td colspan="6" style="text-align: center;">:::::거래 내역이 없습니다.::::::</td>
									    </tr>
									</c:if>
									    <c:forEach items="${stockHistoryList}" var="stock">
											<tr>
												<td scope="col" style="width: 150px;" class="a-right">${stock.tdatetime}</td>
												<td scope="col" style="width: 300px;">${stock.stockName}</td>
												<td scope="col" class="a-center">${stock.category}</td>
												<td scope="col" class="a-center"><fmt:formatNumber value="${stock.quantity}" type="number"/></td>
												<td scope="col" class="a-right"><fmt:formatNumber value="${stock.tprice*stock.quantity}" type="number"/></td>
												<td scope="col" class="a-center">${stock.tprice}</td>
												<td scope="col" class="a-center"><fmt:formatNumber value="${stock.tprice*stock.quantity*0.0025}" type="number"/></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- //table-col -->
							</div>
						</div>						
						<!-- 페이징 -->
						<div class="paging">
						
							<div class="paging-body">
								<nav aria-label="..." class="pagination">
									<ul class="pagination">


										
										<!-- 한번에 5개 페이지 보여줌 -->
										<c:forEach begin="${pv2.startPage }" end="${pv2.endPage }" var="p">
											<c:choose>
												<c:when test="${p == pv2.nowPage}">
													<li class="page-item active" aria-current="page">
														<a class="page-link" href="#">${p}
															<span class="sr-only">(current)</span>
														</a>
													</li>
												</c:when>
												<c:when test="${p != pv2.nowPage}">
													<li class="page-item">
														<a class="page-link" href="/myPage02?nowPage2=${p}&tradeSearch=${tradeSearch}&type=trade&startDate=${startDate}&endDate=${endDate}">${p}</a>
													</li>
												</c:when>
											</c:choose>
										</c:forEach>
										
									</ul>
								</nav>
							</div>
						</div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
						<div class="search-area"> 
							<div class="search-area-body">
								<form class="form-inline my-2 my-lg-0 underSearchForm" action="/myPage02">
									<div class="balance-h2" id="sandbox-container">
					                     <div class="input-daterange input-group" id="datepicker">
					                     <p>
					                        <span class="input-style-cal start">
					                           <input type="text" name="startDate" class="startDate" id="test-date" placeholder="날짜선택" value="${startDate}" readonly>
					                           <button type="button" id="btnStartDate" class="calendar" onclick="$('.startDate').datepicker('show');">검색</button>
					                        </span>
					                        <i class="input-group-addon">~</i>
					                        <span class="input-style-cal end">
					                           <input type="text" name="endDate" class="endDate" id="test-date" placeholder="날짜선택" value="${endDate}" readonly>
					                           <button type="button" id="btnEndDate" class="calendar" onclick="$('.endDate').datepicker('show');">검색</button>
					                        </span>
					                       <!--  <span class="submit-button"><button type="submit" class="btn-s gray">검색</button></span> -->
					                    </p>
					                    </div>
					                </div>
									<div class="search-box">
										<input class="form-control mr-sm-2 board-search" type="search" name="tradeSearch" value="${tradeSearch}" placeholder="검색어 입력" aria-label="Search">
										<input type="hidden" name="type" value="trade">
										<button class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn" type="submit">
											<i class="fas fa-search"></i>
										</button>
									</div>
			               		</form>
			
					        <script type="text/javascript">
					        $(document).ready(function() {
						        $('.startDate').datepicker({
						            todayBtn : "linked",
						            clearBtn: true,
						            language: "ko",
						            autoclose: true,
						            toggleActive: true
						        });
						        
						        $('.endDate').datepicker({
						            todayBtn : "linked",
						            clearBtn: true,
						            language: "ko",
						            autoclose: true,
						            toggleActive: true
						        });
					        });
					        </script>  
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<%@include file="../mainfooter2.jsp" %>
		<script type="text/javascript">

						$(".m-drop-nav").click(function() {
							$(".m-drop-down").slideToggle("slow");
						});
					
		</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
<script src="/resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
</html>