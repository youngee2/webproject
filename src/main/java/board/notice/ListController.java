package board.notice;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NoticeBoardDAO dao = new NoticeBoardDAO();

		Map<String, Object> map = new HashMap<String, Object>();

		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");

		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		int totalCount = dao.selectCount(map);

		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		
//		int category=Integer.parseInt(req.getParameter("category"));
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);


		List<NoticeBoardDTO> boardLists = dao.selectListPage(map);
		dao.close();

		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../Page/list.do");

		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);

		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("../Page/notice.jsp").forward(req, resp);
	}
	
}
