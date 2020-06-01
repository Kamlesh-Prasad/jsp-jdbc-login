package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import database.DatabaseConnection;
@WebServlet("/userlogin")
public class userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session=null;
	
    public userlogin() {super();}
    
    public void init(ServletConfig config) throws ServletException {
    	System.out.println("Database Connecting Process");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("User Login Process");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String process=request.getParameter("userlogin");
		
		if(process.equals("UserRequest"))
		{
			session=request.getSession();
			
			if (validateUser(username,password)&&session!=null) {
				System.out.println("User Login Successfull");
				
			}else {
				System.out.println("Unathorized Access ?");
			}
		}
		else {
			response.sendRedirect("/collage-exam");
		}
	}

	private boolean validateUser(String username, String password) {
		boolean status=false;
		String query="SELECT * FROM QUIZ_USER WHERE EMAIL=? AND PASSWORD=?";
    	Connection con=DatabaseConnection.getOracleConnection();

		try {
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{	
			User profile=new User();
			profile.setId(rs.getInt(1));
			profile.setFirstName(rs.getString(2));
			profile.setMiddilName(rs.getString(3));
			profile.setLastName(rs.getString(4));
			profile.setEmail(rs.getString(5));
			profile.setMobile(rs.getString(6));
			profile.setAddress(rs.getString(7));
			profile.setUsername(rs.getString(8));
			profile.setPassword(rs.getString(9));
			session.setAttribute("profile", profile);
			session.setAttribute("username", rs.getString(2));				
			status=true;
			con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	/*
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
