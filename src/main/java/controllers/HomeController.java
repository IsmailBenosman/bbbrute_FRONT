package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Client;

import compte.Compte;
import compte.Eleve;
import compte.Prof;
import util.Context;


@WebServlet("/home")
public class HomeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String mail = request.getParameter("login");
		String password = request.getParameter("password");
		
		Compte connected=Context.getSingleton().getDAOCompte().seConnecter(mail,password);
		
		request.getSession().setAttribute("connected", connected);
		
		if(connected instanceof Eleve) {response.sendRedirect("AccueilESpt.jsp");}

		else if(connected instanceof Prof) {response.sendRedirect("AccueilPPs.jsp");}

		else 
		{
			request.setAttribute("error", "Identifiants invalides");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
		


	}
	

}
