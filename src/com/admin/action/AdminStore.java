package com.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.memberDAO;
import com.member.action.memberDTO;

import action.Action;
import action.ActionForward;
import action.Criteria;
import action.PageDTO;
import dao.sellerDAO;
import dto.sellerDTO;
import dao.boardDAO;
import dto.pagingDTO;

public class AdminStore implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			 request.setCharacterEncoding("utf-8");
			 
			 ActionForward forward = new ActionForward();
			//셀러정보를 가지고온다.
			 List<sellerDTO> list = new sellerDAO().getSellerInfo();
			//셀러정보를 전달하기 위해 
			 
			//페이징 부분
				String page = request.getParameter("page");
				Criteria cri;
				PageDTO pagedto;
				int numPerPage = 5;
				
				if(page != null){
					int nowPage = Integer.parseInt(request.getParameter("nowPage"));
					cri = new Criteria(nowPage, numPerPage);
					pagedto = new PageDTO(cri, list.size());
				}else{
					cri = new Criteria(numPerPage);
					pagedto = new PageDTO(cri, list.size());
				}
				
			 request.setAttribute("list", list);
			 request.setAttribute("p", pagedto);
			 
			 forward.setRedirect(false);
			 forward.setPath("AdminStore.jsp");
	        
	        return forward;	
	}
} 
