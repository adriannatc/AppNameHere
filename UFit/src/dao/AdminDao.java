package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DbUtil;
import model.*;
import controller.*;

import util.*;

public class AdminDao {

	/**
	 * This class handles the Admin objects and the login component of the web
	 * app.
	 */
	static Connection currentCon = null;
	static ResultSet rs = null;

	public static Admin login(Admin admin) {

		/**
		 * This method attempts to find the admin that is trying to log in by
		 * first retrieving the username and password entered by the user.
		 */
		Statement stmt = null;

		String username = admin.getUsername();
		String password = admin.getPassword();

		/**
		 * Prepare a query that searches the admins table in the database
		 * with the given username and password.
		 */
		String searchQuery = "select * from admins where username='"
				+ username + "' AND password='" + password + "'";

		try {
			// connect to DB
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();

			/**
			 * If there are no results from the query, set the admin to false.
			 * The person attempting to log in will be redirected to the home
			 * page when isValid is false.
			 */
			
			if (!more) {
				admin.setValid(false);
			}

			/**
			 * If the query results in an database entry that matches the
			 * username and password, assign the appropriate information to
			 * the Admin object.
			 */
			else if (more) {
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");

				admin.setFirstName(firstName);
				admin.setLastName(lastName);
				admin.setValid(true);
			}
		}

		catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! "
					+ ex);
		}
		/**
		 * Return the Admin object.
		 */
		return admin;

	}
}
