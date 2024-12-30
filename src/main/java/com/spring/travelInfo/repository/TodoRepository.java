package com.spring.travelInfo.repository;

import com.spring.travelInfo.entity.Todo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TodoRepository {

    // 전체 목록 조회(xml)
    List<Todo> findTodos();

    int insertNewTodo(Todo todo);

    Todo selectTodoById(Long id);
}
