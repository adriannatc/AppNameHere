package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hsqldb.HsqlException;

import net.ucanaccess.jdbc.UcanaccessSQLException;

import com.healthmarketscience.jackcess.ConstraintViolationException;

import model.*;
import dao.*;

/**
 * Servlet implementation for LoginController.
 * 
 * This class handles the login servlet and assigns session attributes for users
 * who succesfully log into the system.
 */


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private MemberDao dao;

	private static final long serialVersionUID = 1L;
	private static String myAccount = "/UFit/ClassController?action=memberList";
	private static String invalidUsername = "/invalidUsername.jsp";
	private static String accountCreated = "/accountCreated.jsp";
	
	
	public LoginController() {
	    super();
	    dao = new MemberDao();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		/**
		 * Retrieve the entered username and password from the login.jsp form.
		 */
		Member member = new Member();
		member.setUsername(request.getParameter("un"));
		member.setPassword(request.getParameter("pw"));

		try {
			/**
			 * Try to see if the member can log in.
			 */
			member = MemberDao.login(member);

			/**
			 * If the isValid value is true, assign session attributes to the
			 * current member.
			 */
			if (member.isValid()) {

				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionmember", member);
				session.setAttribute("username", member.getUsername());
				session.setAttribute("firstname", member.getFirstName());
				session.setAttribute("lastname", member.getLastName());
				session.setAttribute("memberid", member.getid());
				session.setAttribute("email", member.getEmail());
				session.setAttribute("password", member.getPassword());
				
				/**
				 * Redirect to the members-only home page.
				 */
				response.sendRedirect("memberLogged.jsp");

				/**
				 * Set a timeout variable of 900 seconds (15 minutes) for this
				 * member who has logged into the system.
				 */
				session.setMaxInactiveInterval(900);
			}

			else {
				/**
				 * Otherwise, redirect the user to the invalid login page and
				 * ask them to log in again with the proper credentials.
				 */
				response.sendRedirect("invalidLogin.jsp");
			}
		}

		catch (Throwable theException) {
			/**
			 * Print out any errors.
			 */
			System.out.println(theException);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		/**
		 * This method retrieves all of the information entered in the form on
		 * signup.jsp
		 */
		Member member = new Member();

	//	HttpSession session = request.getSession(true);
		member.setFirstName(request.getParameter("firstName"));
		member.setLastName(request.getParameter("lastName"));
		member.setEmail(request.getParameter("email"));
		member.setUsername(request.getParameter("username"));
		member.setPassword(request.getParameter("password"));
		String memberid = request.getParameter("memberid");
		//String memberid = (String) session.getAttribute("memberid");
		
		if (memberid == null || memberid.isEmpty()) {
			//try{
				dao.addMember(member);
			//}catch(HsqlException e){
				//System.out.println("exception occured");
				//forward =invalidUsername;
			//	e.getStackTrace();
//			}catch(SQLException e){
//				e.getStackTrace();
			
				forward = accountCreated;
		}
//		} else {
//			/**
//			 * Otherwise, if the field is already filled (this occurs when the
//			 * user is trying to Edit A Member), then the member's information
//			 * will be updated accordingly.
//			 */
//			member.setid(Integer.parseInt(memberid));
//			System.out.println("\nMember: " +memberid);
//			dao.updateMember(member);
//			forward = myAccount;
//		}
		/**
		 * Once the members has been added or updated
		 */
		RequestDispatcher view = request
				.getRequestDispatcher(forward);
		view.forward(request, response);
	}
	

}
