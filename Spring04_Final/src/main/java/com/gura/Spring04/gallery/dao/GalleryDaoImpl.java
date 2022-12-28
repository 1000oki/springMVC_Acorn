package com.gura.Spring04.gallery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.Spring04.gallery.dto.GalleryDto;

@Repository
public class GalleryDaoImpl implements GalleryDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(GalleryDto dto) {
		session.insert("gallery.insert", dto);
	}

	@Override
	public GalleryDto getDetail(int num) {
		GalleryDto dto = session.selectOne("gallery.getDetail", num);
		return dto;
	}

	@Override
	public List<GalleryDto> getList() {
		List<GalleryDto> list = session.selectList("gallery.getList");
		return list;		
	}
	
}
