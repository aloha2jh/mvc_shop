<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/layout/header.jsp"/>
	<script src="/javascript/product.js" type="text/javascript"></script>
 
	<style>
		body {
            padding-top : 50px;
        }
    </style>
     
	<script type="text/javascript">
	
	function fncAddProduct(){
		 

		$("#detailForm").attr("method" , "POST").attr("action" , "/product/updateProduct").submit();
	 
	}
	 
		
		
	 
	 
	
	</script>
	
</head>

<body>
 
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">상품정보 수정</h3> 
	    </div>
	     
		<form class="form-horizontal" id="detailForm" name="detailForm" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${ pvo.prodNo }" />
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">상품</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="prodName" value=" ${ pvo.prodName }"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" value="${ pvo.prodDetail }" class="form-control" id="prodDetail" name="prodDetail"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDay" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="manuDay" name="manuDay" value="${ pvo.manuDay }" />
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price"  value=" ${ pvo.price }" />
		    </div>
		  </div>
		  
		 <div class="row">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		    	<c:if test="${ pvo.imgFile != null }">
		    		 <p>업로드된 파일: ${ pvo.imgFile }</p>
		    		 <span>이미지가 있을경우 수정하고싶을경우에만 업로드 하세요.</span>
					 <input type="file"  name="file_nm1" id="file_nm1" class="form-control"   />
					 <input type="hidden" value="${ pvo.imgFile }" name="uploadedFile" id="uploadedFile" />
				</c:if>
				<c:if test="${ pvo.imgFile == null }">
					 <input type="file"  name="file_nm1" id="file_nm1" class="form-control"   />
				 	 <input type="hidden" value="" name="uploadedFile" id="uploadedFile" />
				</c:if>
				
			</div>
			
			 
		</div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  ><a href="javascript:fncAddProduct();">수정</a></button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form> 
	    
 	</div> 
 	
</body>

</html>