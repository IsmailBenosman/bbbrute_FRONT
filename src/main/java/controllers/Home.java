package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import compte.Compte;
import util.Context;

@WebServlet("/home")
public class Home extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ALLO");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			List<Compte> comptes = Context.getSingleton().getDAOCompte().findAll();
			System.out.println(comptes);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
