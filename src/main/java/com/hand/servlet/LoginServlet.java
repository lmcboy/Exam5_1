package com.hand.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila","mc","123456");
			String sql = "SELECT first_name,last_name FROM customer"
						+ " WHERE first_name = '" + name + "' and last_name = '" + password + "'" ;
			Statement st;
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				System.out.println("成功");
				String sql1 = "SELECT customer_id,first_name,last_name,address,email,customer_id,c.last_update"
						+ " FROM customer c,address a"
						+ " WHERE c.address_id = a.address_id "
						+ " and c.active = 1 limit 7";
				rs = st.executeQuery(sql1);
				request.setAttribute("customers", rs);
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				request.getSession().setAttribute("user", name);
				rd.forward(request, response);
			}
			else{
				System.out.println("错误");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				request.getSession().removeAttribute("user");
				request.setAttribute("msg", "登录失败！密码或用户名错误。");
				rd.forward(request, response);
				
			}
			conn.close();
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
