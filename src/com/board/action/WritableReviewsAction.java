package com.board.action;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.order.action.OrderDAO;
import com.order.action.OrderDTO;
import com.order.action.OrderDetailDTO;
import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.ReviewDAO;
import dto.reviewDTO;

public class WritableReviewsAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WritableReviewAction execute");


		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");
		
		reviewDTO rvdto = new ReviewDAO().getReviewInfo(member_num);
		int product_num = rvdto.getProduct_num();
	
		OrderDAO odao = new OrderDAO();

		
		List<OrderDTO> odlist = odao.getOrderInfo(member_num);

		
		List<String> order = null;
		for(int i=0; i<odlist.size(); i++){

			OrderDTO odto=(OrderDTO)odlist.get(i);
			String Orders_code= odto.getOrders_code();
			order.add(Orders_code);
			System.out.println(order.get(i));
		} 
		
		List<productDTO> pdlist =odao.getOrderProduct(order);

		
		System.out.println(odlist.size());
		request.setAttribute("odlist", odlist);
		request.setAttribute("pdlist", pdlist);
		
		
		
		//페이징 부분
		String page = request.getParameter("page");
		Criteria cri;
		PageDTO pagedto;
		int numPerPage = 5;
		
		if(page != null){
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			cri = new Criteria(nowPage, numPerPage);
			pagedto = new PageDTO(cri, odlist.size());
		}else{
			cri = new Criteria(numPerPage);
			pagedto = new PageDTO(cri, odlist.size());
		}
		
		request.setAttribute("p", pagedto);
	
		
		request.setAttribute("center", "writableReviews.jsp");
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
