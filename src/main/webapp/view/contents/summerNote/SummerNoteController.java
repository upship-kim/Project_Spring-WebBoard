package sist.com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.FileNameMap;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import sist.com.app.dto.SummerNoteBean;
import sist.com.dao.SummerNoteDao;

@RestController
public class SummerNoteController {
	@Resource(name="summerNoteDao")
	private SummerNoteDao dao;
	
	@RequestMapping(value="pages/summerWrite.do")
	public String insertWrite(SummerNoteBean bean) {
		System.out.println("여기까지오나요?");
		dao.insertWrite(bean);
		
		return "pages/write";
	}
	@RequestMapping(value="/pages/fileUpload.do",produces="application/json; charset=utf8")
		@ResponseBody
		public String fileUpload(@RequestParam("file") MultipartFile multipartFile,HttpServletRequest request){
		System.out.println("사진 업로드");
		JsonObject jsonObject = new JsonObject();
		//String fileRoot="D:\\summernote_img\\"; 외부 경로 지정이 필요할 때
		//내부 경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot + "resources/fileupload/";
		System.out.println(fileRoot);
		
		String originalFileName = multipartFile.getOriginalFilename(); //오리지널 파일명
		String extension = originalFileName.substring(originalFileName.indexOf(".")); //파일 확장자
		String savedFileName= UUID.randomUUID() + extension; //저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "/web/resources/fileupload/"+savedFileName);
			//contextroot + resources + 저장할 내부 폴더명 + 저장될 파일명을 json에 추가
			jsonObject.addProperty("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "fail");
			e.printStackTrace();
		}
		String a= jsonObject.toString();
		System.out.println(a);
		return a;
	}
	@RequestMapping(value="/pages/fileDelete.do")
	public String fileDelete(@RequestParam("src")String src, HttpServletRequest request) {
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileName=contextRoot+src.substring(src.indexOf("resource"));
		System.out.println(fileName);
		File file= new File(fileName);
		try {
			System.out.println(file.delete());
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return "success";
	
	}
	
	
}
