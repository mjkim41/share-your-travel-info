package com.spring.travelInfo.api;

import com.spring.travelInfo.dto.request.todo.TodoChangedStatusRequest;
import com.spring.travelInfo.dto.request.todo.TodoSaveRequest;
import com.spring.travelInfo.entity.Todo;
import com.spring.travelInfo.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/travel/todo")
public class TodoApiController {

    @Autowired
    private TodoService todoService;

    @GetMapping
    public ResponseEntity<?> getAllTodos() {
        List<Todo> todos = todoService.getTodos();
        return ResponseEntity
                .ok()
                .body(todos);
    }

    @PostMapping
    public ResponseEntity<?> saveNewTodo(@RequestBody TodoSaveRequest todo) {
        // save 요청
        Todo savedTodo = todoService.saveNewTodo(todo);

        return ResponseEntity
                .ok()
                .body(savedTodo);
    }

    // todo의 status를 바꿈(front에서 id 및 바뀌어야 할 status 상태 전달)
    @PutMapping("/{checkboxId}/changeStatus")
    public ResponseEntity<?> changeStatus(
            // 클라이언트에서 전달한 id, status를 객체로 변환
            @RequestBody TodoChangedStatusRequest todoChangedStatusRequest
    ) {
        // Service 객채에 위임
        Todo foundTodo = todoService.changeStatusById(todoChangedStatusRequest);

        return ResponseEntity.ok().body(foundTodo);
    }
}
