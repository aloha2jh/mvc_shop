<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/layout/header.jsp"/>
	<script src="/javascript/purchase.js" type="text/javascript"></script>
	
	 
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
    
</head>

<body>
 
	<jsp:include page="/layout/toolbar.jsp" /> 
	 
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">주문상세</h3> 
	    </div>
	
		<!--  <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${ psvo.purchaseProd.prodNo }</div>
		</div>--> 
		<hr/> 
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${ psvo.purchaseProd.prodName }</div>
		</div> 
		<hr/> 
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4">  
				<c:if test="${ !psvo.purchaseProd.imgFile }">
					<img src="/images/uploadFiles/${ psvo.purchaseProd.imgFile }" /> 
				</c:if>
				 
			</div> 
		</div> 
		<hr/> 
		<hr/> 
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매번호</strong></div>
			<div class="col-xs-8 col-md-4">${ psvo.tranNo  }</div>
		</div> 
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자 아이디</strong></div>
			<div class="col-xs-8 col-md-4">${ psvo.buyer.userId  }</div>
		</div> 
		<hr/> 
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자 이름</strong></div>
			<div class="col-xs-8 col-md-4">${ psvo.receiverName  }</div>
		</div> 
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매방법</strong></div>
			<div class="col-xs-8 col-md-4">
					<input name="paymentOption" type="hidden" readonly value="${ psvo.paymentOption }"/>  
					${ fn:trim(psvo.paymentOption)==0 ? "현금구매" : "신용구매"  }   
			
			</div>
		</div> 
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>연락처</strong></div>
			<div class="col-xs-8 col-md-4">${ psvo.receiverPhone  }</div>
		</div> 
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자주소</strong></div>
			<div class="col-xs-8 col-md-4">${ psvo.divyAddr  }</div>
		</div> 
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매요청사항</strong></div>
			<div class="col-xs-8 col-md-4">${ psvo.divyRequest  }</div>
		</div> 
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>배송희망일</strong></div>
			<div class="col-xs-8 col-md-4">${ psvo.divyDate  }</div>
		</div> 
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>주문일</strong></div>
			<div class="col-xs-8 col-md-4">${ psvo.orderDate } </div>
		</div> 
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">
  						<c:choose>
							<c:when test="${psvo.tranCode=='001'}">
								<a href="/purchase/updatePurchase?tranNo=${psvo.tranNo}">수정</a>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>


	  			</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>