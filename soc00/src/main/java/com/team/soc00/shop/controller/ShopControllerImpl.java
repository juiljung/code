package com.team.soc00.shop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.soc00.member.vo.MemberVO;
import com.team.soc00.shop.service.ShopService;
import com.team.soc00.shop.vo.CartVO;
import com.team.soc00.shop.vo.ShopVO;

@Controller("shopController")
public class ShopControllerImpl implements ShopController {

	@Autowired
	private ShopService shopService;
	@Autowired
	private ShopVO shopVO;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;



	//상품목록
	@Override
	@RequestMapping(value="/shop/shopList.do", method = RequestMethod.GET)
	public ModelAndView shopList(HttpServletRequest request, HttpServletResponse response)throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String viewName = (String)request.getAttribute("viewName");
		List shopList = shopService.shopList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("shopList", shopList);
		return mav;

	}

	//상품정보
	@Override
	@RequestMapping(value="/shop/prodInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView prodInfo(@RequestParam("p_no") int p_no,
			HttpServletRequest req, HttpServletResponse res)throws Exception{
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		shopVO = shopService.prodInfo(p_no);
		ModelAndView mav = new ModelAndView();
		System.out.println(shopVO);
		mav.addObject("prodInfo", shopVO);
		return mav;
	}

	//상품등록
	@Override
	@RequestMapping(value="/shop/prodReg.do", method=RequestMethod.POST)
	public String prodReg(ShopVO shopVO, HttpServletRequest req, HttpServletResponse res)throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		shopService.prodReg(shopVO);
		return "redirect:/shop/shopList.do";
	}

	@RequestMapping(value="/shop/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}



	//카트 목록
	@Override
	@RequestMapping(value="/cartList.do" ,method = RequestMethod.GET)
	public ModelAndView cartList(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String viewName=(String)request.getAttribute("viewName");
		List cartList = shopService.cartList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("cartList", cartList);
		return mav;
	}




	//카트 담기
	@RequestMapping(value="/addGoodsInCart.do" ,method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public  @ResponseBody String addGoodsInCart(@RequestParam("p_no") int p_no,
			HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String u_id=memberVO.getU_id();

		cartVO.setU_id(u_id);
		//장바구니 등록전에, 등록된 상품인지 먼저 확인한다
		cartVO.setP_no(p_no);
		cartVO.setU_id(u_id);
		boolean isAreadyExisted=shopService.findCartGoods(cartVO);
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		if(isAreadyExisted==true){
			return "already_existed";
		}else{
			shopService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}






















}

