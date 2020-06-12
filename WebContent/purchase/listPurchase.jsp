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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>�ֹ����</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
			  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">�ֹ���ȣ</th>
            <th align="left">��ǰ��</th>
            <th align="left">������</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">ȸ��ID</th>
            <th align="left">�������� ����</th>
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
						���ſϷ�
						</c:when>
						<c:when test="${map.tranCode=='002' }">
						�����
						<a href="/purchase/updateTranCode?prodNo=${ map.purchaseProd.prodNo }&tranCode=003">(���ǵ���)</a> 
						</c:when>
						<c:when test="${map.tranCode=='003' }">
						��ۿϷ�
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
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>