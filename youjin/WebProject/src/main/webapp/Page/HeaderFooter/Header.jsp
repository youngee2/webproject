<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/WebProject/css/HeaderFooter.css">
    <script src="https://kit.fontawesome.com/e4982ae3c4.js" crossorigin="anonymous"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
</head>




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

                        <div class="modal">
                            <div class="login-modal">

                                <span class="close">&times;</span>
                                <div class="Login_form">
                                    <h3>Login to ANABADA</h3>

                                    <div class="modal-margin">
                                    <form  name="Login" action="" method="get">
                                        <div class="form-group">
                                            <input type="text" name="login" required /><label>ID</label>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" required /><label>Password</label>
                                        </div>
                                        <input type="button" value="Login" class="submit" onclick="check_onclick()">

                                        <div class="forgot">
                                            <a href="#">Forgot your password?</a>
                                        </div>

                                        <div class="GoSignUp">
                                            <p>Not Yet Registered? <a href="#">Sign Up</a></p>
                                        </div>
                                    </form>
                                </div>
                                </div>
                            </div>
                        </div>
                </div>
                </ul>
        </div>
        <script>
            function check_onclick() {
                theForm = document.Login;

                if (theForm.login.value == "" || theForm.password.value == "") {
                    alert("아이디 혹은 비밀번호를 입력해주세요.");
                }
            }
        </script>

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
            <li><a href="#">거래하기</a>
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
            <li><a href="#">교환</a></li>
        </ul>
        <ul class="subD">
            <li><a href="#">자유게시판</a></li>
        </ul>
        <ul class="subE">
            <li><a href="#">후원하기</a></li>
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
    <script>
        var modals = document.getElementsByClassName("modal");
        var btns = document.getElementsByClassName("btn");
        var spanes = document.getElementsByClassName("close");
        var funcs = [];
    
        function Modal(num) {
            return function () {
                btns[num].onclick = function () {
                    modals[num].style.display = "block";
                    console.log(num);
                };
    
                spanes[num].onclick = function () {
                    modals[num].style.display = "none";
                };
            };
        }
    
        for (var i = 0; i < btns.length; i++) {
            funcs[i] = Modal(i);
        }
    
        for (var j = 0; j < btns.length; j++) {
            funcs[j]();
        }
    
        window.onclick = function (event) {
            if (event.target.className == "modal") {
                event.target.style.display = "none";
            }
        };
    
    </script>