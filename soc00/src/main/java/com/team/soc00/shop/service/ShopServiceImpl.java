package com.team.soc00.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.team.soc00.shop.dao.ShopDAO;
import com.team.soc00.shop.vo.CartVO;
import com.team.soc00.shop.vo.ShopVO;

@Service("shopService")
public class ShopServiceImpl implements ShopService {


	@Autowired
	private ShopDAO shopDAO;

	@Override
	public List shopList()throws DataAccessException {
		List shopList = null;
		shopList = shopDAO.shopList();
		return shopList;
	}

	@Override
	public ShopVO prodInfo(int p_no)throws DataAccessException{
		return shopDAO.prodInfo(p_no);
	}

	@Override
	public void prodReg(ShopVO shopVO)throws DataAccessException {
		shopDAO.prodReg(shopVO);
	}


	//카트 목록
	@Override
	public List cartList()throws DataAccessException {
		List cartList = null;
		cartList = shopDAO.cartList();
		return cartList;
	}



	//카트 담기
	public void addGoodsInCart(CartVO cartVO) throws Exception{
		shopDAO.insertGoodsInCart(cartVO);
	}

	public boolean findCartGoods(CartVO cartVO) throws Exception{
		return shopDAO.selectCountInCart(cartVO);

	}














}
