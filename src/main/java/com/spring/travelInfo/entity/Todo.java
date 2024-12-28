package com.spring.travelInfo.entity;

import lombok.*;
import org.apache.ibatis.annotations.Mapper;

@Getter @Setter @EqualsAndHashCode(of="id")
@ToString @Builder @AllArgsConstructor @NoArgsConstructor

@Mapper
public class Todo {

    private Long id;
    @Getter @Setter
    private Boolean isCompleted;
    private String task;

    public Boolean getCompleted() {
        return isCompleted;
    }

    public Todo(String task) {
        this.task = task;
        this.isCompleted = false;
    }


}
