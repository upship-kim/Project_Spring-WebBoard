package sbkim.com.dao;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import sbkim.com.vo.BoardVO;
import sbkim.com.vo.LikeVO;
import sbkim.com.vo.UserVO;

public class BoardDao extends SqlSessionDaoSupport {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDao.class);

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	//모든 회원 조회
	public UserVO selectUser() {
		System.out.println("dao");
		return getSqlSession().selectOne("selectUser");
	}
	
	//중복 아이디 찾기 
	public String selectId(String id) {
		System.out.println("dao: "+id);
		return getSqlSession().selectOne("selectId", id);
	}
	
	//중복 닉네임 찾기
	public String selectName(String name) {
		System.out.println("dao: "+name);
		return getSqlSession().selectOne("selectName", name);
	}
	
	//회원가입
	public void insertUser(UserVO vo) {
		System.out.println("dao: "+vo);
		getSqlSession().insert("insertUser", vo);
	}
	
	//로그인
	public boolean selectIdForLogin(String id, String pw){
		System.out.println("dao:"+pw);
		String resultPw = this.getSqlSession().selectOne("selectIdForLogin", id);
		System.out.println(resultPw);
		return resultPw!=null&& resultPw.equals(pw) ? true:false;
	}
	
	//board-select 
	public List<BoardVO> selectBoard(String sort){
		System.out.println("dao: selectBaord");
		System.out.println("sort:"+sort);
		HashMap<String, String>map1 = new HashMap<String, String>();
		map1.put("sort", sort);
		System.out.println("이거:"+map1.get("sort"));
		return this.getSqlSession().selectList("selectBoard", map1);
	}
	
	//board - write
	public void writeContents(BoardVO vo) {
			this.getSqlSession().insert("writeContents", vo);
	}
	
	//board - modify
	public void modifyInfo(BoardVO vo) {
		System.out.println("dao update: "+vo);
			this.getSqlSession().update("modifyInfo", vo);
	}
	
	//fileUpload
	public void fileUpload(HashMap<String, Object> map) {
		System.out.println("dao fileUpload: "+map);
		this.getSqlSession().update("fileUpload", map);
	}
	
	//infoBoard - read
	public BoardVO infoBoard(int cno) {
		System.out.println("dao: "+cno);
		return this.getSqlSession().selectOne("infoBoard", cno);
	}
	
	//infoBoard - delete
	public void infoDelete(int cno) {
		System.out.println("dao del: "+cno);
		this.getSqlSession().delete("likeDel", cno);
		this.getSqlSession().delete("boardDel", cno);
	}
	
	
	//plus viewCount 
	public void plusView(int cno) {
		this.getSqlSession().update("plusView", cno);
	}
	
	//like - state
	public int likeState(int cno, String id) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("id", id);
		System.out.println("이건머 "+this.getSqlSession().selectOne("likeState", map));
			if(this.getSqlSession().selectOne("likeState", map)==null) {
				return 0;
			}else {
				return this.getSqlSession().selectOne("likeState", map);
			}
	}
	
	//like - select
	public String likeSelect(LikeVO vo) {
		System.out.println("dao like:"+this.getSqlSession().selectOne("likeSelect", vo));
		//String state = (String)this.getSqlSession().selectOne("likeSelect", vo);
		if((Integer)this.getSqlSession().selectOne("likeSelect", vo)==null){
			return "new";
		} 
		if((Integer)this.getSqlSession().selectOne("likeSelect", vo)>0) {
			return "update";
		}
		else{
			return "no";
		}
	}
	
	//like - add
	public boolean likeAdd(LikeVO vo) {
		if(getSqlSession().selectOne("likeSelect", vo)==null){
			this.getSqlSession().insert("likeAdd", vo);
			return true;
		}else {
			return false;
		}
	}
	
	//like - Re add
	public void likeReAdd(LikeVO vo) {
		if(this.getSqlSession().selectOne("likeReSelect", vo).equals("0")) {
			this.getSqlSession().update("likeReAdd", vo);
		}else {
			System.out.println("reAdd error"+vo);
		}
	}
	
	//like - cancle
	public void likeCancle(LikeVO vo) {
			this.getSqlSession().update("likeCancle", vo);
		
	}
	
	//search - search
	public List<BoardVO> search(HashMap<String, String>map) {
		System.out.println("dao map: "+map);
		return this.getSqlSession().selectList("search", map);
	}

	
}