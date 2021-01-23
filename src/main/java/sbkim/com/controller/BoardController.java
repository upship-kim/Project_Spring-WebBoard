package sbkim.com.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String selectBoard(Model model, @RequestParam(value="sort")String sort) {
		System.out.println(dao.selectBoard(sort));
		model.addAttribute("list", dao.selectBoard(sort));		//게시판 목록 출력
		//List<BoardVO>cnoList ; 								//for like Count Param
		//cnoList=dao.selectBoard();
		//dao.selectLikeCount(cnoList);		//조회수 출력
		return "view/contents/publicBoard";
	}
	
	//summerWrite - 글쓰기
	@RequestMapping(value="boardWrite.do")
	public String writeContents(BoardVO vo, @RequestParam(value="file")MultipartFile file) {
		/*requestParam 으로 받는 file 은 input의 file 명과 다르게 해야한다! (MultipartFile 객체를 받기 위한 이름이기때문) */
		String loc="C:\\Sangbae\\6.Project\\TeamProject\\board\\src\\main\\webapp\\resources\\fileupload\\";
		FileOutputStream fos = null; 
		String originFileName = file.getOriginalFilename();
		
		if(originFileName.length()>0) {
			try {
				fos = new FileOutputStream(new File(loc+originFileName));
				fos.write(file.getBytes());
				vo.setFileName(originFileName);
			} catch (Exception e) {
				// TODO: handle exception
			} finally {
				try {
					fos.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
		
		System.out.println("form:"+vo);
		System.out.println("fileName:"+originFileName);
		System.out.println("fileSize:"+file.getSize());
		System.out.println("fileContentsType:"+file.getContentType());
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
