package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import model.Class;
import dao.*;

/**
 * Servlet implementation for LoginController.
 * 
 * This class handles the login servlet and assigns session attributes for users
 * who succesfully log into the system.
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

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
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		/**
		 * This method retrieves all of the information entered in the form on
		 * the addClass.jsp or the editClass.jsp pages.
		 */
		Member member = new Member();
		member.setUsername(request.getParameter("un"));
		member.setPassword(request.getParameter("pw"));
		/** Set the fn, ln, email here too 
		 * 
		 */
		try {
			/** try to sign up the user
			 * 
			 */
			Memberusername = new SimpleDateFormat("username").parse(request
					.getParameter("un"));
			member.setUsername();
		} catch (ParseException e) {
			e.printStackTrace();
		
		
		if (Memberusername == null || MemberUsername.isEmpty()) {
			dao.addMember(member);
		} else {
			/**
			 * Otherwise, if the field is already filled (this occurs when the
			 * user is trying to Edit A Class), then the gclass's information
			 * will be updated accordingly.
			 */
			member.setClassid(Integer.parseInt(memberid));
			dao.updateMember(member);
		}
		/**
		 * Once the members has been added or updated
		 */
		}
}
}
