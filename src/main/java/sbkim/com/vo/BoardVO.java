package sbkim.com.vo;

public class BoardVO {

	private int cno; 
	private String title;
	private String contents;
	private String fileName;
	private int viewCount;
	private String regdate;
	private String category;
	private String infoCategory;
	private String uno;
	private int lCount;
	private String search;
	
	public BoardVO() {
		super();
	}
	

	public BoardVO(int cno, String title, String contents, String fileName, int viewCount, String regdate,
			String category, String infoCategory, String uno, int lCount) {
		super();
		this.cno = cno;
		this.title = title;
		this.contents = contents;
		this.fileName = fileName;
		this.viewCount = viewCount;
		this.regdate = regdate;
		this.category = category;
		this.infoCategory = infoCategory;
		this.uno = uno;
		this.lCount = lCount;
	}

	

	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public int getViewCount() {
		return viewCount;
	}


	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getInfoCategory() {
		return infoCategory;
	}


	public void setInfoCategory(String infoCategory) {
		this.infoCategory = infoCategory;
	}


	public String getUno() {
		return uno;
	}


	public void setUno(String uno) {
		this.uno = uno;
	}


	public int getlCount() {
		return lCount;
	}


	public void setlCount(int lCount) {
		this.lCount = lCount;
	}


	@Override
	public String toString() {
		return "BoardVO [cno=" + cno + ", title=" + title + ", contents=" + contents + ", fileName=" + fileName
				+ ", viewCount=" + viewCount + ", regdate=" + regdate + ", category=" + category + ", infoCategory="
				+ infoCategory + ", uno=" + uno + ", lCount=" + lCount + "]";
	}
	
	

}
