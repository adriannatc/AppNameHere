package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.*;
import dao.*;

@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	// This class only handles search feature of the web app
	
	private static final long serialVersionUID = 1L;
	private static String SEARCH_CLASS = "/searchClassResult.jsp";
	
	private ClassDao dao;
	
	//constructor for this class
	public SearchController() {
		super();
		dao = new ClassDao();
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// search for the keyword entered by the user
		 
		String keyword = request.getParameter("keyword");
		
		HttpSession session =request.getSession();
		session.setAttribute("keyword",keyword);

		RequestDispatcher view = request.getRequestDispatcher(SEARCH_CLASS);
		request.setAttribute("keyword", keyword);
		
		//NAZ this is line prints the classes in the list being returned. right now it is always empty
		System.out.println("Classes being returned by keyword");
		
		System.out.println(dao.getClassByKeyword(keyword));
		
		request.setAttribute("gclasses", dao.getClassByKeyword(keyword));
		
		/**
		 * Redirect to the search results page after the list of classes
		 * matching the keywords has been retrieved.
		 */

		view.forward(request, response);
	}
}