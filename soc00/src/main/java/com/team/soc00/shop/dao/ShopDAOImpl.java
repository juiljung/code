package com.team.soc00.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.team.soc00.shop.vo.CartVO;
import com.team.soc00.shop.vo.ShopVO;

@Repository("ShopDAO")
public class ShopDAOImpl implements ShopDAO{

	@Autowired
	private SqlSession sqlSession;


	@Override
	public List shopList()throws DataAccessException {
		List<ShopVO> shopList = null;
		shopList = sqlSession.selectList("mapper.shop.shopList");
		return shopList;
	}

	@Override
	public ShopVO prodInfo(int p_no)throws DataAccessException {
		return sqlSession.selectOne("mapper.shop.prodInfo", p_no);
	}

	@Override
	public void prodReg(ShopVO shopVO)throws DataAccessException {
		sqlSession.insert("mapper.shop.prodReg", shopVO);
	}


	//카트 목록
	@Override
	public List cartList()throws DataAccessException {
		List<ShopVO> cartList = null;
		cartList = sqlSession.selectList("mapper.shop.cartList");
		return cartList;
	}



	//카트 담기
	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException{
		// int c_no=selectMaxCartId();
		// cartVO.setC_no(c_no);
		sqlSession.insert("mapper.cart.insertGoodsInCart",cartVO);
	}






}	
