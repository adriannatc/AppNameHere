package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import dao.*;

/**
 * Servlet implementation for LoginController.
 * 
 * This class handles the login servlet and assigns session attributes for users
 * who succesfully log into the system.
 */
@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		/**
		 * Retrieve the entered username and password from the login.jsp form.
		 */
		Admin admin = new Admin();
		admin.setUsername(request.getParameter("un"));
		admin.setPassword(request.getParameter("pw"));

		try {
			/**
			 * Try to see if the admin can log in.
			 */
			admin = AdminDao.login(admin);

			/**
			 * If the isValid value is true, assign session attributes to the
			 * current admin.
			 */
			if (admin.isValid()) {

				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionadmin", admin);
				session.setAttribute("username", admin.getUsername());
				session.setAttribute("firstname", admin.getFirstName());
				session.setAttribute("lastname", admin.getLastName());
				/**
				 * Redirect to the admins-only home page.
				 */
				response.sendRedirect("adminLogged.jsp");

				/**
				 * Set a timeout variable of 900 seconds (15 minutes) for this
				 * admin who has logged into the system.
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
}
