package sbkim.com.vo;

public class LikeVO {
	
	private int lno;
	private int lCount;
	private String uno;
	private int cno;
	
	public LikeVO() {
		super();
	}
	
	public LikeVO(int lno, int lCount, String uno, int cno) {
		super();
		this.lno = lno;
		this.lCount = lCount;
		this.uno = uno;
		this.cno = cno;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public int getlCount() {
		return lCount;
	}
	public void setlCount(int lCount) {
		this.lCount = lCount;
	}
	public String getUno() {
		return uno;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	@Override
	public String toString() {
		return "LikeVO [lno=" + lno + ", lCount=" + lCount + ", uno=" + uno + ", cno=" + cno + "]";
	}
	
	
}
