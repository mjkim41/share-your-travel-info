<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>작업 상세보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
        }
        .task-details {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .task-details h2 {
            margin-top: 0;
        }
        .back-button {
            display: block;
            margin-top: 20px;
            text-align: center;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>작업 상세보기</h1>

    <div class="task-details">
        <%
            String taskId = request.getParameter("id");
            Task task = taskService.getTaskById(taskId);  // taskService는 Task를 가져오는 서비스 클래스
        %>
        <h2>${task.title}</h2>
        <p><strong>상태:</strong> ${task.completed ? '완료' : '미완료'}</p>
        <p><strong>내용:</strong> ${task.description}</p>
        <p><strong>작성일:</strong> ${task.creationDate}</p>

        <!-- 작업 목록으로 돌아가는 버튼 -->
        <a href="todoList.jsp" class="back-button">목록으로 돌아가기</a>
    </div>
</div>

</body>
</html>
