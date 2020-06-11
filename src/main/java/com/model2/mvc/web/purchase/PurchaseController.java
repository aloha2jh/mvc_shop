package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService; 
 
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	 
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
 		

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	
	public PurchaseController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit; 
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	

	// addPurchase View  (O)
	@RequestMapping  ( value="addPurchase", method=RequestMethod.GET )
	public String addPurchase(  @RequestParam("prodNo") int prodNo , Model model ,  HttpSession session) throws Exception { 
		
		Product prod = productService.getProduct(prodNo); 
		String userId= ((User) session.getAttribute("user")).getUserId();
		model.addAttribute("pvo", prod); // Model 과 View 연결
		model.addAttribute("userId", userId);
 
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	// addPurchase (O)
	@RequestMapping  ( value="addPurchase", method=RequestMethod.POST )
	public String addPurchase( @ModelAttribute("purchase") Purchase purchase , Model model, 
			@RequestParam("buyerId") String buyerId ,
			@RequestParam("prodNo") int prodNo 			) throws Exception {

		System.out.println("addPurchase 실행됨");

		Purchase psvo = purchase; 
		User user = new User();
		user.setUserId(buyerId);
		
		Product prod = new Product();
		prod.setProdNo(prodNo);
		psvo.setBuyer(user);
		psvo.setPurchaseProd(prod);
		
		psvo.setTranCode("001");  
		psvo.setDivyDate(psvo.getDivyDate().substring(2,10)); 
		
		
		purchaseService.addPurchase(psvo); 
		
		model.addAttribute("psvo", psvo);
		
		return "forward:/purchase/addPurchase.jsp";
	}
 
	
	// getPurchase  (O)
	@RequestMapping( value="getPurchase", method=RequestMethod.GET )
	public String getPurchase( @RequestParam("tranNo") int tranNo , Model model  ) throws Exception {
		  
		Purchase psvo = purchaseService.getPurchase(tranNo); 
		 
		model.addAttribute("psvo", psvo); // Model 과 View 연결
		
		return "forward:/purchase/getPurchase.jsp";
	}
	
	
	
	// updatePurchase view  (O)
	@RequestMapping( value="updatePurchase", method=RequestMethod.GET  )
	public String updateUserView( @RequestParam("tranNo")int tranNo , Model model) throws Exception{ 
		  
		Purchase psvo = purchaseService.getPurchase(tranNo); 
		model.addAttribute("psvo", psvo); // Model 과 View 연결
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	 
	// updatePurchase
	@RequestMapping (value="updatePurchase", method=RequestMethod.POST  )
	public String updateUserView(  @ModelAttribute("purchase") Purchase purchase , Model model ,
			@RequestParam("buyerId") String buyerId ,
			@RequestParam("prodNo") int prodNo ) throws Exception{ 
		

		Purchase psvo = purchase; 
		User user = new User();
		user.setUserId(buyerId);
		
		Product prod = new Product();
		prod.setProdNo(prodNo);
		psvo.setBuyer(user);
		psvo.setPurchaseProd(prod);
		
		psvo.setTranCode("000");  
		psvo.setDivyDate(psvo.getDivyDate().substring(2,10));  
		 
		
		purchaseService.updatePurchase(psvo);
		   
		model.addAttribute("psvo", psvo); 

		return "forward:/purchase/getPurchase.jsp";
	}

 
	
	// listPurchase (O)
	
	@RequestMapping (value="/listPurchase" )
	public String listPurchase( @ModelAttribute("search") Search search , Model model ,  HttpSession session,
							//@RequestParam("userId") String userId,
							HttpServletRequest request) throws Exception{
		

		String userId=((User)session.getAttribute("user")).getUserId();
		
		
		// 현재 페이지
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> smap = new HashMap<String,Object>();
	 	smap.put("search", search);
	 	smap.put("buyerId", userId );
		
		// 리스트받아오기
		Map<String , Object> map = purchaseService.getPurchaseList(smap);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		// Model 과 View 연결
		model.addAttribute("map", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		 
		
		return "forward:/purchase/listPurchase.jsp";
	}

	  
	//tranNo , prodNo  
	@RequestMapping (value="updateTranCode", method=RequestMethod.GET  )
	public String updateTranCode(  @ModelAttribute("search") Search search , Model model ,
			@RequestParam("tranCode") String tranCode , @RequestParam("prodNo") int prodNo  ) throws Exception{ 
		
		Purchase ps = new Purchase();
		ps.setTranCode(tranCode);
		Product prod = new Product();
		prod.setProdNo(prodNo);
		ps.setPurchaseProd(prod);
		 
		purchaseService.updateTranCode(ps);
		model.addAttribute("search", search);

		System.out.println( "사용자인데:"+tranCode  );
	
		System.out.println(  "tranCode.equals(003)"+tranCode.equals(003)   );
		if( tranCode.equals("003") ) {
			System.out.println( "사용자인데:"+tranCode  );

			return "forward:/purchase/listPurchase";
		}else {
			return "forward:/product/listProduct?menu=manage";
		}
		
		
	}

}
































