package sbkim.com.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import sbkim.com.dao.BoardDao;
import sbkim.com.vo.LikeVO;
import sbkim.com.vo.ReplyVO;

@RestController
public class JsonController {

	@Resource(name="boardDao")
	private BoardDao dao;
	
	
	//join - 중복 아이디 체크 
	@RequestMapping(value="selectId.do")
	public String selectId(@RequestParam(value="id")String id) {
		System.out.println("Json 컨트롤러 찍혔다:"+id);
		String result= dao.selectId(id);
		System.out.println("결과는:"+result);
		if(result==null) {
			return "okay";
		}
		else {
			return "no";
		}
	}
	
	//join - 중복 닉네임 체크 
	@RequestMapping(value="selectName.do")
	public String selectName(@RequestParam(value="name")String name) {
		System.out.println("Json 컨트롤러 찍혔다:"+name);
		String result= dao.selectId(name);
		System.out.println("결과는:"+result);
		if(result==null) {
			return "okay";
		}
		else {
			return "no";
		}
	}
	
	//like - 기존 좋아요 기록 확인하기 
	@RequestMapping(value="likeSelect.do")
	public String likeSelect(LikeVO vo) {
		if(dao.likeSelect(vo).equals("new")) {
			return "okay";
		}else if(dao.likeSelect(vo).equals("update")){
			return "update";
		}else {
			return "no";
		}
	}
	
	//like - 좋아요 추가
	@RequestMapping(value="likeFun.do")
	public String likeFunction(LikeVO vo) {
		System.out.println("vo:"+vo);
		if(dao.likeAdd(vo)==true) {
			return "okay";
		} else {
			return "error";
		}
	}
	
	//like - 좋아요 재 추가
	@RequestMapping(value="likeReFun.do")
	public String likeReFunction(LikeVO vo) {
		System.out.println("vo:"+vo);
		dao.likeReAdd(vo);
		return "okay" ;
		
	}
	
	//like - 좋아요 취소
	@RequestMapping(value="likeCancle.do")
	public String likeCancle(LikeVO vo) {
		dao.likeCancle(vo);
		return "success";
		
	}
	
	//reply - 댓글 조회
	@RequestMapping(value="replySelect.do")
	public List<ReplyVO> replySelect(int cno){
		System.out.println(cno);
		return dao.replySelect(cno);
	}

	//reply - 댓글 등록
	@RequestMapping(value="reply.do")
	public List<ReplyVO> replyInsert(ReplyVO vo){
		System.out.println("json con: "+vo);
		return dao.replyInsert(vo);
	}
	
	//reply - 댓글 삭제
	@RequestMapping(value="delReply.do")
	public List<ReplyVO> delReply(int rno, int cno) {
		System.out.println("rno: "+rno);
		System.out.println("cno: "+cno);
		dao.replyDelete(rno);
		return dao.replySelect(cno);
		
	}
	
	
	

}
