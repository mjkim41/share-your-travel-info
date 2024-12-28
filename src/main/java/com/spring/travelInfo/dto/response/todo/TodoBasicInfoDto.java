package com.spring.travelInfo.dto.response.todo;

import com.spring.travelInfo.entity.Todo;
import lombok.*;

@Getter @Setter @ToString @Builder @AllArgsConstructor
@NoArgsConstructor @EqualsAndHashCode(of="id")
public class TodoBasicInfoDto {

    private Long id;
    private String task;

    public TodoBasicInfoDto(Todo todo) {
        this.id = todo.getId();
        this.task = todo.getTask();
    }
}
