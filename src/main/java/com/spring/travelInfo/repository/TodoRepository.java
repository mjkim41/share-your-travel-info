package com.spring.travelInfo.repository;

import com.spring.travelInfo.entity.Todo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TodoRepository {

    // 전체 목록 조회(xml)
    List<Todo> findTodos();

    // todo 생성
    int insertNewTodo(Todo todo);

    Todo selectTodoById(Long id);

    // id로 todo의 is_completed 수정
    int updateIsCompletedById(Long id, boolean isCompleted);

    // is_completed(boolean)값으로 todo 조회
    List<Todo> selectTodoByIsCompleted(boolean isCompleted);

    // id로 todo에서 삭제
    int deleteSelectedTodoById(Long id);
}
