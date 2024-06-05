package arduinoTSW.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import arduinoTSW.connection.DbCon;
import arduinoTSW.model.Cart;
import arduinoTSW.model.Order;
import arduinoTSW.model.User;
import arduinoTSW.dao.OrderDao;

@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			System.out.println("boh ecco credit-card:" + request.getSession().getAttribute("carta"));


				SimpleDateFormat formatData = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();
				User user = (User) request.getSession().getAttribute("auth");
				if (user != null) {
					
					if (request.getSession().getAttribute("carta") == null) {
						request.getSession().setAttribute("op", "/order-now");
						request.getSession().setAttribute("quantity", request.getParameter("quantity"));
						request.getSession().setAttribute("id", request.getParameter("id"));	
						response.sendRedirect("details.jsp");
						return;

					}

					 else if (request.getSession().getAttribute("carta") != null) {
						System.out.println("sono di nuovo in ordernowservlet, e credit-card ="
								+ request.getSession().getAttribute("carta"));
					
					
					
					String productID = (String) request.getSession().getAttribute("id");
					int quantity = Integer.parseInt((String)request.getSession().getAttribute("quantity"));
					if (quantity <= 0)
						quantity = 1;

					Order order = new Order();
					order.setId(Integer.parseInt(productID));
					order.setUid(user.getId());
					order.setQuantity(quantity);
					order.setDate(formatData.format(date));

					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);
					System.out.println("trovato result");
					if (result) {
						ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
						if (cart_list != null) {
							for (Cart c : cart_list) {
								if (c.getId() == Integer.parseInt(productID)) {
									cart_list.remove(cart_list.indexOf(c));
									break;
								}
							}
						}
						
						if (true) {
							System.out.println("rimossa carta");
							request.getSession().removeAttribute("carta");
						}
						request.getSession().removeAttribute("op");
						request.getSession().removeAttribute("quantity");
						request.getSession().removeAttribute("id");
						System.out.println("rimosso attributo op");
						RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
						rd.include(request, response);
						return;
					} else {
						out.println("order failed :(");
					}
					 }

				} else {
					response.sendRedirect("login.jsp");
				}


			
	

		} catch (ClassNotFoundException e) {

			e.printStackTrace();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}