package clothstore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clothstore.connection.DbCon;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uemail = request.getParameter("email");
		String umobile = request.getParameter("mobile");
		String upwd = request.getParameter("newpassword");
		
		int check=0;
		try {
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("select * from users where uemail='"+uemail+"' and umobile='"+umobile+"'");
			while(rs.next()) {
				check=1;
				st.executeUpdate("update users set upwd='"+upwd+"' where umobile='"+umobile+"'");
				response.sendRedirect("forgotPassword.jsp?msg=done");
				
			}
			if(check==0) {
				response.sendRedirect("forgotPassword.jsp?msg=invalid");
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

}
