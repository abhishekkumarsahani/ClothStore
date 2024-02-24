package clothstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import clothstore.model.copy.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/add-to-cart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList = new ArrayList<>();
			
			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session = request.getSession();
			session.getAttribute("cart-list");
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("index.jsp");
	
			}else {
				cartList = cart_list;
				boolean exist = false;
				
				for(Cart c:cart_list) {
					if(c.getId()== id) {
						exist=true;
						out.print("<h3 style='color:crimson; text-align:center'>Item already exist in Cart.<a href='cart.jsp'>Go to Cart Page</a>");
					}
				}
				if(!exist) {
					cartList.add(cm);
					response.sendRedirect("index.jsp");
				}
			}
		}
	}

}
