package com.gura.boot07.api;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// dao에 붙여야하는 어노테이션
@Repository
public class TodoDaoImpl implements TodoDao{
	
	// 의존 객체 주입(DI) 받기
	@Autowired
	private SqlSession session;

	@Override
	public void addTodo(String content) {
		/*
		 * Mapper's namespace => todo
		 * sql's id => insert
		 * parameterType => TodoDto
		 */
		session.insert("todo.insert", content);
	}

	@Override
	public void deleteTodo(int num) {
		session.delete("todo.delete", num);
	}

	@Override
	public List<TodoDto> getList(TodoDto dto) {
		/*
		 * Mapper's namespace => todo
		 * sql's id => getList
		 * parameterType => 없음
		 * resultType => TodoDto
		 */
		return session.selectList("todo.getList", dto);
	}

	@Override
	public TodoDto getAddData() {
		return session.selectOne("todo.getAddData");
	}

	@Override
	public int getCount() {
		return session.selectOne("todo.getCount");
	}	
}
