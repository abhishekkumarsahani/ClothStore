package clothstore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNewProduct
 */
@WebServlet("/add-new-product")
public class AddNewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			String price = request.getParameter("price");
			String image = request.getParameter("image");
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clothstore","root","");
				PreparedStatement pst = con.prepareStatement("insert into products values(?,?,?,?,?)");
				pst.setString(1, id);
				pst.setString(2, name);
				pst.setString(3, category);
				pst.setString(4, price);
				pst.setString(5, image);
				
				pst.executeUpdate();
				response.sendRedirect("addNewProduct.jsp?msg=done");
				
			}catch (Exception e) {
				response.sendRedirect("addNewProduct.jsp?msg=wrong");
			}
	}

}
