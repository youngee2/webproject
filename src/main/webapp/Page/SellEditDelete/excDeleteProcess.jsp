<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.exchange.ExchangeBoardDAO"%>
<%@ page import="board.exchange.ExchangeBoardDTO"%>
<%
int exc_num = Integer.parseInt(request.getParameter("excNum"));
String nickname = (String) session.getAttribute("Nickname");

String num = request.getParameter("excNum");
ExchangeBoardDAO dao = new ExchangeBoardDAO();
ExchangeBoardDTO dto = dao.selectView(num);

if (!nickname.equals(dto.getNickname())) {
	dao.close();
	out.println("<script>alert('본인만 삭제가능합니다.'); location.href='../exchangeListPage.do';</script>");
	return;
} else {
	dto.setExc_num(exc_num);
	int result = dao.deletePost(dto);
	dao.close();
	
	if(result == 1){
		out.println("<script>alert('해당 글이 삭제되었습니다.'); location.href='../exchangeListPage.do';</script>");
	} else{
	}
}
%>