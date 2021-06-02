
package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import dao.boardDAO;
import dto.pagingDTO;

public class ProductListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		int member_num = (Integer) session.getAttribute("member_num");
		
		pagingDTO param = new pagingDTO();
		if(request.getParameter("pageNum")!=null) {
			param.setPageNum(request.getParameter("pageNum"));
		}else {
			param.setPageNum("1");
		}
		param.setPageSize(12);
		
		//AdminGoodsDAO객체 생성 후 getGoodsList()생성
		boardDAO bDao = new boardDAO();
		productDAO pdao = new productDAO();
		List<productDTO> list = pdao.getProductList(member_num);
		


		//requset영역에 저장
		request.setAttribute("list", list);
		request.setAttribute("center", "ProductList.jsp");
		ActionForward forward = new ActionForward();
		//페이지이동(뷰페이지로이동)
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);	
		return forward;
	}

}