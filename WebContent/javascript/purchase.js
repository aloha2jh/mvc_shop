  
   

  
$(document).on('click', '.btn-search' , () => {
	fncGetList(1); 
});
 
$(document).on('click','td:nth-child(6) > i' , (e) => {
	console.log( $(e.target) );
	const info = JSON.parse( $(e.target).parent().siblings().find('input').val() ); 
	const url = "/product/json/getProduct/"+info.prodNo+"/"+info.menu;	 
	_ajax.getAsyncData(url).success(  ( JSONData ) =>{ 
		console.log(JSONData);
		let str = 
			"<h4>"
			+"상품이미지 : "+JSONData.imgFile+"<br/>"
			+"제조일  : "+JSONData.manuDay+"<br/>"
			+"가격  : "+JSONData.price+"<br/>"
			+"상세정보 : "+JSONData.prodDetail+"<br/>"
			+"상품명  : "+JSONData.prodName+"<br/>"
			+"상품 번호  : "+JSONData.prodNo+"<br/>"
			+"등록일  : "+JSONData.regDate+"<br/>"
			+"상태  : "+JSONData.prodTranCode+"<br/></h4>";  
		$('h4').remove();
		$(e.target).parent().append(str); 
	});
	 
});

//리스트에서 상품 클릭시
$(document).on('click','td:nth-child(2)', (e)=>{
 
	const tranNo =$(e.target).find('input').val(); 
	self.location ="/purchase/getPurchase?tranNo="+tranNo;
});
 

 


//검색
const _search = { 
	fncGetList : ( currentPage ) =>{

		$("#currentPage").val( currentPage );
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	} 
}

 