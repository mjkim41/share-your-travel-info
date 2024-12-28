<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo List App</title>
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            width: 100%;
            height: 100vh;
            overflow: hidden;
            background: linear-gradient(135deg, #f5af19, #f12711);
        }

        ::selection {
            color: #fff;
            background: #f12711;
        }

        .wrapper {
            max-width: 705px;
            background: #fff;
            margin: 137px auto;
            border-radius: 7px;
            padding: 28px 0 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .task-input {
            position: relative;
            height: 52px;
            padding: 0 25px;
        }

        .task-input ion-icon {
            position: absolute;
            top: 50%;
            color: #999;
            font-size: 25px;
            transform: translate(17px, -50%);
        }

        .task-input input {
            height: 100%;
            width: 100%;
            outline: none;
            font-size: 18px;
            border-radius: 5px;
            padding: 0 20px 0 53px;
            border: 1px solid #999;
        }

        .task-input input:focus,
        .task-input input.active {
            padding-left: 52px;
            border: 2px solid #f12711;
        }

        .task-input input::placeholder {
            color: #bfbfbf;
        }

        .controls,
        li {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .controls {
            padding: 18px 25px;
            border-bottom: 1px solid #ccc;
        }

        .filters span {
            margin: 0 8px;
            font-size: 17px;
            color: #444444;
            cursor: pointer;
        }

        .filters span:first-child {
            margin-left: 0;
        }

        .filters span.active {
            color: #f12711;
        }

        .clear-btn {
            border: none;
            opacity: 0.6;
            outline: none;
            color: #fff;
            cursor: pointer;
            font-size: 13px;
            padding: 7px 13px;
            border-radius: 4px;
            letter-spacing: 0.3px;
            pointer-events: none;
            transition: transform 0.25s ease;
            background: linear-gradient(135deg, #f5af19 0%, #f12711 100%);
        }

        .clear-btn.active {
            opacity: 0.9;
            pointer-events: auto;
        }

        .clear-btn:active {
            transform: scale(0.93);
        }

        .task-box {
            margin-top: 20px;
            margin-right: 5px;
            padding: 0 20px 10px 25px;
        }

        .task-box.overflow {
            overflow-y: auto;
            max-height: 300px;
        }

        .task-box::-webkit-scrollbar {
            width: 5px;
        }

        .task-box::-webkit-scrollbar-track {
            background: #f12711;
            border-radius: 25px;
        }

        .task-box::-webkit-scrollbar-thumb {
            background: #e6e6e6;
            border-radius: 25px;
        }

        .task-box .task {
            list-style: none;
            font-size: 17px;
            margin-bottom: 18px;
            padding-bottom: 16px;
            align-items: flex-start;
            border-bottom: 1px solid #ccc;
        }

        .task-box .task:last-child {
            margin-bottom: 0;
            border-bottom: 0;
            padding-bottom: 0;
        }

        .task-box .task label {
            display: flex;
            align-items: flex-start;
        }

        .task label input {
            margin-top: 7px;
            accent-color: #f12711;
        }

        .task label p {
            user-select: none;
            margin-left: 12px;
            word-wrap: break-word;
        }

        .task label p.checked {
            text-decoration: line-through;
        }

        .task-box .settings {
            position: relative;
        }

        .settings :where(i, li) {
            cursor: pointer;
        }

        .settings .task-menu {
            position: absolute;
            right: -5px;
            bottom: -65px;
            padding: 5px 0;
            background: #fff;
            border-radius: 4px;
            transform: scale(0);
            transform-origin: top right;
            box-shadow: 0 0 6px rgba(0, 0, 0, 0.15);
            transition: transform 0.2s ease;
            z-index: 10;
        }

        .task-box .task:last-child .task-menu {
            bottom: 0;
            transform-origin: bottom right;
        }

        .task-box .task:first-child .task-menu {
            bottom: -65px;
            transform-origin: top right;
        }

        .task-menu.show {
            transform: scale(1);
        }

        .task-menu li {
            height: 25px;
            font-size: 16px;
            margin-bottom: 2px;
            padding: 17px 15px;
            cursor: pointer;
            justify-content: flex-start;
        }

        .task-menu li:last-child {
            margin-bottom: 0;
        }

        .settings li:hover {
            background: #f5f5f5;
        }

        .settings li i {
            padding-right: 8px;
        }

        @media (max-width: 400px) {
            body {
                padding: 0 10px;
            }

            .wrapper {
                padding: 20px 0;
            }

            .filters span {
                margin: 0 5px;
            }

            .task-input {
                padding: 0 20px;
            }

            .controls {
                padding: 18px 20px;
            }

            .task-box {
                margin-top: 20px;
                margin-right: 5px;
                padding: 0 15px 10px 20px;
            }

            .task label input {
                margin-top: 4px;
            }
        }


    </style>
</head>

<body>
<div class="wrapper">
    <div class="task-input">
        <ion-icon name="create-outline"></ion-icon>
        <input type="text" placeholder="Add a New Task + Enter" id="new-task-input">
    </div>
    <div class="controls">
        <div class="filters">
            <span class="active" id="all">All</span>
            <span id="pending">Pending</span>
            <span id="completed">Completed</span>
        </div>
        <button class="clear-btn">Clear All</button>
    </div>
    <ul class="task-box">
        <%-- 동적 생성 --%>
    </ul>
</div>

<script>


    // =============== db 관련 일반 함수 ================= //
    // # List<todos>를 받아서 반환 함수
    function renderAllTodos(todos) {
        // 태그를 담을 task-box의 기존 내용 초기화
        const $taskBox = document.querySelector('.task-box');
        $taskBox.innerHTML = '';
        // 각 todo에 들어가서
        todos.forEach(todo => {
            // html 태그 만들기
            $taskBox.innerHTML += `
             <li class="task">
                <label for="\${todo.id}">
                    <input type="checkbox" id="\${todo.id}" \${todo.completed ? 'checked' : ''}>
                    <p class="\${todo.isCompleted ? 'completed' : 'pending'}">\${todo.task}</p>
                </label>
                <div class="settings">
                    <i class="uil uil-ellipsis-h"></i>
                    <ul class="task-menu">
                        <li>
                            <i class="uil uil-pen"></i>Edit
                        </li>
                    </ul>
                </div>
            </li>
            `;
        });
    }


    // ===================  DB 관련 API 함수 ================= //
    // # 모든 todo 조회 fetch
    async function fetchAllTodos() {
        const response = await fetch("/api/travel/todo");
        const todos = await response.json();
        return todos;
    }

    // # new Todo 생성 API 요청
    async function saveNewTodo(task) {
        const response = await fetch("/api/travel/todo", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(task)
        });

        if (!response.ok) {
            throw new Error('Failed to save new todo');
        }

        return await response.json();
    }



    // # 모든 to do fetch 및 렌더링
    async function fetchAndRenderAllTodos() {
        // fetch 하여 json 받아오기
        const allTodos = await fetchAllTodos();
        // 화면에 렌더링 하기
        renderAllTodos(allTodos);
    }

    // =============== 이벤트 리스너 함수 ============= //
    // # 입력창에서 Enter 키 누르면 Todo DB에 등록되는 이벤트
    async function newTaskInputHandler(e) {
        // 엔터 키를 누르면
        if (e.key == 'Enter') {
            // 입력창에 입력한 내용이 있는지 확인(공백만 쓴 것도 필터링)
            const $newTaskInput = document.getElementById('new-task-input')
            let inputText = document.getElementById('new-task-input').value.trim();
            if (!inputText) {
                // 입력한 내용이 없으면, 내용 입력하라고 알리고 빠져나감
                $newTaskInput.placeholder = "Please write something🤦‍♂️ and then press Enter"
                return;
            }
            // 입력한 내용이 있으면, DB에 Save 후 재렌더링
            let promise = await saveNewTodo(inputText);

            inputText = ''; // 입력창에서 내용 없애주기
            await fetchAndRenderAllTodos();
        }
    }


    // ================= 이벤트 리스너 등록 =========== //
    // # 입력창에서 Enter 키 누르면 Todo DB에 등록되는 이벤트
    document.getElementById('new-task-input').addEventListener('keydown', newTaskInputHandler);

    // =============== 초기 실행 함수 ================== //
    fetchAndRenderAllTodos();
</script>
</body>
</html>