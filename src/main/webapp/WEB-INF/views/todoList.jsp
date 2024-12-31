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
            min-height: 100vh;
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
            position: relative; /* 다른 요소들보다 앞에 위치하도록 설정 */
            z-index: 1;
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

        <%--  배경 화면 ticker 슬라이드쇼 시작!!!!!!!!!!!       --%>
        body {
            position: relative; /* 배경화면을 위한 설정 추가 */
        }

        .slideshow {
            position: fixed;
            top: 0;
            left: 0;
            width: 180%;
            height: 100%;
            display: flex;
            overflow: hidden; /* 슬라이드가 화면을 벗어나지 않도록 설정 */
        }

        .slide {
            width: 60vw; /* 화면 너비의 60%로 이미지 너비 설정 */
            height: 100%;
            background-size: cover;
            background-position: center;
            opacity: 0.6; /* 배경 이미지의 투명도 적용 */
        }

        /* 3번 슬라이드에만 적용 */
        /*.slideshow .slide:nth-child(3) {*/
        /*    background-position: top; !* 상단 부분이 보이도록 설정 *!*/
        /*}*/


        /* 애니메이션을 3개의 슬라이드가 60%씩 반복되도록 설정 */
        @keyframes slideTicker {
            0% {
                transform: translateX(0); /* 첫 번째 이미지 */
            }
            33.33% {
                transform: translateX(-60vw); /* 두 번째 이미지 */
            }
            66.66% {
                transform: translateX(-120vw); /* 세 번째 이미지 */
            }
            100% {
                transform: translateX(-180vw); /* 네 번째로 돌아갈 때 첫 번째로 돌아오기 */
            }
        }

        .slideshow {
            animation: slideTicker 30s linear infinite; /* 애니메이션이 30초에 걸쳐 반복 */
        }

        <%-- 배경 화면 슬라이드쇼 끝  --%>


    </style>
</head>

<body>
<%--!!!!!!!!!!!! 배경화면 ticker 시작--%>
<div class="slideshow">
    <div class="slide" style="background-image: url('/images/ij1.jpg');"></div>
    <div class="slide" style="background-image: url('/images/ij2.jpg');"></div>
    <div class="slide" style="background-image: url('/images/ij3.jpg');"></div>
</div>

<%--!!! 배경화면 ticker 끝 !!!!!!!!!!!--%>
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

    // ==================== 객체 관련 일반 함수 =================//


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

    // # 클릭된 input checkbox의 id 값으로 db에서 해당 행을 조회하여 isCompleted를 현재 상태대로 바꾸고
    //  todo java 객체의 현재 상태 필드도 바꿔주는 함수
    async function toggleTodoIsCompleted(checkboxId, isCheckboxChecked) {
        // - back에 전달하기 위해서 필요한 정보를 객체로 정리해서 만들어줌
        let updatedTodo = {
            id: checkboxId,
            isCompleted: isCheckboxChecked,
        }


        // - back에 변경 요청
        const response = await fetch(`/api/travel/todo/\${updatedTodo.id}/changeStatus`, {
                body: JSON.stringify(updatedTodo),
                headers: {
                    'Content-Type': 'application/json'
                },
                method: 'PUT',
            }
        );
        const modifiedTodo = await response.json();


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
                document.getElementById('new-task-input').value = ''; // 입력창에서 내용 없애주기
                $newTaskInput.placeholder = "Please write something🤦‍♂️ and then press Enter"
                return;
            }
            // 입력한 내용이 있으면,
            //  1) 먼저 placehoder를 원래 내용으로 바꿔주고(위에서 내용 입력안하고 엔터치면 'please write something' 뜨게 해 설정함)
            document.getElementById('new-task-input').value = ''; // 입력창에서 내용 없애주기
            $newTaskInput.placeholder = "Add a New Task + Enter";
            //   DB에 Save 후 재렌더링
            let promise = await saveNewTodo(inputText);
            await fetchAndRenderAllTodos();
        }
    }

    //# todo checkbox 체크 상태에 따라 필요한 작업을 해주는 핸들러 함수
    function updateCheckboxStatusHandler(e) {
        // 태그 네임으로 확인 : e.target.tagName (값 대문자로 나옴)!
        // if ((e.target.tagName !== 'P') && (e.target.tagName !== 'INPUT')) {
        if (e.target.tagName !== 'INPUT') {
            return;
        }

        // input type=checkbox의 체크 상태를 확인(checkbox input의 경우, checked property에서 확인 가능)하여,
        //   1. todo 객체와 todo DB의 completed 여부 field의 값을 true에서 false로 변환해주기
        //     - [todo 객체의 isCompleted여부 바꿔주기]
        //        : todo java 객체에서 해당 객체를 찾아서(input 태그의 id에서 확인 가능)
        //          해당 객체의 isCompleted를 바꿔주기
        const isChecked = e.target.checked; // todo 클릭 후 바뀐 checked 여부 확인하여
        // id 값으로 db에서 행 조회하여 isCompleted 여부 변경하고, db 값에 따 java todo 객체의 필드값도 변경
        toggleTodoIsCompleted(e.target.id, isChecked)

        //   2. css 바꿔주기

    };



    // ================= 이벤트 리스너 등록 =========== //
    // # 입력창에서 Enter 키 누르면 Todo DB에 등록되는 이벤트
    document.getElementById('new-task-input').addEventListener('keydown', newTaskInputHandler);

    // # Todo 라벨을 클릭하면 Pending/Completed 여부가 바뀌고 그에 따라 css , db 등이 변경되는 이벤트
    // task-box div 안에서 동적으로 각 task div가 생성됨. task div 안의 input 태그에 id에 DB의 id 값이 적혀 있음
    const $taskBox = document.querySelector('.task-box');
    //                                 todo checkbox 체크 상태에 따라 필요한 작업을 해주는 핸들러 함수
    $taskBox.addEventListener('click', updateCheckboxStatusHandler );

    // =============== 초기 실행 함수 ================== //
    // # 전체 ToDo 목록 렌더링
    fetchAndRenderAllTodos();
</script>
</body>
</html>