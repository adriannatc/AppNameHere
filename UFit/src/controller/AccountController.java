package controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Class;
import model.Member;
import dao.MemberDao;
import dao.ClassDao;


/**
 * Servlet implementation class AccountController
 */
@WebServlet("/AccountController")
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String EDIT = "/myAccountEdit.jsp";
	//private static String DELETE = "/myAccountDelete.jsp";

	//private static String myAccount = "/UFit/ClassController?action=memberList";
	//private static String ACCOUNT = "/ClassController?action=memberList";
	private static String myACCOUNT = "/myAccount.jsp";
	private MemberDao dao;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountController() {
        super();
        dao = new MemberDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String forward = "";
		HttpSession session = request.getSession(true);
		
		ClassDao classdoa = new ClassDao();
		request.setAttribute("myclasses",classdoa.getMyClasses((Integer) session.getAttribute("memberid")));
		forward = myACCOUNT;
	

	RequestDispatcher view = request.getRequestDispatcher(forward);
	view.forward(request, response);
		
	}
		/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
	//	Member member1 = (Member) session.getAttribute("currentSessionUser");
		int memberid = (Integer) session.getAttribute("memberid");
		System.out.println("doPost: ");
		System.out.println(memberid);
		System.out.println("fn: "+request.getParameter("firstName"));
		System.out.println("ln: "+request.getParameter("lastName"));
		System.out.println("em: "+request.getParameter("email"));
		System.out.println("pw: "+request.getParameter("password"));
		
		Member member = new Member();
		member.setid(memberid);
		member.setFirstName(request.getParameter("firstName"));
		member.setLastName(request.getParameter("lastName"));
		member.setEmail(request.getParameter("email"));
		member.setPassword(request.getParameter("password"));
		//String memberid = (String) session.getAttribute("memberid");
		
		//member.setid(Integer.parseInt(memberid));
		//System.out.println("\nMember: " +memberid);
		dao.updateMember(member);
		
		session.setAttribute("currentSessionUser",member);
		session.setAttribute("memberid", memberid);
		session.setAttribute("firstname", request.getParameter("firstName"));
		session.setAttribute("lastname", request.getParameter("lastName"));
		session.setAttribute("email", request.getParameter("email"));
		session.setAttribute("password", request.getParameter("password"));
		ClassDao classdoa = new ClassDao();
		request.setAttribute("myclasses",classdoa.getMyClasses((Integer) session.getAttribute("memberid")));
		RequestDispatcher view = request
				.getRequestDispatcher(myACCOUNT);
		view.forward(request, response);
	}

}
