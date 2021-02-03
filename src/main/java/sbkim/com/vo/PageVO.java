package sbkim.com.vo;

public class PageVO {

	private int listSize = 10; //초기값: 1페이지 내 게시물 개수
	private int rangeSize = 10;	//초기값: 1range 내 페이지 수 
	private int page;			//현재 페이지 
	private int range;			//현재 페이지 범위	
	private int listCnt;		//총 게시물 개수 
	private int pageCnt;		//총 페이지 개수
	private int startList;		//게시판 시작 번호
	private int startPage;		//각 페이지 범위 시작 번호
	private int endPage;		//각 페이지 범위 끝 번호
	private boolean prev;		//이전 페이지
	private boolean next;		//다음 페이지
	
	
	public int getListSize() {
		return listSize;
	}	
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getStartList() {
		return startList;
	}
	public void setStartList(int startList) {
		this.startList = startList;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;			// 현재 페이지 정보
		this.range = range;			// 현재 페이지 범위 정보
		this.listCnt = listCnt;		// 게시물의 총 개수
		
		
		//전체 페이지 수
		this.pageCnt = (int) Math.ceil((double)listCnt/(double)listSize);	//전체 게시물 수 / 한 페이지당 목록화될 게시물 수 
		
		//시작 페이지
		this.startPage = (range-1) * rangeSize + 1;  //(각 페이지 범위 시작 번호 -1)* 한페이지 범위에 보여질 페이지 개수+1 

		//끝 페이지
		this.endPage = range * rangeSize;
		
		//게시판 시작번호
		this.startList = (page-1) *listSize;

		//게시판 끝번호
		this.listSize = startList + 9;
		
		//이전 버튼 상태
		this.prev = range==1?false:true;
		
		//다음 버튼 상태 
		this.next = endPage > pageCnt ? false : true;
			if (this.endPage > this.pageCnt) {	//끝 페이지 > 페이지 총개수
				this.endPage = this.pageCnt;
				this.next = false;
			}	
	}
	@Override
	public String toString() {
		return "PageVO [listSize=" + listSize + ", rangeSize=" + rangeSize + ", page=" + page + ", range=" + range
				+ ", listCnt=" + listCnt + ", pageCnt=" + pageCnt + ", startList=" + startList + ", startPage="
				+ startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + "]";
	}	
	
	
	
}
