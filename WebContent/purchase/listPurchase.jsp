<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/layout/header.jsp"/>
	<script src="/javascript/purchase.js" type="text/javascript"></script>
	
	<style>
	  body {
            padding-top : 50px;
        }
        
      td:nth-child(2){
      	text-decoration:underline !important;
      	font-weight:500;
      	cursor:pointer;
      }
    </style>
      
</head>

<body>
	
	<c:set var="resultPage" value="${ resultPage }"/>  
	 
	<jsp:include page="/layout/toolbar.jsp" /> 
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>주문목록</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
			  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">주문번호</th>
            <th align="left">상품명</th>
            <th align="left">구매자</th>
            <th align="left">전화번호</th>
            <th align="left">배송현황</th>
            <th align="left">회원ID</th>
            <th align="left">간략정보 보기</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="map" items="${map}">
			<c:set var="i" value="${ i+1 }" />
		 
			<tr>
			  <td align="center">
				${ map.tranNo }
			  </td> 
			  <td align="left">${ map.purchaseProd.prodName }<input type="hidden" value="${map.tranNo}"/></td>
			  <td align="left">${ map.receiverName }</td>
			  <td align="left">${ map.receiverPhone }</td>
			  <td align="left"> 
					<c:choose>
						<c:when test="${ map.tranCode=='001' }">
						구매완료
						</c:when>
						<c:when test="${map.tranCode=='002' }">
						배송중
						<a href="/purchase/updateTranCode?prodNo=${ map.purchaseProd.prodNo }&tranCode=003">(물건도착)</a> 
						</c:when>
						<c:when test="${map.tranCode=='003' }">
						배송완료
						</c:when> 
					</c:choose>	
				</td>
				   <td align="left"> 
					<span>${ map.buyer.userId }</span> 
				</td>
					<td align="left">
						<i class="glyphicon glyphicon-ok" id= "${map.tranNo}"></i> 
				 	</td>
				</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>