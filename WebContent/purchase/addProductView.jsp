<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/layout/header.jsp"/>
	<script src="/javascript/purchase.js" type="text/javascript"></script>

<body>


	<script type="text/javascript">
	
	  
		
		function fncAddProduct() {
			 
			
			$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
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
	
		<h1 class="bg-primary text-center">상 품 등 록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
				<input type="text" name="prodName"class="form-control" /> 
		    </div>
		    
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      	<input type="text" name="prodDetail" class="form-control"  />
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		    	<input type=date name="manuDay"  />
			  
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="price"  />
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="file" name="file_nm1" id="file_nm1" class="form-control"   />
		     
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >
		      	<a href="javascript:fncAddProduct();">등&nbsp;록</a> 
		      </button>
			  <a class="btn btn-primary btn" href="#" onClick="window.location.reload()" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form> 
		
 	</div>
	 
	
</body>

</html>