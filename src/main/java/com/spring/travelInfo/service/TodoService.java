package com.spring.travelInfo.service;

import com.spring.travelInfo.dto.request.todo.TodoSaveRequest;
import com.spring.travelInfo.entity.Todo;
import com.spring.travelInfo.repository.TodoRepository;
import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor @Getter @Setter @ToString @Builder
public class TodoService {

    @Autowired
    private final TodoRepository todoRepository;

    public List<Todo> getTodos() {
        List<Todo> todos = todoRepository.findTodos();
        // response 객체로 변환
        return todos;
    }

    public Todo saveNewTodo(TodoSaveRequest todo) {
        // 클라이언트에게 받은 TodoSaveRequest를 Todo Entity로 변환
        Todo todoEntity = todo.toEntity();

        // DB에 추가 요청
        int inserted = todoRepository.insertNewTodo(todoEntity);

        // 성공적으로 insert 되었으면
        if (inserted >= 1) {
            // 클라이언트에게 반환하기 위해, DB에서 자동 생성된 id 값 가져온 후, db에서 조회
            Long id = todoEntity.getId();
            return todoRepository.selectTodoById(id);
        } else {
            return null;
        }
    }
}
