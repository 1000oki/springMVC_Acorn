package com.gura.Spring04.gallery.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gura.Spring04.gallery.dto.GalleryDto;
import com.gura.Spring04.gallery.service.GalleryService;

@Controller
public class GalleryController {
	
	@Autowired
	private GalleryService service;
	
	@RequestMapping("/gallery/list")
	public String list(HttpServletRequest request) {
		service.getList(request);
		return "gallery/list";
	}
	
	@RequestMapping("/gallery/insertform")
	public String insertform() {
		return "gallery/insertform";
	}
	
	@RequestMapping("/gallery/insert")
	public String insert(GalleryDto dto, HttpSession session) {
		dto.setWriter((String)session.getAttribute("id"));
		service.saveGallery(dto);
		return "gallery/insert";
	}
	
	@ResponseBody
	@RequestMapping(value="/gallery/image_upload", method = RequestMethod.POST)
	public Map<String, Object> profileUpload(HttpServletRequest request, MultipartFile image){
		return service.saveImage(request, image);
	}
	
}
