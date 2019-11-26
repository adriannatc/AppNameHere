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
import model.Class;
import controller.*;
import util.*;

public class MemberDao {

	/**
	 * This class handles the Member objects and the login component of the web
	 * app.
	 */
	static Connection currentCon = null;
	static ResultSet rs = null;

	public MemberDao() {
		/**
		 * Get the database connection.
		 */
		currentCon = DbUtil.getConnection();
	}
	

	
	public void addMember(Member member) throws SQLException {
		/** edit for the member method
		 * 
		 */
		
		System.out.println("in add Member class");
		//try {
			PreparedStatement preparedStatement = currentCon
			.prepareStatement("insert into members(FirstName,LastName,Email,Username,Password) values (?, ?, ?, ?, ?)");
			// Parameters start with 1
			preparedStatement.setString(1, member.getFirstName());
			preparedStatement.setString(2, member.getLastName());
			preparedStatement.setString(3, member.getEmail());
			preparedStatement.setString(4, member.getUsername());
			preparedStatement.setString(5, member.getPassword());

			preparedStatement.executeUpdate();

			System.out.println("successful update");
//		}catch (SQLException e) {
//			e.printStackTrace();
//		}
		
	}
	
	public void updateMember(Member member) throws SQLException  {
		/**
		 * This method updates a gclass's information into the database.
		 */
		
		System.out.println("*****update Member: "+member.getid());
		try {
			PreparedStatement preparedStatement = currentCon
					.prepareStatement("update members set FirstName=?, LastName=?, Email=?, Password=?"
							+ " where memberid=?");
			// Parameters start with 1
			preparedStatement.setString(1, member.getFirstName());
			preparedStatement.setString(2, member.getLastName());
			preparedStatement.setString(3, member.getEmail());
			preparedStatement.setString(4, member.getPassword());
			preparedStatement.setInt(5, member.getid());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	
	public static Member login(Member member) {

		/**
		 * This method attempts to find the member that is trying to log in by
		 * first retrieving the username and password entered by the user.
		 */
		Statement stmt = null;

		String username = member.getUsername();
		String password = member.getPassword();

		/**
		 * Prepare a query that searches the members table in the database
		 * with the given username and password.
		 */
		String searchQuery = "select * from members where username='"
				+ username + "' AND password='" + password + "'";

		try {
			// connect to DB
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();

			/**
			 * If there are no results from the query, set the member to false.
			 * The person attempting to log in will be redirected to the home
			 * page when isValid is false.
			 */
			
			if (!more) {
				member.setValid(false);
			}

			/**
			 * If the query results in an database entry that matches the
			 * username and password, assign the appropriate information to
			 * the Member object.
			 */
			else if (more) {
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				int memberid = Integer.parseInt(rs.getString("MemberID"));
				String email = rs.getString("Email");
				member.setFirstName(firstName);
				member.setLastName(lastName);
				member.setEmail(email);
				System.out.println("MEMBER DAO: "+ memberid);
				member.setid(memberid);
				member.setValid(true);
			}
		}

		catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! "
					+ ex);
		}
		/**
		 * Return the Member object.
		 */
		return member;

	}
}
