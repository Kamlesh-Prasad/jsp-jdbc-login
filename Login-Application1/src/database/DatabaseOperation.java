package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;


public abstract class DatabaseOperation {
	
	
	
	public static boolean checkUsername(String username) {

		boolean exists = false;
		Connection con = DatabaseConnection.getMySqlConnection();

		try {
			Statement st = con.createStatement();
			String sql = "Select * from  users where username='" + username + "'";
			st.executeUpdate(sql);
			exists = true;
			st.close();
		} catch (Exception e) {
			exists = false;
		}

		if (exists) {
			System.out.println("Username already exists !");
		} else {
			System.out.println("Username is available.");
		}
		
		try {
			con.close();
		} catch (SQLException se) {
			System.out.println("Error : While Closing Connection");
		}
		
		return exists;
	}

	/**
	 * Retrieves the test results of the user
	 * 
	 * @param username
	 * @return tests of type LinkedList<Integer>
	 */

	public static LinkedList<Integer> retrieveUserData(String username) {

		LinkedList<Integer> tests = new LinkedList<>();
		Connection con = DatabaseConnection.getMySqlConnection();

		try {
			Statement st = con.createStatement();
			String sql = "Select * from users where username='" + username + "'";

			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				tests.add(rs.getInt("java"));
				tests.add(rs.getInt("javascript"));
				tests.add(rs.getInt("sequel"));
				tests.add(rs.getInt("python"));
				tests.add(rs.getInt("css"));
				tests.add(rs.getInt("php"));
				tests.add(rs.getInt("c"));
				tests.add(rs.getInt("ruby"));
			}

			st.close();
		} catch (Exception e) {
			System.out.println("Error : Cannot Retrieve User Data!");
			System.out.println(e);
		}

		return tests;
	}
}
