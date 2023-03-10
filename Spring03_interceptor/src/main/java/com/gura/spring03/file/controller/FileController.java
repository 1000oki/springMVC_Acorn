package com.gura.spring03.file.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring03.file.dto.FileDto;

/*
 *	[ Spring mvc 파일 업로드 처리 ]
 *	1. pom.xml에 commons-io, commons-fileupload가 dependency에 명시되어 있어야함.
 *	2. servlet-context.xml에 MultipartResolver bean 설정이 있어야함.
 *	3. MultipartFile 객체를 컨트롤러에서 받아서 사용하면 됨.
 */

@Controller
public class FileController {
	
	@RequestMapping("/file/insertform")
	public String uploadform() {
		
		return "file/insertform";
	}
	
	// FileDto에는 폼 전송된 title, myFile 정보가 들어있다.
	@RequestMapping("/file/upload2")
	public String upload2(FileDto dto, HttpServletRequest request) {
		// FileDto로부터 업로드된 파일의 정보를 담고 있는 MultipartFile 객체의 참조값 얻어내기
		MultipartFile myFile = dto.getMyFile();
		//원본 파일명
	    String orgFileName=myFile.getOriginalFilename();
	    //파일의 크기
	    long fileSize=myFile.getSize();
	      
	    // webapp/upload 폴더 까지의 실제 경로(서버의 파일시스템 상에서의 경로)
	    String realPath=request.getServletContext().getRealPath("/upload");
	    //저장할 파일의 상세 경로
	    String filePath=realPath+File.separator;
	    //디렉토리를 만들 파일 객체 생성
	    File upload=new File(filePath);
	    if(!upload.exists()) {//만일 디렉토리가 존재하지 않으면 
	       upload.mkdir(); //만들어 준다.
	     }
	    //저장할 파일 명을 구성한다.
	    String saveFileName=
	          System.currentTimeMillis()+orgFileName;
	    try {
	       //3. 임시폴더에 저장된 업로드된 파일을 원하는 곳에 원하는 이름으로 이동시키기(전송하기) 
	       myFile.transferTo(new File(filePath+saveFileName));
	       System.out.println(filePath+saveFileName);
	    }catch(Exception e) {
	       e.printStackTrace();
	    }

		return "file/upload";
	}
	
	@RequestMapping("/file/upload")
	public String upload(String title, MultipartFile myFile, HttpServletRequest request) {
		  //원본 파일명
	      String orgFileName=myFile.getOriginalFilename();
	      //파일의 크기
	      long fileSize=myFile.getSize();
	      
	      // webapp/upload 폴더 까지의 실제 경로(서버의 파일시스템 상에서의 경로)
	      String realPath=request.getServletContext().getRealPath("/upload");
	      //저장할 파일의 상세 경로
	      String filePath=realPath+File.separator;
	      //디렉토리를 만들 파일 객체 생성
	      File upload=new File(filePath);
	      if(!upload.exists()) {//만일 디렉토리가 존재하지 않으면 
	         upload.mkdir(); //만들어 준다.
	      }
	      //저장할 파일 명을 구성한다.
	      String saveFileName=
	            System.currentTimeMillis()+orgFileName;
	      try {
	         //3. 임시폴더에 저장된 업로드된 파일을 원하는 곳에 원하는 이름으로 이동시키기(전송하기) 
	         myFile.transferTo(new File(filePath+saveFileName));
	         System.out.println(filePath+saveFileName);
	      }catch(Exception e) {
	         e.printStackTrace();
	      }

		return "file/upload";
	}
}
