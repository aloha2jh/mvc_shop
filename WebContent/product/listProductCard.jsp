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
      
      body tr td.no-click{
      	text-decoration: none !important;
	    font-weight: 500;
	    cursor: default;
	    color: grey;
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
		
	  
		  <c:set var="i" value="0" />
		  <c:forEach var="map" items="${map}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ map.prodNo }</td>
			  
				<div class="row">
				  <div class="col-sm-6 col-md-4">
				    <div class="thumbnail">
				      <img src="/images/uploadFiles/${map.imgFile} }" alt="...">
				      <div class="caption">
				        <h3>Thumbnail label</h3>
				        <p>${map.price}</p>
				        <p>${ map.prodTranCode == '000' ? "판매중" : "재고없음" }</p>
				        <!-- <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> -->
				      </div>
				    </div>
				  </div>
				</div>
			
				 
	 
			   
			  	<i class="glyphicon glyphicon-ok" id= "${map.prodNo}"></i> 
			   
          </c:forEach>
         
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>