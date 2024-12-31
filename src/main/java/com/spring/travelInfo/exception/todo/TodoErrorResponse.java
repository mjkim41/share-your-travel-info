package com.spring.travelInfo.exception.todo;

import jakarta.servlet.http.HttpServletRequest;
import lombok.*;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDateTime;

@Slf4j
@Getter @Setter @ToString @EqualsAndHashCode
public class TodoErrorResponse {

    private LocalDateTime timestamp; // 에러가 발생한 시간
    private int status;  // 에러 상태코드
    private String error; // 에러의 이름
    private String message; // 에러의 구체적인 원인 메시지
    private String path; // 에러가 발생한 경로

    // 생성자 : 에러 터질 시 TodoExceptionHandler의 @ExceptionHandler(TOdoNotFoundException.class)가 실행되고,
    // 그 메소드에서 todonotfoundexception과 request 값을 받아옴
    public TodoErrorResponse(TodoNotFoundException todoNotFoundException, HttpServletRequest request) {
        this.timestamp = LocalDateTime.now();
        this.status = todoNotFoundException.getStatus().value();
        this.path = request.getRequestURI();
        this.message = todoNotFoundException.getMessage();
        this.error = todoNotFoundException.getStatus().getReasonPhrase();
    }
}
