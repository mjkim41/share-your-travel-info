package com.spring.travelInfo.dto.request.todo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.spring.travelInfo.entity.Todo;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TodoChangedStatusRequest {

    // @JsonProperty : Jackson Library의 어노테이션으로, 클라이언트가 보낸 json key랑 back object의 필드명이 다를 때 사용
    @JsonProperty("id")
    private Long id;

    @JsonProperty("isCompleted")
    private boolean isCompleted;

//
//    // 엔터티로 변환하는 메소드
//    public Todo toEntity() {
//        return Todo.builder()
//                .isCompleted(false)
////                .task(this.task) 클라이언트가 준 내용만 전달
//                .build();
//    }
}
