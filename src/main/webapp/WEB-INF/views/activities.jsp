<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coming Soon</title>
    <style>
        /* 기본 스타일 초기화 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            font-family: 'Inter', sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #f3f4f6;
        }

        /* 메인 컨테이너 스타일 */
        .container {
            text-align: center;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 500px;
            width: 100%;
        }

        /* 이미지 컨테이너 */
        .image-container {
            margin-bottom: 30px;
        }

        /* 귀여운 이미지 스타일 */
        .coming-soon-image {
            width: 100%;
            max-width: 300px;
            height: auto;
            border-radius: 50%;
            object-fit: cover;
            transform: scale(1.2); /* 초기 크기를 1.2배로 설정 */
            transition: transform 1s ease;
        }

        /* 이미지가 화면에 보이면 크기가 1.2배에서 1.1배로 변하는 애니메이션 */
        .coming-soon-image.animate {
            transform: scale(1.1);
        }

        /* 타이틀 스타일 */
        .title {
            font-size: 2.5rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 10px;
            transform: scale(1); /* 초기 크기를 1배로 설정 */
            transition: transform 1s ease;
        }

        /* 타이틀이 화면에 보이면 크기가 1배에서 1.2배로 변하는 애니메이션 */
        .title.animate {
            transform: scale(1.2);
        }

        /* 서브타이틀 스타일 (기본적으로 숨겨짐) */
        .subtitle {
            font-size: 1.25rem;
            font-weight: 400;
            color: #777;
            opacity: 0;
            transition: opacity 50ms ease-in-out;
            margin-top: 15px;
        }

        /* "메인으로 돌아가기" 버튼 스타일 */
        .back-button {
            margin-bottom: 20px;
            padding: 8px 16px;
            background: none;
            color: #007bff;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            text-decoration: underline;
        }

        /* 반응형 디자인 */
        @media (max-width: 1024px) {
            .container {
                padding: 30px;
            }
            .title {
                font-size: 2rem;
            }
            .subtitle {
                font-size: 1rem;
            }
        }

        @media (max-width: 809px) {
            .container {
                padding: 20px;
            }
            .title {
                font-size: 1.75rem;
            }
            .subtitle {
                font-size: 0.875rem;
            }
            .coming-soon-image {
                max-width: 200px;
            }
        }
    </style>
</head>
<body>
    <button class="back-button" onclick="window.location.href='/travel'">Back To Main</button>
    <div class="container">
        <div class="image-container">
            <img src="<%= request.getContextPath() %>/images/03.jpg" alt="Cute Image" class="coming-soon-image">
        </div>
        <div class="text-container">
            <h1 class="title">Coming Soon</h1>
            <p class="subtitle">MJ needs a few more cups of coffee before building the page!</p>
        </div>
    </div>

    <script>
        // 이미지가 화면에 들어오면 1.2배에서 1.1배로 변하는 애니메이션을 추가
        window.addEventListener('DOMContentLoaded', (event) => {
            const image = document.querySelector('.coming-soon-image');
            const title = document.querySelector('.title');

            setTimeout(() => {
                image.classList.add('animate'); // 페이지 로드 후 이미지 애니메이션 시작
                title.classList.add('animate'); // 페이지 로드 후 타이틀 애니메이션 시작
            }, 50);  // 약간의 지연 후 애니메이션 시작

            // 서브타이틀 "Wait a minute, please~" 문구 표시 속도 조절
            setTimeout(() => {
                const subtitle = document.querySelector('.subtitle');
                subtitle.style.opacity = 1;  // 서브타이틀이 보이도록 opacity 변경
            }, 1500);  // 1.5초 후에 서브타이틀 표시
        });
    </script>
</body>
</html>
