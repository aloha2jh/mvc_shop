package com.model2.mvc.service.product.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")  
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	/// sqlSessionTemplate <<< �̰� commonservice�� �ִ� �����..
	//org.mybatis.spring.SqlSessionTemplate ���� ������ ���� ???????
	
	
	@Override
	public void addProduct(Product product) throws Exception {
		 
		System.out.println(product.toString());
		
		int i = sqlSession.insert("ProductMapper.addProduct", product); 
		
		System.out.println("[]"+i);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	@Override
	public List<Product> getProductList(Search svo) throws Exception {
		 
		return sqlSession.selectList("ProductMapper.getProductList", svo );
	}

	@Override
	public void updateProduct(Product prod) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", prod);
	}
	
	public int getTotalCount(Search svo) throws Exception { 
		return sqlSession.selectOne("ProductMapper.getTotalCount", svo);
	};
	 
}
