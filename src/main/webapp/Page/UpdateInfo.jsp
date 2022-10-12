<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../Page/Header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UpdatePersonalInfomation</title>
<link rel="stylesheet" href="./css/PersonalInformation.css">
<style>
.user_id {
	border: none;
}

.user_id:focus {
	border: none;
	outline: none;
}

.cantFix {
	color: blue;
}

.error {
	color: red;
}

#check_button{
    background-color: #b9D8E0;
    border : 2px solid #b9D8E0;
    color: #2B5566;
}

</style>
</head>

<body>
	<section class="Personalinfo">
		<h1 class="personalA-title">회원정보</h1>
		<hr class="personal-lineA">
		<h3 class="personalB-subtitle">회원 정보 변경</h3>


		<%
		request.setCharacterEncoding("UTF-8");
		String user_id = (String) session.getAttribute("UserId");

		if (user_id == null) {
			out.println("<script>alert('로그인 후 사용해주세요.'); location.href='Login.jsp';</script>");
		}
		%>

		<table class="PersonalC-table">

			<form name="UpdateInfo" method="post" action="../Page/UpdateInfo.do"
				onsubmit="return updateCheck()">
				<tr>
					<th>이름</th>
					<td><input type="text" id="namechk" name="name"
						value="${dto.name}" /><br> <a id="nameError" class="error"></a></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" id="nickname" name="nickname"
						value="${dto.nickname}"
						placeholder="'별명 중복 검사' 버튼을 눌러 아이디를 입력해주세요." readonly/> <input
						type="button" id="check_button" value="별명 중복 검사"
						onclick="nicknameCheck()" /><br> <a id="nicknameError"
						class="error"></a></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" class="user_id" name="user_id"
						value="${dto.user_id}" readonly="readonly" /> <a class="cantFix">*아이디는
							수정 불가합니다.</a></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="pwd" name="user_passwd"
						value="${dto.user_passwd}" required/><br> <a id="pwdError"
						class="error" ></a></td>
				</tr>
				<tr>
					<th>이메일 주소</th>
					<td><input type="text" id="email" name="email"
						value="${dto.email}"/><br> <a id="emailError" class="error"></a></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" id="phone_num" name="phone_num"
						value="${dto.phone_num}" /><br> <a id="phoneNumError"
						class="error"></a></td>
				</tr>
		</table>
		<button id="check_button" type="submit" onclick="updateCheck()">수정하기</button>
		</form>

		<hr class="personal-lineB">
	</section>
</body>
<%@ include file="./HeaderFooter/Footer.jsp"%>
</html>

<script>
	// 가입부분 체크 
	var openWin;
	function nicknameCheck() {
		window.open("NicknameCheckForm.jsp", "idwin",
				"width=450, height=350, resizable = no, scrollbars = no");
		window.name = "parentForm";
	}
</script>

<script>
	// 가입부분 체크 
	function updateCheck() {
		let namechk = document.getElementById("namechk").value;
		let nickname = document.getElementById("nickname").value;
		let pwd = document.getElementById("pwd").value;
		let email = document.getElementById("email").value;
		let phone_num = document.getElementById("phone_num").value;
		let check = true;
		let idvalcheck = /^[a-z0-9]+$/;
		let pwdcheck = /^[a-zA-Z0-9]+$/;

		let num = /[0-9]/;
		let eng = /[a-z]/;
		let spe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/;

		let mailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let pwdOK = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;

		// 이름확인
		if (namechk === "") {
			document.getElementById("nameError").innerHTML = "이름은 필수 정보입니다."
			return false;
		} else if (spe.test(namechk) || namechk.length > 10) {
			document.getElementById("nameError").innerHTML = "이름을 정확히 입력해주세요."
			return false;
		} else {
			document.getElementById("nameError").innerHTML = ""
		}

		//닉네임
		if (nickname === "") {
			document.getElementById("nicknameError").innerHTML = "별명은 필수 정보입니다."
			return false;
		} else {
			document.getElementById("nicknameError").innerHTML = "멋진 별명이네요!"
		}

		// 비밀번호 확인
		if (pwd === "") {
			document.getElementById("pwdError").innerHTML = "비밀번호를 입력해주세요."
			return false;
		} else if (!pwdOK.test(pwd)) {
			document.getElementById("pwdError").innerHTML = "8~15자의 영문, 숫자, 특수문자 조합으로 입력해주세요."
			return false;
		} else {
			document.getElementById("pwdError").innerHTML = ""
		}

		//email
		if (email === "") {
			document.getElementById("emailError").innerHTML = ""
		} else if ((email.match(mailCheck) == null)) {
			document.getElementById("emailError").innerHTML = "이메일을 정확히 입력해주세요."
			return false;
		} else {
			document.getElementById("emailError").innerHTML = ""
		}

		//전화번호
		if (phone_num === "") {
			document.getElementById("phoneNumError").innerHTML = "전화번호는 필수 정보입니다."
			return false;
		} else if (num.test(phone_num) || id.length < 12) {
			document.getElementById("phoneNumError").innerHTML = "전화번호는 숫자만 입력해주세요."
			return false;
		} else {
			document.getElementById("phoneNumError").innerHTML = ""
		}

		
	}
	
	
</script>
