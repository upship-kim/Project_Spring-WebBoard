package sbkim.com.vo;

public class UserVO {

	private String id;
	private String name;
	private String pw;
	private String email;
	private String hp;
	
	
	public UserVO() {
		super();
	}


	public UserVO(String id, String name, String pw, String email, String hp) {
		super();
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.email = email;
		this.hp = hp;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getHp() {
		return hp;
	}


	public void setHp(String hp) {
		this.hp = hp;
	}


	@Override
	public String toString() {
		return "UserVO [id=" + id + ", name=" + name + ", pw=" + pw + ", email=" + email + ", hp=" + hp + "]";
	}

	
	
}
