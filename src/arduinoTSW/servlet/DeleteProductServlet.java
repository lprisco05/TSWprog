package arduinoTSW.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import arduinoTSW.connection.DbCon;
import arduinoTSW.dao.ProductDao;
import arduinoTSW.model.User;


@WebServlet("/delete-product")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User auth = (User) request.getSession().getAttribute("auth");
		if(!auth.getAdmin()) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/log-out");
			dispatcher.forward(request, response);
			return;
		}
		
	     try {
					Connection conn = DbCon.getConnection();
				      ProductDao productDao = new ProductDao(conn);
				        productDao.deleteProduct(Integer.parseInt( request.getParameter("id")));
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

	
	
	}

}
