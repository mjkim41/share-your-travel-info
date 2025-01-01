package com.spring.travelInfo.exception.todo;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import java.time.LocalDateTime;

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
        ErrorResponse errorResponse = ErrorResponse
                .builder()
                .timestamp(LocalDateTime.now())
                .status(todoNotFoundException.getStatus().value())
                .path(request.getRequestURI())
                .message(todoNotFoundException.getMessage())
                .build();

        return ResponseEntity.badRequest().body(errorResponse);

    }

    // 클라이언트에서 db조회에 사용할 sql의 인자를 잘못 보냈을 때
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public ResponseEntity<?> handleMethodArgumentNotValidException(
            MethodArgumentTypeMismatchException e, HttpServletRequest request
    ) {
        // 백단에도 오류 메시지 보내기
        log.warn("{} at {}", e, request.getRequestURI());

        // 프론트에 errorResponse 객체를 만들어서 전해준다.
        ErrorResponse errorResponse = ErrorResponse
                .builder()
                .timestamp(LocalDateTime.now())
                .status(HttpStatus.BAD_REQUEST.value())
                .path(request.getRequestURI())
                .message(e.getMessage())
                .build();

        // 프론트에 메시지 전달
        return ResponseEntity.badRequest().body(errorResponse);

    }


}
