<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/layout/header.jsp"/>
	<script src="/javascript/product.js" type="text/javascript"></script>
	
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
	
  	<input type="hidden" class="menu" value="${menu}"/>
	 
	<jsp:include page="/layout/toolbar.jsp" /> 
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>상품목록</h3>
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
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${ !empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" } >상품번호</option>
						<option value="1" ${ !empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" } >상품명</option>
						<option value="2" ${ !empty search.searchCondition && search.searchCondition == 2 ? "selected" : "" } >상품가격</option> 
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default btn-search">
						<a href="javascript:_search.fncGetList('${resultPage.currentPage}');">검색</a>
				  </button>
				  
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
            <th align="center">No</th>
            <th align="left">상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
            <th align="left">간량정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="map" items="${map}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ map.prodNo }</td>
			  <td align="left"> 
				<span>${ map.prodName }</span>
				<input type="hidden" value='{"prodNo":"${map.prodNo}","menu":"${menu}"}' /> 
			  </td>
			  <td align="left">${map.price}</td>
			  <td align="left">${map.regDate}</td>
			  <td align="left"> 
			  	<c:if test="${ menu =='manage' }">
					<c:choose>
						<c:when test="${map.prodTranCode == '000'}">
							판매중
						</c:when>
						<c:when test="${map.prodTranCode=='001' }">
							구매완료
							<a href="/purchase/updateTranCode?prodNo=${map.prodNo}&tranCode=002">배송하기</a>
						</c:when>
						<c:when test="${map.prodTranCode=='002' }">
							배송중
						</c:when>	
						<c:when test="${map.prodTranCode=='003' }">
							배송완료
						</c:when>	
					</c:choose>							
				</c:if>	
				<c:if test="${ menu =='search' }">
						<p>${ map.prodTranCode == '000' ? "판매중" : "재고없음" }</p>			
				</c:if> 
			</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${map.prodNo}"></i> 
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