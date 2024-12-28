package com.spring.travelInfo.repository;

import com.spring.travelInfo.entity.Todo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Mapper
public interface TodoRepository {

    // 전체 목록 조회(xml)
    List<Todo> findTodos();

    int insertNewTodo(Todo todo);

    Todo selectTodoById(Long id);
}
