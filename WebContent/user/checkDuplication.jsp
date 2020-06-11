<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/layout/header.jsp"/>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============  "�ߺ�Ȯ��"  Event ó�� =============
		$(function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button.btn.btn-info").on("click" , function() {
				
				// Form ��ȿ�� ����
				if( $("#userId").val() != null && $("#userId").val().length >0) {
					$("form").attr("method" , "POST");
				    $("form").attr("action" , "/user/checkDuplication");
				    $("form").submit();
				}else {
					alert('���̵�� �ݵ�� �Է��ϼž� �մϴ�.');
				}
				$("#userId").focus();
			});
		});
	
	
		//=============  "���"  Event ó�� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button.btn.btn-success").on("click" , function() {
				
				if(opener) {
					opener.$("input[name='userId']").val("${userId}");
					opener.$("input[name='password']").focus();
				}
				
				window.close();
			});
		});
		
		
		//=============   "�ݱ�"  Event  ó�� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button.btn.btn-primary").on("click" , function() {
				window.close();
			});
		});

	</script>
	
</head>

<body>
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
		<br/><br/>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-inline">
		
		  <div class="form-group">
		    <label for="userId">�� �� ��</label>
		    <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�"
		    																		value="${ ! empty result && result ? userId : '' }" >
		  </div>
		  <button type="button" class="btn btn-info">�ߺ�Ȯ��</button>
		  
		  <c:if test="${ ! empty result }">
		  	<c:if test="${ result =='true' }">
		  		<button type="button" class="btn btn-success">�� ��</button>
		  	</c:if>
		  </c:if>
		  
		  <button type="button" class="btn btn-primary">�� ��</button>
		  
		  <c:if test="${ empty result }">
		  	<span class="text-info glyphicon glyphicon-ok">�Է����ߺ�Ȯ��</span>
		  </c:if>
		  
		  <c:if test="${ ! empty result }">
		  	<c:if test="${ result =='true' }">
				<span class="text-success glyphicon glyphicon-ok">��밡�� &nbsp;</span>
			</c:if>
			<c:if test="${ result=='false' }">
		 		<span class="text-danger glyphicon glyphicon-remove">���Ұ���</span>
			</c:if>
		  </c:if>
		 
		</form>
		<!-- form Start /////////////////////////////////////-->
	
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->

</body>

</html>