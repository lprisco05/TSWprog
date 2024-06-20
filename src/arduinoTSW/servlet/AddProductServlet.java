package arduinoTSW.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import arduinoTSW.connection.DbCon;


@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String category = request.getParameter("category");
        String image = request.getParameter("image");
        
        
        String sql = "INSERT INTO products (name, category, price, image) VALUES (?, ?, ?, ?)";
		try  {
			Connection con = DbCon.getConnection();
			PreparedStatement statement = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			statement.setString(1, name);
			statement.setString(2, category);
			statement.setDouble(3, price);
			statement.setString(4, image);

			int rowsInserted = statement.executeUpdate();
			  if (rowsInserted > 0) {
	                ResultSet generatedKeys = statement.getGeneratedKeys();
	                if (generatedKeys.next()) {
	                    int itemId = generatedKeys.getInt(1);
	                    System.out.println("Item registered with ID: " + itemId);
	                }
	            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
