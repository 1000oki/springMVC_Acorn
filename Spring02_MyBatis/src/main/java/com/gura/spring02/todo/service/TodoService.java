package com.gura.spring02.todo.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring02.todo.dto.TodoDto;

public interface TodoService {
	public void addTodo(String content);
	public void updateTodo(TodoDto dto);
	public void deleteTodo(int num);
	public void getTodo(int num, ModelAndView mView);
	public void getListTodo(ModelAndView mView);	
}
