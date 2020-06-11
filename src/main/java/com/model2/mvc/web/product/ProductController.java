package com.model2.mvc.web.product;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;
 
@Controller
@RequestMapping("/product/*")
public class ProductController {
	 
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
 	
	@Autowired
	@Qualifier("uploadPath")
	private String uploadPath;
	
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit; 
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	//addProduct View
	@RequestMapping (  value="addProduct", method=RequestMethod.GET )
	public String addProduct() throws Exception {
  
		return "redirect:/product/addProductView.jsp";
	}
	
	
	//addProduct
	@RequestMapping (  value="addProduct", method=RequestMethod.POST )
	public String addProduct( MultipartHttpServletRequest request , @ModelAttribute("product") Product product , Model model ) throws Exception {

		Product prod = product;
		
		Map<String, MultipartFile> files = request.getFileMap();
		CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("file_nm1");
		String path =uploadPath+cmf.getOriginalFilename(); 
	    File f = new File(path); 
		cmf.transferTo(f);

  
		prod.setimgFile(cmf.getOriginalFilename() );

  
		int prodNo = prod.getProdNo();
		prod.setProdTranCode("000");
		prod.setManuDay(prod.getManuDay().substring(2,10));
		productService.addProduct(product); 
		 
		model.addAttribute("pvo", prod);
		return "forward:/product/addedProduct.jsp";
	}
	
	
	// getProduct
	@RequestMapping (  value="getProduct", method=RequestMethod.GET )
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model, @RequestParam("menu") String menu ) throws Exception {
		  
		Product prod = productService.getProduct(prodNo); 
		
		System.out.println( menu );
		model.addAttribute("menu",menu);
		model.addAttribute("pvo", prod); // Model �� View ����
		
		return "forward:/product/getProduct.jsp";
	}
	
	// updateProductView
	@RequestMapping (  value="updateProduct", method=RequestMethod.GET )
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{ 
		Product prod = productService.getProduct(prodNo); 
		model.addAttribute("pvo", prod);   
		return "forward:/product/updateProduct.jsp";
	}
	 
	// updateProduct
	@RequestMapping ( value="updateProduct", method=RequestMethod.POST )
	public String updateProduct( MultipartHttpServletRequest request , @ModelAttribute("pvo") Product product , Model model ) throws Exception{
		
		
		Product prod = product;
		Map<String, MultipartFile> files = request.getFileMap();
		CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("file_nm1");
		 
		 
		String isFile = request.getParameter("uploadedFile");
		
		//case1 �̹� �����̾��ε�Ǿ� �־��� ��� => �����о������� �����. 
		if( isFile != null ) {
			prod.setimgFile( isFile );
			System.out.println("case 1 ");
		} 
		
		//case2 ������ �ȿ÷��� ��� => ���̸� �����ȳ����ʳ�? ���ϵ�ϸ� �о���Ű��.. 
		else if( isFile == null  ) {
			prod.setimgFile("back.JPG"); //�����������ϱ� �ִ�ô..
			System.out.println("case 2 ");
		}
		
		//case3 ������ ������Ʈ�� ���� �÷��� ���=> ���ϵ��! 
		if( cmf.getSize() != 0  ) {
			 

			System.out.println("case 3 ");
			String path =uploadPath+cmf.getOriginalFilename(); 
		    File f = new File(path); 
			cmf.transferTo(f);
	 
			prod.setimgFile(cmf.getOriginalFilename() );
		
		}
		
		int prodNo = prod.getProdNo();
		String rlt = transDay (prod.getManuDay() );
		prod.setManuDay(rlt);
		productService.updateProduct(product);		 
		prod = productService.getProduct(prodNo);  
		model.addAttribute("pvo", prod );
		return "forward:/product/getProduct.jsp";
	}
 
 
	private String transDay( String manuDay ) { 
		String date = manuDay.replace("-","").trim() ; 
		if( date.length() <= 8 ) {
			date.substring(2);
		} 
		return date;
	} 
	
	//ListProduct
	@RequestMapping ( value="listProduct" )
	public String listProduct( @ModelAttribute("search") Search search , Model model , 
							@RequestParam("menu") String menu, 
							HttpServletRequest request) throws Exception{
		
		//�޾ƿ��� �޴���.  
		System.out.println("[]�޴���:"+menu);      
	 
		// ���� ������
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		System.out.println("############### ����Ʈ product ��Ʈ�ѷ� ����Ǽ� ");
		// ����Ʈ�޾ƿ���
		Map<String , Object> map = productService.getProductList(search);
		
		System.out.println("###############");
		System.out.println(map );
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		// Model �� View ����
		model.addAttribute("map", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/product/listProduct.jsp";
	}
}