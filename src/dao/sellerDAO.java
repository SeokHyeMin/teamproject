package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.sellerDTO;

public class sellerDAO {
	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	DataSource ds;

	public void getCon() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/teamdb");
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println("DB_Connection:" + e.toString());
		}
	}

	public void ResouceClose() {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public sellerDTO getSellerInfo(int member_num){
		
		sellerDTO sdto = new sellerDTO();

		try {
			getCon();
			String sql = "select * from seller where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				sdto.setAccount(rs.getString("account"));
				sdto.setCategory_num(rs.getInt("category_num"));
				sdto.setMember_num(rs.getInt("member_num"));
				sdto.setStore_name(rs.getString("store_name"));
				sdto.setProfile_img(rs.getString("profile_img"));
				sdto.setTemplate(rs.getString("template"));

			}
		} catch (Exception e) {
			System.out.println("getSellerInfo:" + e.toString());
		} finally {
			ResouceClose();
		}

		return sdto;
		
		
	}
	// 로그인 아이디 비밀번호 확인
	public int userCheck(String id, String pw) {
		try {
			getCon();
			String sql = "select pw from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pw.equals(rs.getString("pw"))) {
					return 1;
				}
			}
		} catch (Exception e) {
			System.out.println("userCheck");
		} finally {
			ResouceClose();
		}
		return 0;
	}

	//중복확인 부분
	// store_name
	public int store_name_check(String store_name) {
		try {
			getCon();
			String sql = "select store_name from seller where store_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, store_name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;
			}

		} catch (Exception e) {
			System.out.println("store_name_check" + e.toString());
		} finally {
			ResouceClose();
		}
		return 0;
	}
	
	//판매자 등록
		public void insertSeller(sellerDTO sdto) {
		
			try {
				
				getCon();
				String sql = "insert into seller (member_num,store_name,category_num,profile_img,template,account)"
						+ " values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, sdto.getMember_num());
				pstmt.setString(2, sdto.getStore_name());
				pstmt.setInt(3, sdto.getCategory_num());
				pstmt.setString(4, sdto.getProfile_img());
				pstmt.setString(5, sdto.getTemplate());
				pstmt.setString(6, sdto.getAccount());
				pstmt.executeUpdate();
				
				sql = "update member set member_code = 2 where member_num =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, sdto.getMember_num());
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("insertSeller:"+e.toString());
			}finally {
				ResouceClose();
			}
		}
		

		//판매자 정보 수정 
		//스토어명변경
		public void updateStore_name(String store_name, int member_num) {
			try {
				getCon();
				String sql = "update seller set store_name=? where member_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, store_name);
				pstmt.setInt(2, member_num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("updateStore_name" + e.toString());
			} finally {
				ResouceClose();
			}
		}
		//카테고리명변경
		public int updateStore_c_num(int store_c_num, int member_num) {
			try {
				getCon();
				String sql = "update seller set store_c_num=? where member_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, store_c_num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("updateStore_c_num" + e.toString());
			} finally {
				ResouceClose();
			}
			return 0;
		}
		//프로필변경
		public void updateProfile_img(String profile_img, int member_num) {
			try {
				getCon();
				String sql = "update seller set profile_img=? where member_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, profile_img);
				pstmt.setInt(2, member_num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("updateProfile_img" + e.toString());
			} finally {
				ResouceClose();
			}
		}

		//템플릿변경
		public void updateTemplate(String template, int member_num) {
			try {
				getCon();
				String sql = "update seller set template=? where member_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, template);
				pstmt.setInt(2, member_num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("updateTemplate" + e.toString());
			} finally {
				ResouceClose();
			}
			
		}
			//계좌번호변경
		public void updateAccount(String account, int member_num) {
			try {
				getCon();
				String sql = "update seller set account=? where member_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, account);
				pstmt.setInt(2, member_num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("updateAccount" + e.toString());
			} finally {
				ResouceClose();
			}
		}
		


	
	
	
	
	
	
	
}
