package com.spring.travelInfo.service;

import com.spring.travelInfo.dto.request.todo.TodoChangedStatusRequest;
import com.spring.travelInfo.dto.request.todo.TodoSaveRequest;
import com.spring.travelInfo.entity.Todo;
import com.spring.travelInfo.exception.todo.TodoNotFoundException;
import com.spring.travelInfo.repository.TodoRepository;
import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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


    // # id로 조회
    public Todo getSelectedTodoById(Long id) {
        return todoRepository.selectTodoById(id);
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


    public String changeStatusById(Long id, Boolean isCompleted) {
        // 1. 먼저 apicontroller에서는 dto 아닌 결제로
        return ("id" + id + "isCompleted" + isCompleted);
    }

    // 해당 id를 가진 Todo를 DB에서 찾아, isCompleted 여부를 변경하는 함수
    public Todo changeStatusById(TodoChangedStatusRequest todoChangedStatusRequest) {
        //  1. 먼저 apicontroller에서는 entity 아닌 dto로 보냈으므로,
        //      dto의 id로 entity를 조회해야 함
        Todo foundTodo = todoRepository.selectTodoById(todoChangedStatusRequest.getId());

        // 2. 조회된 객체가 없으면, custom exception을 발생시켜 준다.
        //      -> custom exception이 발생하면 spring 을 사용하여 todoexceptionhandler에서 처리해준다.
        if (foundTodo == null) {
            throw new TodoNotFoundException("해당 id를 가진 todo가 없습니다", HttpStatus.BAD_REQUEST);
        }

        // 3. 조회딘 db가 있으면, db의 id를 주면서 Repository에 isCompleted값 바꿔달라고 요청한다.
        todoRepository.updateIsCompletedById(foundTodo.getId(), todoChangedStatusRequest.isCompleted());
        // 4. !! todo 객체의 값도 바꿔준다.
        foundTodo.setIsCompleted(todoChangedStatusRequest.isCompleted());
        // 바뀐 Todo 내용을 front에 보내준다.
        return  todoRepository.selectTodoById(todoChangedStatusRequest.getId());
    }

    /**
     * 완로여부로 필터링 하여 todos를 반환하는 함수
     *
     * @Param : is_completed 값(true or false)
     */
    public List<Todo> getTodosByIsCompleted(boolean isCompleted) {
        // repository에 위임
       return todoRepository.selectTodoByIsCompleted(isCompleted);
    }
}
