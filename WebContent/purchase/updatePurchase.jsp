<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/layout/header.jsp"/>
	<script src="/javascript/purchase.js" type="text/javascript"></script>

<body>


	<script type="text/javascript">
	 
		function fncAddProduct() { 
			$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
		}
		
 
	</script>	 
    <style>
    
    .bg-primary {
	    color: #337ab7;
	    background-color: transparent;
	}
	button a{
	color:#fff;
	}
    </style>
	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">주문 수정 </h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
				 ${  pvo.prodName }  
				<input type="hidden" name="prodName" value="${ pvo.prodName }" readonly/>
				<input type="hidden" name="prodNo" value="${ pvo.prodNo }" readonly/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		       <img src="/images/uploadFiles/${ pvo.imgFile }"/> 
		       
		       <input type="hidden" name="imgFile" value="${ pvo.imgFile }"/>
		       
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		       ${ pvo.price } 
		    </div>
		  </div>
		  
		  <hr/>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">${ userId }
					<input type="hidden" name="buyerId" value="${ userId }" readonly /> 
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		    	<select name="paymentOption" class="ct_input_g" >
					<option value="0" selected="selected">현금구매</option>
					<option value="1">신용구매</option>
				</select> 
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="receiverName" id="receiverName" />
		    </div>
		  </div> 
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverPhone" id="receiverPhone" class="form-control"/> 
		    </div>
		  </div>
		   
		   <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자 주소</label>
		    <div class="col-sm-4">
		      <input type="text" name="divyAddr" id="divyAddr" class="form-control"/> 
		    </div>
		  </div>
		  
		  
		  
		   <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" name="divyRequest" id="divyRequest" class="form-control"/> 
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		      <input type="date" name="divyDate" id="divyDate" class="form-control"/> 
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >
		      	<a href="javascript:fncAddProduct();">주문</a> 
		      </button>
			  <a class="btn btn-primary btn" href="#" onClick="window.location.reload()" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form> 
		
 	</div>
	 
	
</body>

</html>