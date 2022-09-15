<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./css/HeaderFooter.css">
    <script src="https://kit.fontawesome.com/e4982ae3c4.js" crossorigin="anonymous"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <title>Document</title>


</head>
<!DOCTYPE html>
<html lang="ko">

<head>

<body>
    <!--헤더 부분-->
    <header class="header">

        <div class="HeaderA">
            <!--헤더 부분-->
            <header class="header">

                <div class="HeaderA">
                    <ul class="login">
                        <li><a href="#">SIGNUP</a></li>
                        <li><a href="#">MY PAGE</a></li>
                        <li class="btn LoginBtn">Login</li>
               
                        <div class="modal-head">
                            <div class="login-modal">
                              
                                    <span class="close">&times;</span>
                                    <div class="Login_form">
                                        <h3>Login to ANABADA</h3>
                                        <form>
                                            <div class="form-group">
                                                <input type="text" required /><label>ID</label>
                                            </div>
                                            <div class="form-group">
                                                <input type="password" required /><label>Password</label>
                                            </div>
                                            <input type="button" value="Login" class="submit">
                                            <div class="GoSignUp">
                                                <p>Not Yet Registered? <a href="#">Sign Up</a></p>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ul>
                </div>

            </header>
        </div>


        <div class="HeaderB">
            <img class="LogoImg" src="./img/LogoPolarBear.png">
            <span><a href="#"> 아나바다</a></span>
        </div>

        <div class="HeaderC">

            <ul class="subA">
                <li><a href="#">아나바다란?</a>
                    <ol class="subDetailA">
                        <li><a href="#">회사소개</a></li>
                        <li><a href="#">개발자</a></li>
                    </ol>
                </li>
            </ul>

            <ul class="subB">
                <li><a href="tradeListPage.jsp">거래하기</a>
                    <ol class="subDetailB">
                        <li><a href="#">전체</a></li>
                        <li><a href="#">테크/가전</a></li>
                        <li><a href="#">패션/잡화/뷰티</a></li>
                        <li><a href="#">홈/리빙</a></li>
                        <li><a href="#">베이비/키즈</a></li>
                        <li><a href="#">반려동물</a></li>
                        <li><a href="#">게임/취미/문화</a></li>
                        <li><a href="#">기타</a></li>
                    </ol>
                </li>
            </ul>

            <ul class="subC">
                <li><a href="exchangeListPage.jsp">교환</a></li>
            </ul>
            <ul class="subD">
                <li><a href="#">자유게시판</a></li>
            </ul>
            <ul class="subE">
                <li><a href="donationPage.jsp">후원하기</a></li>
            </ul>

            <ul class="subF">
                <li><a href="#">고객센터</a>
                    <ol class="subDetailF">
                        <li><a href="#">F&Q</a></li>
                        <li><a href="#">1대1 문의</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                    </ol>
                </li>
            </ul>

        </div>
    </header>
     <script>
    // Modal을 가져옵니다.
var modals = document.getElementsByClassName("modal-head");
// Modal을 띄우는 클래스 이름을 가져옵니다.
var btns = document.getElementsByClassName("btn");
// Modal을 닫는 close 클래스를 가져옵니다.
var spanes = document.getElementsByClassName("close");
var funcs = [];

// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
function Modal(num) {
  return function () {
    // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
    btns[num].onclick = function () {
      modals[num].style.display = "block";
      console.log(num);
    };

    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
    spanes[num].onclick = function () {
      modals[num].style.display = "none";
    };
  };
}

// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
for (var i = 0; i < btns.length; i++) {
  funcs[i] = Modal(i);
}

// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
for (var j = 0; j < btns.length; j++) {
  funcs[j]();
}

// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
window.onclick = function (event) {
  if (event.target.className == "modal") {
    event.target.style.display = "none";
  }
};

    </script>
</body>
