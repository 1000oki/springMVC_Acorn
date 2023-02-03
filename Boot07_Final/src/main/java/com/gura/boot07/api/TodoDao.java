package com.gura.boot07.api;

import java.util.List;

import org.springframework.stereotype.Component;

public interface TodoDao {
	public void addTodo(String content);
	public void deleteTodo(int num);
	public List<TodoDto> getList(TodoDto dto);
	public int getCount();
	public TodoDto getAddData();
}
