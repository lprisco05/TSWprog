package arduinoTSW.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CashOut")
public class CreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreditCardServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		if ((request.getParameter("nome") != null) && (request.getParameter("cognome") != null)
				&& (request.getParameter("indirizzo") != null) && (request.getParameter("citta") != null)
				&& (request.getParameter("cap") != null)

		) {// TODO fa un controllo su op
			request.getSession().setAttribute("carta", "true");
			String richiesta = (String) request.getSession().getAttribute("op");
			System.out.println("letto op:" + richiesta);

			try {
				RequestDispatcher rd = request.getRequestDispatcher(richiesta);
				rd.include(request, response);
				return;
			} catch (NullPointerException e) {
				response.sendRedirect("index.jsp");
			}

		} else {
			response.sendRedirect("cart.jsp");
		}

	}

}
