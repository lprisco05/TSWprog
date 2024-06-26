package arduinoTSW.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import arduinoTSW.connection.DbCon;
import arduinoTSW.dao.UserDao;
import arduinoTSW.model.User;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		
		try
		{
			
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
					
			try {
				UserDao udao = new UserDao(DbCon.getConnection());
				User user = udao.userLogin(email,password);
				
				if(user != null)
				{
					request.getSession().removeAttribute("carta");
					request.getSession().setAttribute("auth", user);
					response.getWriter().write("success");
					//response.sendRedirect("index.jsp");
					
				}
				else {
	                response.getWriter().write("failure");

				}
				
				
			
			} catch (ClassNotFoundException | SQLException e) {
				
				response.getWriter().write("error");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		
	}

}
