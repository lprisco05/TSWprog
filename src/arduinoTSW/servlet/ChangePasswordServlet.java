package arduinoTSW.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import arduinoTSW.connection.DbCon;
import arduinoTSW.model.User;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = DbCon.getConnection();
			User auth = (User) request.getSession().getAttribute("auth");
			
			String query = "UPDATE users SET password = ? WHERE id= ?"; //prevent injections
			PreparedStatement pst = con.prepareStatement(query);
			String nuovaPassword=(String) request.getParameter("newPassword");
			if(nuovaPassword==null) 
				throw new SQLException();
			pst.setString(1, nuovaPassword);
			pst.setString(2, String.valueOf(auth.getId()));
			
			pst.executeUpdate();
			
	
	        pst.close();
	        response.sendRedirect("user.jsp");

	       
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
