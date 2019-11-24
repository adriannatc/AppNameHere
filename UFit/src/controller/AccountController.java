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

/**
 * Servlet implementation class AccountController
 */
@WebServlet("/AccountController")
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String EDIT = "/myAccountEdit.jsp";
	//private static String DELETE = "/myAccountDelete.jsp";
	private static String ACCOUNT = "/myAccount.jsp";
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
		String action = request.getParameter("action");
		HttpSession session = request.getSession(true);
		Member member = (Member) session.getAttribute("currentSessionUser");
	if(action.equalsIgnoreCase("accountEdit")){
		forward = EDIT;
		request.setAttribute("member", member);
	}else {
		forward = ACCOUNT;
	}

	RequestDispatcher view = request.getRequestDispatcher(forward);
	view.forward(request, response);
		
	}
		/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		/**
		 * This method retrieves all of the information entered in the form on
		 * signup.jsp
		 */
		Member member = new Member();
		member.setFirstName(request.getParameter("firstName"));
		member.setLastName(request.getParameter("lastName"));
		member.setEmail(request.getParameter("email"));
		member.setUsername(request.getParameter("username"));
		member.setPassword(request.getParameter("password"));
		String memberid = request.getParameter("memberid");
		
		if (memberid == null || memberid.isEmpty()) {
			dao.addMember(member);
		} else {
			/**
			 * Otherwise, if the field is already filled (this occurs when the
			 * user is trying to Edit A Member), then the member's information
			 * will be updated accordingly.
			 */
			member.setid(Integer.parseInt(memberid));
			dao.updateMember(member);
		}
		/**
		 * Once the members has been added or updated
		 */
		}

}
