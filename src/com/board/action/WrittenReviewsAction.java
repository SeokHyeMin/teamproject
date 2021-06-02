package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import dao.ReviewDAO;
import dto.reviewDTO;



public class WrittenReviewsAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("writtenReveiwsAction execute");
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");
		
		productDAO pdao = new productDAO();
		List<productDTO> plist= pdao.getProductList(member_num);
		request.setAttribute("plist", plist);
		
		ReviewDAO rvdao = new ReviewDAO();
		List<reviewDTO> rvlist= rvdao.getReviewList(member_num);
		request.setAttribute("rvlist", rvlist);
		
		System.out.println(plist.size());
		System.out.println(rvlist.size());
		
		request.setAttribute("center", "writtenReviews.jsp");
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
