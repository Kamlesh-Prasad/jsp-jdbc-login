package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import database.DatabaseConnection;

@WebServlet("/checkRegister")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Register() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fullname=request.getParameter("name");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println(fullname);
		System.out.println(email);
		System.out.println(mobile);
		System.out.println(username);
		System.out.println(password);
		
		
		//Create the DB if non-existent
		DatabaseConnection.createMySqlDB();
		// Create the table in the database if non-existent
		DatabaseConnection.userTable();	
		
		Connection con=DatabaseConnection.getMySqlConnection();
		boolean error = false;
		String sql = "INSERT INTO users2020 (Sno, Name, Email, Mobile, Username, Password) VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, null);
			pst.setString(2, fullname);
			pst.setString(3, email);
			pst.setString(4, mobile);
			pst.setString(5, username);
			pst.setString(6, password);
			pst.execute(sql);
			error = false;
		} catch (SQLException e) {
			System.out.println(e);
			error = true;
		}
		
		try {
			con.close();
		} catch (SQLException se) {
			System.out.println("Error : While Closing Connection");
			error = true;
		}
		request.setAttribute("newUser", username);

		if (!error) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Login-Application1");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
			dispatcher.forward(request, response);
		}
			
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

}
