package com.spring.travelInfo.service;

import com.spring.travelInfo.entity.Todo;
import com.spring.travelInfo.repository.TodoRepository;
import lombok.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor @Getter @Setter @ToString @Builder
public class TodoService {

    private final TodoRepository todoRepository;

    public List<Todo> getTodos() {
        List<Todo> todos = todoRepository.findTodos();
        // response 객체로 변환
        return todos;
    }

    public Todo saveNewTodo(Todo todo) {
        // DB에 추가 요청
        int inserted = todoRepository.insertNewTodo(todo);

        // 성공적으로 insert 되었으면
        if (inserted >= 1) {
            // 클라이언트에게 반환하기 위해, DB에서 자동 생성된 id 값 가져온 후, db에서 조회
            Long id = todo.getId();
            return todoRepository.selectTodoById(id);
        } else {
            return null;
        }
    }
}
