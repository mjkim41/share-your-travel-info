package com.spring.travelInfo.api;

import com.spring.travelInfo.dto.response.todo.TodoBasicInfoDto;
import com.spring.travelInfo.entity.Todo;
import com.spring.travelInfo.repository.TodoRepository;
import com.spring.travelInfo.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public ResponseEntity<?> saveNewTodo(@RequestBody Todo todo) {
        // save
        Todo newTodo = todoService.saveNewTodo(todo);
        return ResponseEntity
                .ok()
                .body(newTodo);
    }
}
