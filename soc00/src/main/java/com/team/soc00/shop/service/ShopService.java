package com.team.soc00.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.team.soc00.shop.vo.CartVO;
import com.team.soc00.shop.vo.ShopVO;


public interface ShopService {

	public List shopList() throws DataAccessException;

	public ShopVO prodInfo(int p_no)throws DataAccessException;

	public void prodReg(ShopVO shopVO)throws DataAccessException;


	//īƮ ���
	public List cartList()throws DataAccessException;

	//īƮ ���
	public void addGoodsInCart(CartVO cartVO) throws Exception;

	public boolean findCartGoods(CartVO cartVO) throws Exception;



}
