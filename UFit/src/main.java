import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import util.DbUtil;


public class main {

	public static void main(String[] args) {
		System.out.print("hello");
		String username = "a";
		String password = "a";
	
		String searchQuery = "select * from users where username='"
				+ username + "' AND password='" + password + "'";

		try {
			// connect to DB
			Connection currentCon = util.DbUtil.getConnection();
			//Statement stmt = currentCon.createStatement();
			//ResultSet rs = stmt.executeQuery(searchQuery);
		}
//			while (rs.next()) {
//			        String columnValue = rs.getString("username");
//			        System.out.print(columnValue);
//			    
//			    System.out.println("");
//			}

		catch (Exception ex) {
			System.out.println("Error: "
					+ ex);
		}
	}

}
