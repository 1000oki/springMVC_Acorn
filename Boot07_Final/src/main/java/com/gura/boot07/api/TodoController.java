package com.gura.boot07.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/*
 * spring 5.0 부터 추가된 RestController 어노테이션을 붙이면
 * 
 * json 문자열을 응답할 때 @ResponseBody를 생랼할 수 있다.
 */
@RestController
public class TodoController {
	
	@Autowired 
	private TodoDao dao;
	
	// 할일 추가 요청 처리
//	@PostMapping("/api/todo/insert")
//	public Map<String, Object> insert(){
//		return null;
//	}
	
	// 할일 목록 요청 처리
//	@GetMapping("/api/todo/list")
//	public List<Object> list(){
//		return null;
//	}
	
	// 할일 목록 요청 처리
	@RequestMapping("/api/todo/list")
	public Map<String, Object> list(String num){
//		List<TodoDto> list = dao.getList();
//		return list;
		
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=12;
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=num;
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		TodoDto dto = new TodoDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		//글 목록 얻어오기 
		List<TodoDto> list=dao.getList(dto);
		//전체글의 갯수
		int totalRow=dao.getCount();
		Boolean isNext = true;

		//전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	
		if(pageNum >= totalPageCount){
			isNext = false;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("isNext", isNext);
		map.put("result", list);
		return map;
		
	}
	
	// 추가된 할일 요청 처리
	@RequestMapping("/api/todo/getAddData")
	public TodoDto getAddData(){
		TodoDto dto = dao.getAddData();
		return dto;
	}
	
	// 할일 삭제 처리
	@RequestMapping("/api/todo/delete")
	public Map<String, Object> delete(int num){
		dao.deleteTodo(num);
		
		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
	
	// 할일 추가 처리
	@RequestMapping("/api/todo/insert")
	public Map<String, Object> insert(String content){		
		dao.addTodo(content);
		
		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
}
