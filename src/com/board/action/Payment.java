package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;

public class Payment implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String product_name = request.getParameter("product_name_order");
		System.out.println(product_name);
		String email = request.getParameter("order_email");
		String name = request.getParameter("order_name");
		String phone = request.getParameter("order_phone");
		String price_total = request.getParameter("price_total");
		String addr1 = request.getParameter("receiver_addr1");
		String addr2 = request.getParameter("receiver_addr2");
		String addr3 = request.getParameter("receiver_addr3");
		
		
		request.setAttribute("product_name", product_name);
		request.setAttribute("addr1", addr1);
		request.setAttribute("addr2", addr2);
		request.setAttribute("addr3", addr3);
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("phone", phone);
		request.setAttribute("price_total", price_total);
		request.setAttribute("name", name);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("payment.jsp");
		
		return forward;
	}

}
