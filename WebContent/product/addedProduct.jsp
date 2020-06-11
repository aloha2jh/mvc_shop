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
    
    
</head>

<body>
 
	<jsp:include page="/layout/toolbar.jsp" /> 
	
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ ���</h3> 
	    </div>
	 
		 
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${ pvo.prodName }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"> 
				
				<c:if test="${ pvo.imgFile != null }">
					<img src="../../images/uploadFiles/${ pvo.imgFile }"  /> 
				</c:if>
				<c:if test="${ pvo.imgFile == null }">
					
				</c:if>
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${ pvo.prodDetail  }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${ pvo.manuDay }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${ pvo.price  }</div>
		</div> 
		 
		<br/>
		
 	</div> 

</body>

</html>