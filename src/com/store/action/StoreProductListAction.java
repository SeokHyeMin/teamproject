package com.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.memberDAO;
import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.boardDAO;
import dao.sellerDAO;
import dto.brandDTO;
import dto.pagingDTO;
import dto.sellerDTO;

public class StoreProductListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		int store_num = Integer.parseInt(request.getParameter("store_num"));
		productDAO pdao = new productDAO();
		sellerDAO sdao = new sellerDAO();
		boardDAO bdao = new boardDAO();
		
		List<productDTO> list = pdao.getStoreInfo(store_num);		
		String template = sdao.getSellerTemplate(store_num);
		
		int member_num = list.get(0).getMember_num();
		List<brandDTO> blist = bdao.getStorebrandList(member_num);
		System.out.println("브랜드 수"+blist.size());
		
		
		//페이징 부분
		String page = request.getParameter("page");
		Criteria cri;
		PageDTO pagedto;
		int numPerPage = 10;
		
		if(page != null){
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			cri = new Criteria(nowPage, numPerPage);
			pagedto = new PageDTO(cri, list.size());
		}else{
			cri = new Criteria(numPerPage);
			pagedto = new PageDTO(cri, list.size());
		}
		
		
		//requset영역에 저장
		request.setAttribute("list", list);
		request.setAttribute("p", pagedto);
		request.setAttribute("blist", blist);
		//member_num에 해당하는 상품 스토어 리스트 페이지로 이동
		ActionForward forward = new ActionForward();
		//페이지이동(뷰페이지로이동)
		forward.setPath("index.jsp");
		forward.setRedirect(false);
		request.setAttribute("center", "template"+template+"/shop.jsp");

		return forward;
	}
}