package sbkim.com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import oracle.jdbc.util.Login;
import sbkim.com.dao.BoardDao;
import sbkim.com.vo.BoardVO;
import sbkim.com.vo.UserVO;

@Controller
public class BoardController {

	@Resource(name="boardDao")
	private BoardDao dao;
	
	
	//아래 부터 시작 
	/*@RequestMapping(value="select.do")
	public String select(Model model) {
		System.out.println("컨트롤러 찍혔다");
		model.addAttribute("list", dao.selectUser());
		System.out.println(model);
		return "view/contents/privateBoard";
	}*/
	
	//회원가입
	@RequestMapping(value="insertUser.do")
	public String select(UserVO vo) {
		System.out.println("컨트롤러 찍혔다:인서트");
		System.out.println("vo:"+vo);
		dao.insertUser(vo);
		return "view/contents/login";
	}
	
	//로그인
	@RequestMapping(value="login.do")
	public String login(String id, String pw, Model model, HttpSession session) {
		System.out.println(dao.selectIdForLogin(id, pw));
		if(dao.selectIdForLogin(id, pw)) {
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(60*60);
			model.addAttribute("id", session.getAttribute("id"));
			
			return "view/contents/main";
		}else {
			model.addAttribute("state", "fail");
			return "view/contents/login";
		}
	}
	
	//로그아웃
	@RequestMapping(value="logout.do")
	public String logout(String id, Model model, HttpSession session) {
		System.out.println(id);
		session.removeAttribute("id");
		return "view/contents/main";
	}
	
	//PublicBoard - 게시물 출력
	@RequestMapping(value="select.do")
	public String selectBoard(Model model) {
		System.out.println(dao.selectBoard());
		/*List<BoardVO>list = new ArrayList<BoardVO>(); */
		model.addAttribute("list", dao.selectBoard());
		return "view/contents/publicBoard";
	}
	
	//summerWrite - 글쓰기
	@RequestMapping(value="summerWrite.do")
	public String writeContents(BoardVO vo) {
		System.out.println("form:"+vo);
		dao.writeContents(vo);
		return "view/contents/main";
	}
	
	//infoBoard - 게시물 확인 & 조회수 증가 
	@RequestMapping(value="infoBoard.do")
	public String infoBoard(@RequestParam(value="cno", required=false) int cno, Model model, HttpSession session) {
		System.out.println(cno);
		String id=(String)session.getAttribute("id");
		dao.plusView(cno);	//조회수 증가 
		model.addAttribute("likeState", dao.likeState(cno, id));	//좋아요 상태 체크
		model.addAttribute("info", dao.infoBoard(cno));
		return "view/contents/infoBoard";
	}
}
