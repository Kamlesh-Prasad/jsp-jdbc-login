package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DatabaseConnection implements MySqlDatabase, OracleDatabase{
	static Connection con=null;
	public static Connection getOracleConnection() {
		try {
			System.out.println("OracleDriver"+driver);
			Class.forName(driver);
			con=DriverManager.getConnection(url, username, password);
			if (con!=null) {
				System.out.println("Database Connected");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	
	public static Connection getMySqlConnection() {
		try {
			
			Class.forName(sqldriver);
			con=DriverManager.getConnection(sqlurl+sqldbName, sqldbUser, sqldbPassword);
			if (con!=null) {
				System.out.println("MySql Database Connected");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("Error: unable to load driver class!");
			System.out.println(e);
			System.exit(1);
		} catch (SQLException e) {
			System.out.println("Error: While Creating connection to database");
			System.out.println(e);
		}
		return con;
	}
	
	public static boolean createMySqlDB() {
		boolean status = false;
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName(sqldriver);			
			conn=DriverManager.getConnection(sqlurl, sqldbUser, sqldbPassword);
			System.out.println("Database Connected"+conn);
			stmt = conn.createStatement();

			String sql = "CREATE DATABASE IF NOT EXISTS exam;";
			stmt.executeUpdate(sql);
			System.out.println("Success : Creating Database");
			status = true;
		} catch (Exception e) {
			status = false;
			System.out.println("Error : While Creating Database");
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			} // nothing we can do
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				System.out.println("Error : While Closing Connection");
			}
		}
		return status;
	}

	/**
	 * Creates the users table if it doesn't exist in the database
	 * 
	 * @return status of type boolean
	 */
	public static boolean userTable() {

		boolean status = false;
		Connection con = getMySqlConnection();
		try {
			Statement st = con.createStatement();
			
			String sql = "CREATE TABLE IF NOT EXISTS users2020 (\r\n" + 
					"         Sno    INT UNSIGNED  NOT NULL AUTO_INCREMENT,\r\n" + 
					"         Name   VARCHAR(30)       NOT NULL DEFAULT '',\r\n" + 
					"         Email         VARCHAR(28)   NOT NULL DEFAULT '',\r\n" + 
					"         Mobile     INT UNSIGNED  NOT NULL DEFAULT 0,\r\n" + 
					"         Username         VARCHAR(14)   NOT NULL DEFAULT '',\r\n" + 
					"   Password         VARCHAR(16)   NOT NULL DEFAULT '',\r\n" + 
					"         PRIMARY KEY  (Sno)\r\n" + 
					"       );";
			String sql2="ALTER TABLE users2020 ADD UNIQUE(username);";

			st.executeUpdate(sql);
			st.executeUpdate(sql2);
			status = true;
		} catch (SQLException sqe) {
			System.out.println("Error : While Creating Table (Table Already Exists)");
			sqe.printStackTrace();
			status = false;
		}

		try {
			con.close();
		} catch (SQLException se) {
			System.out.println("Error : While Closing Connection");
		}

		return status;
	}

	public static boolean examTable() {

		boolean status = false;
		Connection con = getMySqlConnection();
		try {
			Statement st = con.createStatement();
			String sql = "CREATE TABLE IF NOT EXISTS users"
					+ "(username VARCHAR(100), password VARCHAR(100), email VARCHAR(100), java INT(10),"
					+ " javascript INT(10),  sequel INT(10),  python INT(10),  css INT(10),  php INT(10),  c INT(10),  ruby INT(10));";
			String sql2="ALTER TABLE users ADD UNIQUE(username);";

			st.executeUpdate(sql);
			st.executeUpdate(sql2);
			status = true;
		} catch (SQLException sqe) {
			System.out.println("Error : While Creating Table (Table Already Exists)");
			sqe.printStackTrace();
			status = false;
		}

		try {
			con.close();
		} catch (SQLException se) {
			System.out.println("Error : While Closing Connection");
		}

		return status;
	}
	
	public static boolean resultTable() {

		boolean status = false;
		Connection con = getMySqlConnection();
		try {
			Statement st = con.createStatement();
			String sql = "CREATE TABLE IF NOT EXISTS users"
					+ "(username VARCHAR(100), password VARCHAR(100), email VARCHAR(100), java INT(10),"
					+ " javascript INT(10),  sequel INT(10),  python INT(10),  css INT(10),  php INT(10),  c INT(10),  ruby INT(10));";
			String sql2="ALTER TABLE users ADD UNIQUE(username);";

			st.executeUpdate(sql);
			st.executeUpdate(sql2);
			status = true;
		} catch (SQLException sqe) {
			System.out.println("Error : While Creating Table (Table Already Exists)");
			sqe.printStackTrace();
			status = false;
		}

		try {
			con.close();
		} catch (SQLException se) {
			System.out.println("Error : While Closing Connection");
		}

		return status;
	}
}
