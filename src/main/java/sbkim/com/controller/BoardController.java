package sbkim.com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sbkim.com.dao.BoardDao;
import sbkim.com.vo.BoardVO;
import sbkim.com.vo.PageVO;
import sbkim.com.vo.ReplyVO;
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
	public String login(String id, String pw, String saveId, Model model, HttpSession session, 
						HttpServletRequest rq, HttpServletResponse rs) {
		//rq.setAttribute(id, id);
		//System.out.println(dao.selectIdForLogin(id, pw));
		//System.out.println("아이디저장"+saveId);
		if(dao.selectIdForLogin(id, pw)) {
			Cookie cookie = new Cookie("id", id);
			session.setAttribute("id", id.toLowerCase());
			session.setMaxInactiveInterval(60*60);
			if(saveId!=null) {
				cookie.setValue(id);
				cookie.setMaxAge(60*60);	//1시간 동안 저장 
				rs.addCookie(cookie);
				System.out.println("cookie name: "+cookie.getName());
				System.out.println("cookie value: "+cookie.getValue());
				
			}else {
				cookie.setMaxAge(0);
				rs.addCookie(cookie);
			}
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
		System.out.println("logout: "+id);
		session.removeAttribute("id");
		return "view/contents/main";
	}
	
	//Board - 게시물 출력
	@RequestMapping(value="select.do")
	public String selectBoard(Model model, @RequestParam(value="category")String category,
				@RequestParam(value="sort")String sort, String search,
				@RequestParam(value="page", required=false, defaultValue="1")int page,
				@RequestParam(value="range", required=false, defaultValue="1")int range) {
		
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("sort", sort);
		map.put("category", category);
		map.put("search", search);
		
		int listCnt = dao.getListCnt(map);		//전체 게시물 개수 
		System.out.println("listCntL: "+ listCnt);
		
		PageVO pageVo = new PageVO();
		pageVo.pageInfo(page, range, listCnt);
		map.put("pageVo", pageVo);

		
		model.addAttribute("category", category);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("sort", sort);
		model.addAttribute("search", search);
		model.addAttribute("list", dao.selectBoard(map));		//게시판 목록 출력
		return "view/contents/publicBoard";
	}
	
	//summerWrite - 글쓰기
	@RequestMapping(value="boardWrite.do")
	public String writeContents(BoardVO vo, @RequestParam(value="file")MultipartFile file) {
		/*requestParam 으로 받는 file 은 input의 file 명과 다르게 해야한다! (MultipartFile 객체를 받기 위한 이름이기때문) */
		String loc="C:\\Sangbae\\6.Project\\TeamProject\\board\\src\\main\\webapp\\resources\\fileupload\\";
		FileOutputStream fos = null; 
		String originFileName = file.getOriginalFilename();
		System.out.println("file 제목: "+file.getOriginalFilename());
		if(originFileName.length()>0) {
			try {
				fos = new FileOutputStream(new File(loc+originFileName));
				fos.write(file.getBytes());
				vo.setFileName(originFileName);
			} catch (Exception e) {
				e.printStackTrace();
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
		System.out.println("filelength:"+originFileName.length());
		System.out.println("fileSize:"+file.getSize());
		System.out.println("fileContentsType:"+file.getContentType());
		dao.writeContents(vo);
		return "view/contents/main";
	}
	
	//summerWrite - 게시물 내용 수정
	@RequestMapping(value="modifyContents.do")
	public String updateContents(BoardVO vo, @RequestParam(value="file")MultipartFile file) {
		System.out.println("form1 :"+vo);
		String loc="C:\\Sangbae\\6.Project\\TeamProject\\board\\src\\main\\webapp\\resources\\fileupload\\";
		FileOutputStream fos = null; 
		String originFileName = file.getOriginalFilename();
		System.out.println("file 제목: "+file.getOriginalFilename());
		if(originFileName.length()>0) {
			try {
				fos = new FileOutputStream(new File(loc+originFileName));
				fos.write(file.getBytes());
				vo.setFileName(originFileName);
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			} finally {
				try {
					fos.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}else {
			vo.setFileName(null);
		}
		
		dao.modifyInfo(vo);
		System.out.println("form2 :"+vo);
		return "view/contents/main";
	}
	
	
	//contentsModify - 게시물 수정을 위한 기존 데이터 출력 
	@RequestMapping(value="contentsModify.do")
	public String infoModify(@RequestParam(value="cno", required=false)int cno, Model model) {
		model.addAttribute("modify", dao.infoBoard(cno));
		return "view/contents/boardWrite"; 
	}
	
	//contentsDelete - 게시물 삭제 
	@RequestMapping(value="contentsDelete.do")
	public String infoDelete(@RequestParam(value="cno", required=false)int cno) {
		dao.replyTotalDelete(cno);
		dao.infoDelete(cno);
		return "view/contents/main";
	}
	
	//infoBoard - 게시물 확인 & 조회수 증가 
	@RequestMapping(value="infoBoard.do")
	public String infoBoard(@RequestParam(value="cno", required=false) int cno, Model model, HttpSession session,
							String category, String sort, String search, int page, int range ) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("sort", sort);
		map.put("search", search);
		map.put("page", page);
		map.put("range", range);
		System.out.println("게시물 확인 및 조회수 증가:"+cno);
		String id=(String)session.getAttribute("id");
		dao.plusView(cno);	//조회수 증가 
		model.addAttribute("likeState", dao.likeState(cno, id));	//좋아요 상태 체크
		model.addAttribute("info", dao.infoBoard(cno));
		model.addAttribute("map", map);
		return "view/contents/infoBoard";
	}
	
	
}