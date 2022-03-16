package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import compte.Admin;
import compte.Compte;
import compte.Eleve;
import compte.Prof;
import util.Context;

/**
 * Servlet implementation class Home
 */
@WebServlet("/home")
public class Home extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		Compte c = Context.getSingleton().getDAOCompte().seConnecter(login, password);
		
		
		if(c instanceof Eleve) 
		{
			request.getSession().setAttribute("connected", c);
			response.sendRedirect("eleve");
		}
		else if(c instanceof Prof) 
		{
			request.getSession().setAttribute("connected", c);
			response.sendRedirect("prof");
		}
			
		else if(c instanceof Admin) 
		{
			request.getSession().setAttribute("connected", c);
			response.sendRedirect("admin");
		}

		
		else 
		{
			request.setAttribute("error", "Identifiants invalides !");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	
	}

}
