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
 
//�޴� Ŭ���� �̵�
$(document).on('click',"a[href='#']" , (e) => {
	const target = $(e.target); 
	if( target.next('input').length == 1 ){
		const data = target.next('input').val();
		_navi.moveLocationDynamic( target.text().replace(/ /gi, "") , data );
	}else{
		_navi.moveLocation( target.text().replace(/ /gi, "") );
	} 
}); 
  

//�˻���ưŬ����
$(document).on('click', '.btn-search' , () => {
	_search.fncGetList(1); 
});
 

//�޴�
const _navi = {
	locationInfo : {
		"ȸ������":"/user/addUserView.jsp",
		"�α���":"/user/login",
		"�α׾ƿ�": "/user/logout",
		"ȸ��������ȸ":"/user/listUser", 
		"����������ȸ":"/user/getUser?userId=", 
		"ȸ����������":"/user/updateUser?userId=",
		"�ǸŻ�ǰ���":"/product/addProductView.jsp",
		"�ǸŻ�ǰ����":"/product/listProduct?menu=manage", 
		"��ǰ�˻�":"/product/listProduct?menu=search", 
	},
	moveLocation : ( e ) =>{ 
		 self.location =_navi.locationInfo[e]  
	},
	moveLocationDynamic : ( e, data ) =>{
		self.location = _navi.locationInfo[e]+data;
	}
}




 
	 