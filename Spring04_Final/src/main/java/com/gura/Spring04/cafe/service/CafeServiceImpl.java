package com.gura.Spring04.cafe.service;

import java.beans.Encoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gura.Spring04.cafe.dao.CafeDao;
import com.gura.Spring04.cafe.dto.CafeDto;

@Service
public class CafeServiceImpl implements CafeService{
	
	@Autowired
	private CafeDao cafeDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		// 한 페이지에 몇 개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 5;
		// 하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT = 5;
		
		// 보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum = 1;
		
		// 페이지 번호가 파라미터로 전달되는지 읽어와 본다
		String strPageNum = request.getParameter("pageNum");
		// 만일 페이지 번호가 파라미터로 넘어온다면
		if(strPageNum != null){
			// 숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum = Integer.parseInt(strPageNum);
		}
		
		// 보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1+(pageNum - 1)*PAGE_ROW_COUNT;
		// 보여줄 페이지의 끝 ROWNUM	
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		
		if(keyword == null) {
			condition="";
			keyword="";
		}
		
		String encodedK = URLEncoder.encode(keyword);
		
		// CafeDto 객체를 생성해서
		CafeDto dto = new CafeDto();
		// 위에서 계산된 startRowNum, endRowNum을 담아서
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		if(!keyword.equals("")) {
			if(condition.equals("title_content")) {
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {
				dto.setWriter(keyword);
			}
		}
		
		// CafeDto를 인자로 전달해서 글 목록 얻어오기
		List<CafeDto> list = cafeDao.getList(dto);
		
		// 하단 시작 페이지 번호
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		// 하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT-1;
		// 전체 글의 갯수
		int totalRow = cafeDao.getCount(dto);
		// 전체 페이지의 갯수 구하기
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		// 끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되어있다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum = totalPageCount; // 보장해준다.
		}
		
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("keyword", keyword);
		request.setAttribute("condition", condition);
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveContent(CafeDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateContent(CafeDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getData(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

}
