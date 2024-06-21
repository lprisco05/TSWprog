package arduinoTSW.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import arduinoTSW.connection.DbCon;
import arduinoTSW.model.User;


@WebServlet("/registration")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterServlet() {

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = DbCon.getConnection();
			String nomeUtente= request.getParameter("login-name");
			String emailUtente= request.getParameter("login-email");
			String passUtente= request.getParameter("login-password");
			
			
			String query = "INSERT INTO users (name, email, password, admin) VALUES (?, ?, ?, ?)"; //prevent injections
			PreparedStatement statement = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, nomeUtente);
		    statement.setString(2, emailUtente);
		    statement.setString(3, passUtente);
		    statement.setBoolean(4, false);
			
			
		    int rows = statement.executeUpdate();

            if (rows > 0) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int userId = generatedKeys.getInt(1);
                }
            }
            statement.close();

	       
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rqd = request.getRequestDispatcher("/user-login");
        rqd.forward(request, response);

	}

}
