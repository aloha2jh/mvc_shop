//aJax 
 const _ajax = { 
	getAsyncData : (url) =>{
		return $.ajax({
			url : url,
			method : "GET" ,
			dataType : "json" ,
			headers : { "Accept" : "application/json",
						"Content-Type" : "application/json" }
		})    
	} 
}
 
var userId = $('.session-userId').val();
 
//메뉴 클릭시 이동
$(document).on('click',"a[href='#']" , (e) => {
	const target = $(e.target); 
	if( target.next('input').length == 1 ){
		const data = target.next('input').val();
		_navi.moveLocationDynamic( target.text().replace(/ /gi, "") , data );
	}else{
		_navi.moveLocation( target.text().replace(/ /gi, "") );
	} 
}); 
  

//검색버튼클릭시
$(document).on('click', '.btn-search' , () => {
	_search.fncGetList(1); 
});
 

//메뉴
const _navi = {
	locationInfo : {
		"회원가입":"/user/addUserView.jsp",
		"로그인":"/user/login",
		"로그아웃": "/user/logout",
		"회원정보조회":"/user/listUser", 
		"개인정보조회":"/user/getUser?userId=", 
		"회원정보수정":"/user/updateUser?userId=",
		"판매상품등록":"/product/addProductView.jsp",
		"판매상품관리":"/product/listProduct?menu=manage", 
		"상품검색":"/product/listProduct?menu=search", 
	},
	moveLocation : ( e ) =>{ 
		 self.location =_navi.locationInfo[e]  
	},
	moveLocationDynamic : ( e, data ) =>{
		self.location = _navi.locationInfo[e]+data;
	}
}




 
	 