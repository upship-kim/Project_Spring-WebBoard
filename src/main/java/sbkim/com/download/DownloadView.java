package sbkim.com.download;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView{

	
	public DownloadView() {
		this.setContentType("application/download;utf-8");
	}
	
	
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType(this.getContentType());
		System.out.println(model);
	      File file = (File) model.get("action");
	      response.setContentLength((int) file.length());

	      String userAgent = request.getHeader("User-Agent");

	      String filename = "";
	      filename = new String(file.getName().getBytes());
	      response.setHeader("Content-Disposition", "attachment;fileName=\"" + filename+"\";");
	      response.setHeader("Content-Transfer-Encoding", "binary");

	      OutputStream out = response.getOutputStream();
	      FileInputStream fis = null;
	      try {
	         fis = new FileInputStream(file);
	         FileCopyUtils.copy(fis, out);
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      }
	      out.flush();
		
	}
	
	
	

}
