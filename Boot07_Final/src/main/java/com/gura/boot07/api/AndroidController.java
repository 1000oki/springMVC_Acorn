package com.gura.boot07.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AndroidController {

/*
 * 	JSON 문자열 응답하기
 * 
 * 	1. @ResponseBody 어노테이션
 *  2. Map 혹은 List 혹은 Dto를 리턴하면 자동으로 JSON 문자열로 변환되어서 응답된다.
 */

	@RequestMapping("/api/send")
	@ResponseBody
	public Map<String, Object> send(String msg){
		System.out.println(msg);
		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);
		map.put("response", "hello client");
		map.put("num", 1);

		return map;
	}
	
	@RequestMapping("/api/list")
	@ResponseBody
	public List<String> list(int pageNum){
		List<String> names = new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		return names;
	}
}
