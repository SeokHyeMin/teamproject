package com.board.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.member.action.memberDAO;
import com.order.action.OrderDetailDTO;

import action.Action;
import action.ActionForward;
import dao.ReviewDAO;
import dao.boardDAO;
import dao.sellerDAO;
import dto.buyCompleteDTO;
import dto.reviewDTO;
import dto.visitDTO;

public class StoreChart implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int member_num = (Integer)session.getAttribute("member_num");
		int store_num = new sellerDAO().getSellerInfo(member_num).getStore_num();
		
		ReviewDAO rdao = new ReviewDAO();
		List<reviewDTO> srlist = rdao.getStoreReviewList(store_num);
		
			
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String day = simpleDateFormat.format(new Date());
		List<buyCompleteDTO> olist = new boardDAO().getSalesRate(store_num);
		JSONArray count = new JSONArray();
		for(int i=0;i<olist.size();i++) {
			count.add(olist.get(i).getSum());
		}
		JSONArray total = new JSONArray();
		for(int i=0;i<olist.size();i++) {
			total.add(olist.get(i).getPrice());
		}
		
		List<visitDTO> vlist = new sellerDAO().getVisitCount(store_num, day);
		JSONArray user = new JSONArray();
		JSONArray vcount = new JSONArray();
			for(int i=0;i<vlist.size();i++) {
				user.add(vlist.get(i).getUser());
			}
			for(int i=0;i<vlist.size();i++) {
				vcount.add(vlist.get(i).getCount());
			}
		request.setAttribute("vlist", vlist);
		request.setAttribute("user", user);
		request.setAttribute("vcount", vcount);
		request.setAttribute("count", count);
		request.setAttribute("total", total);
		request.setAttribute("srlist", srlist);
		request.setAttribute("center", "StoreChart.jsp");
		
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage.jsp");
		return forward;
		
	}
}
