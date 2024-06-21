package arduinoTSW.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import arduinoTSW.connection.DbCon;
import arduinoTSW.dao.ProductDao;
import arduinoTSW.model.Product;

@WebServlet("/update-product")
public class UpdateProductServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
	        String name = request.getParameter("name");
	        double price = Double.parseDouble(request.getParameter("price"));
	        String category = request.getParameter("category");
	        String image = request.getParameter("image");

	        // Crea un oggetto Product con i nuovi dati
	        Product product = new Product(id, name, category, price, image);

	        // Aggiorna il prodotto nel database
	        try {
				Connection conn = DbCon.getConnection();
			      ProductDao productDao = new ProductDao(conn);
			        productDao.updateProduct(product);
					response.sendRedirect("index.jsp");

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	  
	
	
	}

}
