package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import compte.Compte;
import compte.Eleve;
import util.Context;

@WebServlet("/eleves")
public class Mes_ELEVES extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//findAll()
		if(request.getParameter("id")==null) 
		{
			String maison = ((Compte) request.getSession().getAttribute("connected")).getMaison();
			List<Eleve> Groupe=Context.getSingleton().getDAOEleve().findAll(); 
			request.setAttribute("listeEleves", Groupe);
			getServletContext().getRequestDispatcher("/WEB-INF/liste_eleves.jsp").forward(request, response);
			
		}
		//findById
		else 
		{
			/*int id = Integer.parseInt(request.getParameter("id"));
			EleveController el = Context.getSingleton().getDAOEleve().findById(id);
			request.setAttribute("eleve", el);
			getServletContext().getRequestDispatcher("/WEB-INF/updateAnimal.jsp").forward(request, response);*/
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
