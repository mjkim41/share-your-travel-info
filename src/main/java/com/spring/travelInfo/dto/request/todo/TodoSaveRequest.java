package com.spring.travelInfo.dto.request.todo;

import com.spring.travelInfo.entity.Todo;
import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
@Builder
public class TodoSaveRequest {

    private String task;

    // 엔터티로 변환하는 메소드
    public Todo toEntity() {
        return Todo.builder()
                .isCompleted(false)
                .task(this.task)
                .build();
    }

}
