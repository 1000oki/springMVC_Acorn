package com.gura.Spring04.gallery.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.gura.Spring04.gallery.dto.GalleryDto;

public interface GalleryService {
	public void saveGallery(GalleryDto dto);
	public Map<String, Object> saveImage(HttpServletRequest request, MultipartFile mFile);
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
}
