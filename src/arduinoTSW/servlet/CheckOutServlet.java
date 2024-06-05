package arduinoTSW.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import arduinoTSW.connection.DbCon;
import arduinoTSW.dao.OrderDao;
import arduinoTSW.model.*;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			SimpleDateFormat formatData = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();

			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

			User user = (User) request.getSession().getAttribute("auth");

			if (cart_list != null && user != null) {
				if (request.getSession().getAttribute("carta") == null) {
					request.getSession().setAttribute("op", "/cart-check-out");
					response.sendRedirect("details.jsp");
					return;
				}

				for (Cart c : cart_list) {
					Order order = new Order();
					order.setId(c.getId());
					order.setUid(user.getId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatData.format(date));

					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.insertOrder(order);
					if (!result) {
						break;
					}
				}

				cart_list.clear();
				request.getSession().removeAttribute("op");
				request.getSession().removeAttribute("carta");

				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
				return;

			} else {
				if (user == null) {
					response.sendRedirect("login.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
