package clothstore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clothstore.connection.DbCon;

/**
 * Servlet implementation class editProductServlet
 */
@WebServlet("/edit-Product")
public class editProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String price = request.getParameter("price");
		String image = request.getParameter("image");
		
		try {
			Connection con = DbCon.getConnection();
			Statement st=con.createStatement();
			st.executeUpdate("update products set name='"+name+"',category='"+category+"',price='"+price+"',image='"+image+"' where id='"+id+"' ");
			
			response.sendRedirect("editProduct.jsp?msg=done");

			
		}catch (Exception e) {
			response.sendRedirect("editProduct.jsp?wrong=done");

		}
	
	}

}
