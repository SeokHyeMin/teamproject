package com.main.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.action.productDAO;
import com.product.action.productDTO;

import action.Criteria;
import action.PageDTO;
import dao.boardDAO;
import dto.categoryDTO;

@WebServlet("/SelectList.do")
public class SelectProductList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		int category_code1 = Integer.parseInt(request.getParameter("category_code1"));
		int category_code2 = Integer.parseInt(request.getParameter("category_code2"));
		int category_code3 = Integer.parseInt(request.getParameter("category_code3"));
		String brand = request.getParameter("brand");
		String price1 = request.getParameter("price1");
		String price2 = request.getParameter("price2");
		String price = request.getParameter("price");
		String sort = request.getParameter("sort");
		System.out.println(price);
		System.out.println(price1);
		System.out.println(price2);
		boardDAO bdao = new boardDAO();
		productDAO pdao = new productDAO();
		List<categoryDTO> clist_all = bdao.getcategory();
		List<categoryDTO> clist = bdao.getcategory(category_code1,category_code2);
		List<productDTO> plist = pdao.getProductList(category_code1, category_code2, category_code3, brand, price1, price2,sort,price);
		
		//페이징 부분
		String page = request.getParameter("page");
		Criteria cri;
		PageDTO pagedto;
		int numPerPage =0;
		if(request.getParameter("numPerPage") == null){
			numPerPage = 10;
		}else{
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		}
		
		if(page != null){
			int nowPage = Integer.parseInt(request.getParameter("nowPage"));
			cri = new Criteria(nowPage, numPerPage);
			pagedto = new PageDTO(cri, plist.size());
		}else{
			cri = new Criteria(numPerPage);
			pagedto = new PageDTO(cri, plist.size());
		}

		
		//제이슨형식으로 변환
		String json = "[";
		for (int i=0; i<clist.size();i++) {
			categoryDTO cdto = (categoryDTO)clist.get(i);
			int category_code = cdto.getCategory_code();
			String category_name= cdto.getCategory_name();
			json+="{\"category_code\":\""+category_code+"\",\"category_name\":\""+category_name+"\"}";
			if(i !=clist.size()-1) {
				json+=",";
			}
		}
		
		json +="]||[";
		for (int i=0; i<plist.size();i++) {
			productDTO pdto = (productDTO)plist.get(i);
			String product_img = pdto.getProduct_img();
			String product_name = pdto.getProduct_name();
			String category_name = pdto.getCategory_name();
			String product_description = pdto.getProduct_description();
			String store_name = pdto.getStore_name();
			int store_num = pdto.getStore_num();
			String profile_img = pdto.getProfile_img();
			String template = pdto.getTemplate();
			int category_num = pdto.getCategory_num();
			int product_price = pdto.getProduct_price();
			Timestamp regdate = pdto.getRegdate();
			int category_coderef1 = pdto.getCategory_coderef1();
			int category_coderef2 = pdto.getCategory_coderef2();
			int category_code = pdto.getCategory_code1();

			json+="{\"product_img\":\""+product_img+"\",\"category_name\":\""+category_name+"\",\"product_name\":\""+product_name+"\",\"category_name\":\""+category_name+"\","
					+ "\"product_description\":\""+product_description+"\",\"store_name\":\""+store_name+"\",\"store_num\":\""+store_num+"\","
					+ "\"profile_img\":\""+profile_img+"\",\"template\":\""+template+"\",\"category_num\":\""+category_num+"\",\"product_price\":\""+product_price+"\""
					 + ",\"regdate\":\""+regdate+"\",\"category_coderef1\":\""+category_coderef1+"\""
					 		+ ",\"category_coderef2\":\""+category_coderef2+"\",\"category_code1\":\""+category_code+"\"}";
			if(i !=plist.size()-1) {
				json+=",";
			}
		}
		
		json +="]||[";
		
		for (int i=0; i<clist_all.size();i++) {
			categoryDTO cdto = (categoryDTO)clist_all.get(i);
			
			int category_code = cdto.getCategory_code();
			String category_name= cdto.getCategory_name();
			json+="{\"category_code\":\""+category_code+"\",\"category_name\":\""+category_name+"\"}";
			if(i !=clist_all.size()-1) {
				json+=",";
			}
		}
		json +="]||";
			
		json+="[{\"startPage\":\""+pagedto.getStartPage()+"\",\"endPage\":\""+pagedto.getEndPage()+"\",\"beginPerPage\":\""+pagedto.getBeginPerPage()+"\",\"endPerPage\":\""+pagedto.getEndPerPage()+"\","
				+"\"prev\":\""+pagedto.isPrev()+"\",\"next\":\""+pagedto.isNext()+"\",\"total\":\""+pagedto.getTotal()+"\",\"nowPage\":\""+pagedto.getCri().getNowPage()+"\"}]";
		response.setHeader("content-type", "application/json");
		out.print(json);
		out.flush();
		out.close();
	}
}
