package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.ReviewDAO;

public class ReviewDeleteAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("reviewdelete execute");
		
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		
		ReviewDAO rvdao = new ReviewDAO();
		rvdao.deleteReview(review_num);
		
		request.setAttribute("center", "writtenReviews.jsp");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;

	
		
}
}
