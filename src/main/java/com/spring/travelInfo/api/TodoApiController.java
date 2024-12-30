package com.spring.travelInfo.api;

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
}
