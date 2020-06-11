package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase; 
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	//F
	@Autowired 
	@Qualifier("purchaseDaoImpl")  //productDao �� ���������Թ޾ƾߵǴµ�, �¸� implement�ϴ¾ֵ��� productDaoImpl ��ü�� �����ؼ� ProductDaoŸ������ �ްڴٴ°ǰ�?
	private PurchaseDao purchaseDao; 
	public void setProdDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDao.addPurchase(purchase);
	}
	@Override
	public Purchase getPurchase(int purchaseNo) throws Exception {
		return purchaseDao.getPurchase(purchaseNo);
	}
	@Override
	public Map<String, Object> getPurchaseList(Map<String, Object> smap) throws Exception {
		
		// �ֹ������ �޾ƿ´�.
		List<Product> list = purchaseDao.getPurchaseList(smap);
		System.out.println( "[]�ֹ���ϰ��"+list ); 
		
		String buyerId = (String) smap.get("buyerId");
		
		// �Ѱ�������� �޾ƿ´�.
		int totalCount = purchaseDao.getTotalCount(buyerId);
		System.out.println("[]�Ѱ������:"+totalCount);
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount) );
		return map;
	}
	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);
	}
	@Override
	public void updateTranCode(Purchase ps) {
		 
		purchaseDao.updateTranCode(ps);
	}
	 
 
}
