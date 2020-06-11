  


// 테이블클릭시 getUser
$(document).on('click','td:nth-child(5) > i' , (e) => {
	
	const userId = $(e.target).attr('id');
	const url = "/user/json/getUser/"+userId;	
	 
	_ajax.getAsyncData(url).success( ( JSONData ) =>{
		 
		let str = 
		"<h4>아이디 : "+JSONData.userId+"<br/>"
		+"이름 : "+JSONData.userName+"<br/>"
		+"이메일 : "+JSONData.email+"<br/>"
		+"권한 : "+JSONData.role+"<br/>"
		+"가입일자 : "+JSONData.regDate+"<br/></h4>";
		
		$('h4').remove();
		$(e.target).parent().append(str); 
		
	});
	 
});

//리스트에서 유저 클릭시
$(document).on('click','td:nth-child(2)', (e)=>{
	self.location ="/user/getUser?userId="+$(e.target).text().trim();
});
 

 

//검색
const _search = { 
	fncGetList : ( currentPage ) =>{
		$("#currentPage").val(currentPage);
		$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
	} 
}






 


 
////=============    검색 / page 두가지 경우 모두  Event  처리 =============	
//function fncGetUserList(currentPage) {
//	$("#currentPage").val(currentPage)
//	$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
//}
//
//
////============= "검색"  Event  처리 =============	
// $(function() {
//	 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
//	 //$( "button.btn.btn-default" ).on("click" , function() {
//	//	fncGetUserList(1);
//	//});
// });
//
//
////============= userId 에 회원정보보기  Event  처리(Click) =============	
// $(function() {
//
//	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
//	$( "td:nth-child(2)" ).on("click" , function() {
//		 self.location ="/user/getUser?userId="+$(this).text().trim();
//	});
//				
//	//==> userId LINK Event End User 에게 보일수 있도록 
//	$( "td:nth-child(2)" ).css("color" , "red");
//	
//});	
//
//
////============= userId 에 회원정보보기  Event  처리 (double Click)=============
// $(function() {
//	 
//	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
//														+"아이디 : "+JSONData.userId+"<br/>"
//														+"이  름 : "+JSONData.userName+"<br/>"
//														+"이메일 : "+JSONData.email+"<br/>"
//														+"ROLE : "+JSONData.role+"<br/>"
//														+"등록일 : "+JSONData.regDate+"<br/>"
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
//	//==> 아래와 같이 정의한 이유는 ??
//	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
//});	









 	