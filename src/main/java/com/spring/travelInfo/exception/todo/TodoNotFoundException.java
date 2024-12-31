package com.spring.travelInfo.exception.todo;

import lombok.*;
import org.springframework.http.HttpStatus;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @ToString @EqualsAndHashCode
public class TodoNotFoundException extends RuntimeException {

    private HttpStatus status;

    public TodoNotFoundException(String message, HttpStatus status) {
        super(message);
        this.status = status;
    }


}
