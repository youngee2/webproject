<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/PersonalInformation.css">
</head>
<body>


	<c:choose>
		<c:when test="${idx != 0}">

			<form name="SignOut" action="../Page/SignOut.do" method="post">
				<div class="SignOutModal">

					<p class="confirmSignOutA">정말 탈퇴하시겠습니까?</p>
					<p class="confirmSignOutB">비밀번호를 입력해주세요.</p>

					<input type="password" name="user_passwd"> <span
						style="color: red; font-size: 1.2em;"> <%=request.getAttribute("ErrMsg") == null ? "" : request.getAttribute("ErrMsg")%>
					</span>
					<button type="submit" onclick="SignOutbtn()" class="SignoutBtn">탈퇴하기</button>
			</form>
		</c:when>
		
	  <c:otherwise>
			<%
			request.setCharacterEncoding("UTF-8");
			String user_id = (String) session.getAttribute("UserId");

			if (user_id == null) {
				out.println("<script>alert('로그인 후 사용해주세요.'); location.href='Login.do';</script>");
			}
			%>

		</c:otherwise>
	</c:choose>
</body>


</html>