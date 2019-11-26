


package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Class;
import util.DbUtil;

public class ClassDao {
	/**
	 * This gclass handles all of the Class-related methods
	 * (add/update/delete/get).
	 */

	
	private Connection connection;

	public ClassDao() {
		/**
		 * Get the database connection.
		 */
		connection = DbUtil.getConnection();
	}
	
	/**
	 * This method adds a new gclass to the database.
	 */
	
	
	public void addClass(Class gclass) {
		
		try {
		
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into classes(category,location,gdate,level) values (?, ?, ?, ? )");
			// Parameters start with 1
			preparedStatement.setString(1, gclass.getCategory());
			preparedStatement.setString(2, gclass.getLocation());
			preparedStatement.setDate(3, new java.sql.Date(gclass.getGdate()
					.getTime()));
			preparedStatement.setString(4, gclass.getLevel());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}



	public void deleteClass(int gclassid) {
		/**
		 * This method deletes a gclass from the database.
		 */
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from classes where classid=?");
			// Parameters start with 1
			preparedStatement.setInt(1, gclassid);
			preparedStatement.executeUpdate();

			PreparedStatement preparedStatement2 = connection
					.prepareStatement("delete from myClasses where classid=?");
			// Parameters start with 1
			preparedStatement2.setInt(1, gclassid);
			preparedStatement2.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateClass(Class gclass) {
		/**
		 * This method updates a gclass's information into the database.
		 */
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update classes set category=?, location=?, gdate=?, level=?"
							+ " where classid=?");
			// Parameters start with 1
			preparedStatement.setString(1, gclass.getCategory());
			preparedStatement.setString(2, gclass.getLocation());
			preparedStatement.setDate(3, new java.sql.Date(gclass.getGdate()
					.getTime()));
			preparedStatement.setString(4, gclass.getLevel());
			preparedStatement.setInt(5, gclass.getClassid());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Class> getAllClasses() {
		/**
		 * This method returns the list of all gclasses in the form of a List
		 * object.
		 */
		List<Class> gclasses = new ArrayList<Class>();
		try {
			Statement statement = connection.createStatement();
			// System.out.println("getting gclasses from table");
			ResultSet rs = statement.executeQuery("select * from classes");
			while (rs.next()) {
				Class gclass = new Class();
				gclass.setClassid(rs.getInt("classid"));
				gclass.setCategory(rs.getString("category"));
				gclass.setLocation(rs.getString("location"));
				gclass.setGdate(rs.getDate("gdate"));
				gclass.setLevel(rs.getString("level"));
				gclasses.add(gclass);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.print("classes\n");
		System.out.print(gclasses);
		return gclasses;
	}

	public Class getClassById(int gclassid) {
		/**
		 * This method retrieves a gclass by their ClassID number.
		 * 
		 * Currently not used in the sample web app, but code is left here for
		 * your review.
		 */
		Class gclass = new Class();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from classes where classid=?");
			preparedStatement.setInt(1, gclassid);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				gclass.setClassid(rs.getInt("classid"));
				gclass.setCategory(rs.getString("category"));
				gclass.setLocation(rs.getString("location"));
				gclass.setGdate(rs.getDate("gdate"));
				gclass.setLevel(rs.getString("level"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return gclass;
	}
	public void addMyClass(int gclassid, int memberid){
		/*
		 * This method adds a chosen class to a member's personal list
		 * 
		 */
		try {
			
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into myClasses(MemberId, classid) values (?, ?)");
			// Parameters start with 1
			preparedStatement.setInt(1, memberid);
			preparedStatement.setInt(2, gclassid);
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public void deleteMyClass(int gclassid,int memberid){
		/**
		 * This method deletes a gclass from the personal list.
		 */
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from myClasses where MemberId=? AND classid=?");
			// Parameters start with 1
			preparedStatement.setInt(1, memberid);
			preparedStatement.setInt(2, gclassid);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Class> getMyClasses(int memberid){
		/**
		 * This method returns the list of all myClasses in the form of a List
		 * object.
		 */
		List<Class> gclasses = new ArrayList<Class>();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from myClasses where MemberId=?");
			preparedStatement.setInt(1, memberid);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Class gclass= getClassById(rs.getInt("classid"));
				gclasses.add(gclass);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return gclasses;
	}
	
	public List<Class> getClassByKeyword(String keyword) {
		// This method gets a list of classes that matches the keyword entered

		List<Class> classes = new ArrayList<Class>();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from classes where category LIKE ? OR level LIKE ? OR location LIKE ? OR gdate LIKE ?");
			
			preparedStatement.setString(1, "%" + keyword + "%");
			preparedStatement.setString(2, "%" + keyword + "%");
			preparedStatement.setString(3, "%" + keyword + "%");
			preparedStatement.setString(4, "%" + keyword + "%");
			ResultSet rs = preparedStatement.executeQuery();
			System.out.println(preparedStatement);
			while (rs.next()) {
				Class gclass = new Class();
				gclass.setClassid(rs.getInt("classid"));
				gclass.setCategory(rs.getString("category"));
				gclass.setLevel(rs.getString("level"));
				gclass.setLocation(rs.getString("location"));
				gclass.setGdate(rs.getDate("gdate"));
		
			//	gclass.setTime(rs.getString("time"));
				classes.add(gclass);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return classes;
	}


}