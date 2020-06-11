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
	       <h3 class=" text-info">��ǰ���� ����</h3> 
	    </div>
	     
		<form class="form-horizontal" id="detailForm" name="detailForm" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${ pvo.prodNo }" />
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">��ǰ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="prodName" value=" ${ pvo.prodName }"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" value="${ pvo.prodDetail }" class="form-control" id="prodDetail" name="prodDetail"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDay" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="manuDay" name="manuDay" value="${ pvo.manuDay }" />
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">���� </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price"  value=" ${ pvo.price }" />
		    </div>
		  </div>
		  
		 <div class="row">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		    	<c:if test="${ pvo.imgFile != null }">
		    		 <p>���ε�� ����: ${ pvo.imgFile }</p>
		    		 <span>�̹����� ������� �����ϰ������쿡�� ���ε� �ϼ���.</span>
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
		      <button type="button" class="btn btn-primary"  ><a href="javascript:fncAddProduct();">����</a></button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form> 
	    
 	</div> 
 	
</body>

</html>