package com.gura.Spring04.gallery.dao;

import java.util.List;

import com.gura.Spring04.gallery.dto.GalleryDto;

public interface GalleryDao {
	public void insert(GalleryDto dto);
	public GalleryDto getDetail(int num);
	public List<GalleryDto> getList();
	public void delete(int num);
	public void update(GalleryDto dto);
}
