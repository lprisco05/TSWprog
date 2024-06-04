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

/**
 * Servlet implementation class OrderNowServlet
 */
@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException {
    try (PrintWriter out = response.getWriter()) {
    	
    	
    	
    	
    	
      SimpleDateFormat formatData = new SimpleDateFormat("yyyy-MM-dd");
      Date date = new Date();
      User user = (User) request.getSession().getAttribute("auth");
      if (user != null) {
        String productID = request.getParameter("id");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        if (quantity <= 0)
          quantity = 1;

        Order order = new Order();
        order.setId(Integer.parseInt(productID));
        order.setUid(user.getId());
        order.setQuantity(quantity);
        order.setDate(formatData.format(date));

        OrderDao oDao = new OrderDao(DbCon.getConnection());
        boolean result = oDao.insertOrder(order);

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
        	response.sendRedirect("orders.jsp");
        } else {
        	out.println("order failed :(");
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