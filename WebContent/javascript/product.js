  
   

  
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
			+"��ǰ�̹��� : "+JSONData.imgFile+"<br/>"
			+"������  : "+JSONData.manuDay+"<br/>"
			+"����  : "+JSONData.price+"<br/>"
			+"������ : "+JSONData.prodDetail+"<br/>"
			+"��ǰ��  : "+JSONData.prodName+"<br/>"
			+"��ǰ ��ȣ  : "+JSONData.prodNo+"<br/>"
			+"�����  : "+JSONData.regDate+"<br/>"
			+"����  : "+JSONData.prodTranCode+"<br/></h4>";  
		$('h4').remove();
		$(e.target).parent().append(str); 
	});
	 
});

//����Ʈ���� ��ǰ Ŭ����
$(document).on('click','td:nth-child(2)', (e)=>{
	const data = JSON.parse( $(e.target).next('input').val() );
	const prodNo = data.prodNo;
	const menu = data.menu;
	self.location ="/product/getProduct?prodNo="+prodNo+"&menu="+menu;
});
 


//�˻�
const _search = { 
	fncGetList : ( currentPage ) =>{
		const menu = $('.menu').val();
		$("#currentPage").val(currentPage);
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+menu).submit();
	} 
}
 
 