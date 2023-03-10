package com.gura.spring02.todo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring02.todo.dto.TodoDto;

@Repository
public class TodoDaoImpl implements TodoDao{

	@Autowired
	public SqlSession session;
	
	@Override
	public void insert(String content) {
		session.insert("todo.insert", content);		
	}

	@Override
	public void update(TodoDto dto) {
		session.update("todo.update", dto);
		
	}

	@Override
	public void delete(int num) {
		session.delete("todo.delete", num);
	}

	@Override
	public TodoDto getData(int num) {
		TodoDto dto = session.selectOne("todo.getData", num);
		return dto;
	}

	@Override
	public List<TodoDto> getList() {
		List<TodoDto> list = session.selectList("todo.getList");
		return list;
	}

}
