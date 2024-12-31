package com.spring.travelInfo.exception.todo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

// @ControllerAdvice + @ExceptionHandler(exception클래스명.class) :
// exception 발생 시 @exceptionhandler에 매치된 코드 구현

@ControllerAdvice
@Slf4j
public class TodoExceptionHandler {

    // 해당 아이디를 가진 todo가 db에 존재하지 않을 때
    @ExceptionHandler(TodoNotFoundException.class)
    public ResponseEntity<?> handleTodoNotFoundException(
            // 커스텀 exception.에러 터지면 자동 생성됨
            TodoNotFoundException todoNotFoundException,
            // 에러 터진 url 가져오기 위함임
            HttpServletRequest request
    ) {
        // back에서도 오류 찍어준다.
        log.info(" {}, {}", todoNotFoundException.getStatus(), todoNotFoundException.getMessage());

        // 프론트에 errorResponse 객체를 만들어서 전해준다.
        TodoErrorResponse errorResponse = new TodoErrorResponse(todoNotFoundException, request);
        return ResponseEntity.badRequest().body(errorResponse);

    }


}
