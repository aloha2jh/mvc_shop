  


// ���̺�Ŭ���� getUser
$(document).on('click','td:nth-child(5) > i' , (e) => {
	
	const userId = $(e.target).attr('id');
	const url = "/user/json/getUser/"+userId;	
	 
	_ajax.getAsyncData(url).success( ( JSONData ) =>{
		 
		let str = 
		"<h4>���̵� : "+JSONData.userId+"<br/>"
		+"�̸� : "+JSONData.userName+"<br/>"
		+"�̸��� : "+JSONData.email+"<br/>"
		+"���� : "+JSONData.role+"<br/>"
		+"�������� : "+JSONData.regDate+"<br/></h4>";
		
		$('h4').remove();
		$(e.target).parent().append(str); 
		
	});
	 
});

//����Ʈ���� ���� Ŭ����
$(document).on('click','td:nth-child(2)', (e)=>{
	self.location ="/user/getUser?userId="+$(e.target).text().trim();
});
 

 

//�˻�
const _search = { 
	fncGetList : ( currentPage ) =>{
		$("#currentPage").val(currentPage);
		$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
	} 
}






 


 
////=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
//function fncGetUserList(currentPage) {
//	$("#currentPage").val(currentPage)
//	$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
//}
//
//
////============= "�˻�"  Event  ó�� =============	
// $(function() {
//	 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
//	 //$( "button.btn.btn-default" ).on("click" , function() {
//	//	fncGetUserList(1);
//	//});
// });
//
//
////============= userId �� ȸ����������  Event  ó��(Click) =============	
// $(function() {
//
//	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
//	$( "td:nth-child(2)" ).on("click" , function() {
//		 self.location ="/user/getUser?userId="+$(this).text().trim();
//	});
//				
//	//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
//	$( "td:nth-child(2)" ).css("color" , "red");
//	
//});	
//
//
////============= userId �� ȸ����������  Event  ó�� (double Click)=============
// $(function() {
//	 
//	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
//	$(  "td:nth-child(5) > i" ).on("click" , function() {
//
//			var userId = $(this).next().val();
//		
//			$.ajax( 
//					{
//						url : "/user/json/getUser/"+userId ,
//						method : "GET" ,
//						dataType : "json" ,
//						headers : {
//							"Accept" : "application/json",
//							"Content-Type" : "application/json"
//						},
//						success : function(JSONData , status) {
//
//							var displayValue = "<h6>"
//														+"���̵� : "+JSONData.userId+"<br/>"
//														+"��  �� : "+JSONData.userName+"<br/>"
//														+"�̸��� : "+JSONData.email+"<br/>"
//														+"ROLE : "+JSONData.role+"<br/>"
//														+"����� : "+JSONData.regDate+"<br/>"
//														+"</h6>";
//							$("h6").remove();
//							$( "#"+userId+"" ).html(displayValue);
//						}
//				});
//				////////////////////////////////////////////////////////////////////////////////////////////
//			
//	});
//	
 
//	
//	//==> �Ʒ��� ���� ������ ������ ??
//	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
//});	









 	