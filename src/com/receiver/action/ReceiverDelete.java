package com.receiver.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.boardDAO;

public class ReceiverDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		int receiver_num = Integer.parseInt(request.getParameter("receiver_num"));
		
		new boardDAO().deleteReceiver(receiver_num);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("receiver.re");
		forward.setRedirect(false);
		return forward;	
		
	}

}
