package com.gura.spring03.file.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileDto {
	private int num;
	private String title;
	private String orgFilName;
	private String saveFileName;
	// 업로드된 파일의 정보를 담는 필드 추가 ***
	private MultipartFile myFile; // <input type="file" name="myFile"> name 속성의 value와 일치시켜야함...
	
	public FileDto() {}

	public FileDto(int num, String title, String orgFilName, String saveFileName, MultipartFile myFile) {
		super();
		this.num = num;
		this.title = title;
		this.orgFilName = orgFilName;
		this.saveFileName = saveFileName;
		this.myFile = myFile;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOrgFilName() {
		return orgFilName;
	}

	public void setOrgFilName(String orgFilName) {
		this.orgFilName = orgFilName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public MultipartFile getMyFile() {
		return myFile;
	}

	public void setMyFile(MultipartFile myFile) {
		this.myFile = myFile;
	}
	
	
}
