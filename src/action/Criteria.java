package action;

public class Criteria {
	private int nowPage;		//현재 페이지 번호
	private double numPerPage;		//페이지당 보여질 글 수
	
	public Criteria(int numPerPage) {
		this(1,numPerPage);
	}
	public Criteria(int nowPage,double numPerPage) {
		this.nowPage = nowPage;
		
		this.numPerPage = numPerPage;
		
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public void setNumPerPage(double numPerPage) {
		this.numPerPage = numPerPage;
	}
	public double getNumPerPage() {
		return numPerPage;
	}
	
	
}
