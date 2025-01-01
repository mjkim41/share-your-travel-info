package com.spring.travelInfo.entity;

import lombok.*;

@Setter @Getter @EqualsAndHashCode @ToString
@Builder @AllArgsConstructor @NoArgsConstructor
public class Todo {

    private Long id;
    private Boolean isCompleted;
    private String task;
    private int priority;

}
