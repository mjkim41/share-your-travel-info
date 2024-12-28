  <%@ page contentType="text/html; charset=UTF-8" language="java" %>
  <!DOCTYPE html>
  <html lang="ko">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Flight Info</title>
      <style>
        /* ====================  여행자 버튼  ================*/
        .cta-buttons {
              display: flex;
              gap: 10px;
          }

          .cta-button {
    width: 160px;
    background-color: white;
    color: #333;
    font-weight: 700;
    font-size: 14px;
    padding: 10px 20px;
    border-radius: 8px;
    text-align: center;
    cursor: pointer;
    border: none;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 1px 3px rgba(0, 0, 0, 0.08);
    transition: all 0.2s ease;
  }

  .cta-button:hover {
    background-color: #f0f0f0;
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15), 0 2px 4px rgba(0, 0, 0, 0.12);
  }

  .cta-button:active {
    background-color: #d0d0d0;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
    transform: translateY(2px);
  }


          /* Responsive Design */
          @media (max-width: 1199px) {
              .cta-button {
                  font-size: 12px;
                  padding: 8px 16px;
              }
          }

          @media (max-width: 809px) {
              .cta-button {
                  width: 120px;
                  font-size: 13px;
                  padding: 8px 13px;
              }
          }




        /* ================== 비행카드 css ================ */
          body {
              font-family: Arial, sans-serif;
              /* background-color: #f4f4f4; */
              margin: 0;
              padding: 20px;
          }

          #root {
              margin: 20px;
          }

          #cardContainer {
              width: 100%;
              margin-bottom: 20px;
              background-color: #fff;
              box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
              border-radius: 10px;
              cursor: pointer;
              transition: transform 0.3s ease, height 0.9s ease;
          }

          #firstDisplay, #first, #second, #third {
              padding: 20px;
          }

          #first {
              display: flex;
              justify-content: space-between;
          }

          #firstBehind, #secondBehind, #thirdBehind {
              margin-top: 20px;
          }

          .flightDetail {
              margin-top: 15px;
          }

          .detailLabel {
              color: #b2b2b2;
              font-size: 10px;
              font-weight: 100;
          }

          .price {
              font-size: 15px;
              font-weight: bold;
          }

          .priceLabel {
              color: #b2b2b2;
              font-size: 10px;
              font-weight: 100;
          }



          /* ============= 비행 정보 =============== */
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f9;
    color: #333;
  }

  h1 {
    text-align: center;
    margin: 20px 0;
    font-size: 2rem;
  }

  .flight-container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
  }

  .flight-card {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-bottom: 20px;
  }

  .flight-header {
    text-align: center;
    margin-bottom: 20px;
  }

  .flight-header h2 {
    font-size: 1.5rem;
    color: #5c6bc0;
  }

  .flight-info {
    margin-bottom: 30px;
    padding: 20px;
    background-color: #e8eaf6;
    border-radius: 8px;
  }

  .flight-info h3 {
    font-size: 1.25rem;
    color: #3f51b5;
    margin-bottom: 10px;
  }

  .flight-info p {
    font-size: 1rem;
    line-height: 1.5;
    color: #555;
  }

  .flight-details {
    margin-bottom: 15px;
  }
  /* 비행편 정보 상세보기기 버튼 */
  .status-btn {
      display: none; /* 기본적으로 버튼은 숨김 처리 */
      background-color: #007bff;
      color: white;
      padding: 4px 10px; /* 크기 조정 */
      font-size: 0.7em;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.3s ease;
      vertical-align: middle;
      margin-bottom: 5px;
  }

  /* 여행자명 선택해야 버튼 시각적으로 활성화됨  */
  .status-btn.active {
    display: inline;
  }

  .status-btn:hover {
      background-color: #0056b3;
      transform: scale(1.05);
  }

  .status-btn:active {
      background-color: #003366;
  }

  .status-btn:focus {
      outline: none;
      box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.5);
  }

  @keyframes btn-click {
      0% {
          transform: scale(1);
      }
      50% {
          transform: scale(0.9);
      }
      100% {
          transform: scale(1);
      }
  }

  .status-btn:active {
      animation: btn-click 0.3s ease;
  }

  @media (max-width: 809px) {
      .status-btn {
          /* width: 100%; */
          /* padding: 12px; */
      }
  }
  /* 버튼 끝 */

  .flight-info strong {
    color: #3f51b5;
  }

  .flight-info span {
    color: #1e88e5;
  }

  .flight-info .duration {
    font-weight: bold;
    font-size: 1.1rem;
  }

  .flight-info .departure {
    font-weight: bold;
    font-size: 1.1rem;
  }

  .flight-info .arrival {
    font-weight: bold;
    font-size: 1.1rem;
  }

  @media screen and (max-width: 809px) {
    .flight-container {
      width: 90%;
    }

    .flight-card {
      padding: 15px;
    }

    .flight-header h2 {
      font-size: 1.2rem;
    }

    .flight-info h3 {
      font-size: 1rem;
    }

    .flight-info p {
      font-size: 0.9rem;
    }
  }

      </style>
  </head>
  <body>


    <main>
      <!-- 여행자 선택 버튼 컨테이너 :내부 html은 db 가져와서 동적으로 생성 -->
    <section class="pasenger-selection-button-container">
        <div class="wrapper">
          <div class="cta-buttons">
            <!-- <div class="cta-button" data-passengerName="passengerName">passenger name</div> -->
          </div>
        </div>
      </section>
      <!-- 비행 정보 컨테이너 -->
      <div class="flight-container">
        <h1><span class="mobile-hide">Flight Information</span></h1>

        <div class="flight-card">
          <div class="flight-header">
            <h2>Passenger: <span id="passengerName">Select the Passenger</span></h2>
          </div>

          <!-- 첫 번째 항공편 정보 -->
          <div class="flight-info">
            <div class="flight-details">
              <h3>
                Flight 1: <span id="flightNumber1"></span>
                <button class="status-btn status-btn1" data-linkUrl="">Status</button>
              </h3>
              <p><strong>Departure:</strong> <span id="departureTime1"></span> - <span id="departureLocation1"></span></p>
              <p><strong>Arrival:</strong> <span id="arrivalTime1"></span> - <span id="arrivalLocation1"></span></p>
              <p><strong>Duration:</strong> <span id="duration1"></span></p>
            </div>
          </div>

          <!-- 두 번째 항공편 정보 -->
          <div class="flight-info">
            <div class="flight-details">
              <h3>
                Flight 2: <span id="flightNumber2"></span>
                <button class="status-btn status-btn2" data-linkUrl="">Status</button>
              </h3>
              <p><strong>Departure:</strong> <span id="departureTime2"></span> - <span id="departureLocation2"></span></p>
              <p><strong>Arrival:</strong> <span id="arrivalTime2"></span> - <span id="arrivalLocation2"></span></p>
              <p><strong>Duration:</strong> <span id="duration2"></span></p>
            </div>
          </div>
        </div>
      </div>
    </main>


    <!-- 비행카드 -->
      <div id="root"></div>

      <script>



        // ============== API 통신 함수 ==========
        // ## DB에서 여행자 목록 가져와서 여행자명 선택 버튼 렌더링하는 함수
        async function fetchAndRenderTravelers() {
          // 데이터 받기
          const res = await fetch('/api/v1/flight');
          const data = await res.json();
          // 여행자 목록 버튼 동적생성
          createTravelerButton(data);
        }

        // ## DB에서 특정 여행자의 비행정보 가져와서 렌더링하는 함수
        //  - 여행자명 클릭 시 발생하는 함수로, 여행자명 클릭 시 태그 dataset에서 사용자명 받아옴옴
        async function fetchAndRenderSelectedPassengerFlights(selectedPassenger) {
          // 데이터 받기
          const res = await fetch(`/api/v1/flight/\${selectedPassenger}`);

          // 조회 정보가 없으면 에러 메시지 생성
          if(res.status === 404) {
            alert('해당 고객은 존재하지 않습니다');
          }

          // 해당 여행자 비행 정보 꽂기
          const data = await res.json();
          fillFlightInfo(data);
        }

        // ============== 일반 함수 ======== //
        // ## 여행자 목록 버튼 동적 생성 함수(fetchAndRenderTravelers 함수에서 사용)
        function createTravelerButton(data) {
          data.forEach(passengerName => {
            const $ctaButtonContainer = document.querySelector('.cta-buttons');
            $ctaButtonContainer.innerHTML += `
            <div class="cta-button" data-passengerName="\${passengerName}">\${passengerName}👩‍🦰</div>
            `;
            console.log($ctaButtonContainer)
          })
        }

        // ## 특정 여행자 비행정보 동적 입력 함수(fethAndRenferSelectedPassengerFlights 함수에서 사용)
        // - parameter의 값은 fetchAndRenderSelectedPassengerFlight 함수에서 fetch해서 전달 받은 걸 deconstructuring
        function fillFlightInfo({ passengerName, flightNumber1, departureTime1, arrivalTime1, departureLocation1,
          arrivalLocation1, duration1, flightNumber2, departureTime2, arrivalTime2, departureLocation2, arrivalLocation2, duration2
          // 밑에는 FlightWithStatusCheckCode 객체에서 추가된 필드들
        , airlineCode1, flightNumNumbers1, airlineCode2, flightNumNumbers2, flightYear1, flightMonth1, flightDay1, flightYear2, flightMonth2, flightDay2 })
        {

          document.getElementById('passengerName').textContent = passengerName + " to "+ arrivalLocation2 + "💖";

          // 첫 번째 항공편 정보
  document.getElementById('flightNumber1').textContent = flightNumber1;
  document.getElementById('departureTime1').textContent = departureTime1;
  document.getElementById('departureLocation1').textContent = departureLocation1;
  document.getElementById('arrivalTime1').textContent = arrivalTime1;
  document.getElementById('arrivalLocation1').textContent = arrivalLocation1;
  document.getElementById('duration1').textContent = duration1;

  // 두 번째 항공편 정보
  document.getElementById('flightNumber2').textContent = flightNumber2;
  document.getElementById('departureTime2').textContent = departureTime2;
  document.getElementById('departureLocation2').textContent = departureLocation2;
  document.getElementById('arrivalTime2').textContent = arrivalTime2;
  document.getElementById('arrivalLocation2').textContent = arrivalLocation2;
  document.getElementById('duration2').textContent = duration2;

  // status check 버튼용 첫번째 항공편 정보
  const $statusBtn1 = document.querySelector('.status-btn1');
  $statusBtn1.dataset.linkUrl = `https://www.flightstats.com/v2/flight-tracker/\${airlineCode1}/\${flightNumNumbers1}?year=\${flightYear1}&month=\${flightMonth1}&date=\${flightDay1}`;

  // status check 버튼용 두번째 항공편 정보
  const $statusBtn2 = document.querySelector('.status-btn2');
  $statusBtn2.dataset.linkUrl = `https://www.flightstats.com/v2/flight-tracker/\${airlineCode2}/\${flightNumNumbers2}?year=\${flightYear2}&month=\${flightMonth2}&date=\${flightDay2}`;
       }

        // ============= 이벤트 핸들러 함수 =============== //
        // # 여행자명 클릭 시 비행정보 가져오는 이벤트
        function handleSelectedPassengerFlights(e) {
          // .cta-button을 클릭시에만 이벤트 발생
          if(!e.target.classList.contains('cta-button')) return;

          // 비행정보 상세보기 활성화
          document.querySelectorAll('.status-btn').forEach(btn => {
            btn.classList.add('active');
          });


          //DB에서 특정 여행자의 비행정보 가져와서 렌더링하는 함수
          const selectedPassenger = e.target.dataset.passengername;
          fetchAndRenderSelectedPassengerFlights(selectedPassenger);
        }

        // ============= 이벤트 핸들러 등록 ============ //
        // # 여행자명 클릭 시 비행정보 가져오는 이벤트
        const $ctaButtonContainer = document.querySelector('.cta-buttons');
        $ctaButtonContainer.addEventListener('click', handleSelectedPassengerFlights);

        // # 비행편 상태 조회 사이트 열어주는 이벤트
        const $statusBtns = document.querySelectorAll('.status-btn');
        $statusBtns.forEach($statusBtn => {
          console.log($statusBtn);
          $statusBtn.addEventListener('click', e => {
            // 조회 버튼 dataset에 url 적어두었음
            const linkUrl = e.target.dataset.linkUrl;
            console.log(linkUrl);
            window.open(linkUrl, "_blank");
          }) // end of addEventListner
        }); // end of forEach



        // =========== 초기 실행 코드 ============= //
        // ## DB에서 여행자 목록 가져와서 여행자명 선택 버튼 만들기
        fetchAndRenderTravelers();
      </script>


  </body>
  </html>
