package sbkim.com.vo;

public class ReplyVO {
	
	private int rno;
	private String rContents;
	private String rRegdate;
	private int cno;
	private String uno;
	
	public ReplyVO() {
		super();
	}

	public ReplyVO(int rno, String rContents, String rRegdate, int cno, String uno) {
		super();
		this.rno = rno;
		this.rContents = rContents;
		this.rRegdate = rRegdate;
		this.cno = cno;
		this.uno = uno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getrContents() {
		return rContents;
	}

	public void setrContents(String rContents) {
		this.rContents = rContents;
	}

	public String getrRegdate() {
		return rRegdate;
	}

	public void setrRegdate(String rRegdate) {
		this.rRegdate = rRegdate;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getUno() {
		return uno;
	}

	public void setUno(String uno) {
		this.uno = uno;
	}

	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", rContents=" + rContents + ", rRegdate=" + rRegdate + ", cno=" + cno + ", uno="
				+ uno + "]";
	}
	
	
	
	
	
}
