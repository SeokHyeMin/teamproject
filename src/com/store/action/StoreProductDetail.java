package com.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.ReviewDAO;
import dao.boardDAO;
import dao.sellerDAO;
import dto.brandDTO;
import dto.categoryDTO;
import dto.reviewDTO;

public class StoreProductDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		
		/*데이터베이스 자바빈 작업*/
		productDAO pdao = new productDAO();
		productDTO pdto = pdao.getStoreProductInfo(product_num);	
		int store_num = pdto.getStore_num();
		sellerDAO sdao = new sellerDAO();
		String template = sdao.getSellerTemplate(store_num);
		
		//카테고리 정보 받아오기
		boardDAO bdao = new boardDAO();
		List<categoryDTO> clist = bdao.getcategory();
		List<brandDTO> blist = bdao.getbrandList();

		//리뷰 리스트
		List<reviewDTO> rvlist = new ReviewDAO().getProductReviewList(product_num);
		
		//페이징
		String page = request.getParameter("page");
		Criteria cri;
		PageDTO pagedto;
		int numPerPage = 5;
						
		if(page != null){
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			cri = new Criteria(nowPage, numPerPage);
			pagedto = new PageDTO(cri, rvlist.size());
		}else{
			cri = new Criteria(numPerPage);
			pagedto = new PageDTO(cri, rvlist.size());
		}
		
		request.setAttribute("p", pagedto);
		request.setAttribute("rvlist", rvlist);
		request.setAttribute("blist", blist);
		request.setAttribute("clist", clist);
		request.setAttribute("pdto", pdto);
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("center", "template"+template+"/product.jsp"); 
		forward.setRedirect(false);
		forward.setPath("index.jsp");
		return forward;
	}
	

}
