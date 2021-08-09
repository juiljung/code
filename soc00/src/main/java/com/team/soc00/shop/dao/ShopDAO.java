package com.team.soc00.shop.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.team.soc00.shop.vo.CartListVO;
import com.team.soc00.shop.vo.CartVO;
import com.team.soc00.shop.vo.ShopVO;

public interface ShopDAO {

	public List shopList() throws DataAccessException;

	public ShopVO prodInfo(int p_no)throws DataAccessException;

	public void prodReg(ShopVO shopVO)throws DataAccessException;



	//īƮ ���
	public List cartList()throws DataAccessException;

	//īƮ ���
	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException;






}
