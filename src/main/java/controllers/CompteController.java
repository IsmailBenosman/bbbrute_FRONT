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
import compte.Prof;
import util.Context;

@WebServlet("/compte")
public class CompteController extends HttpServlet {

	//FindById + FindAll()
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//findAll()
		if(request.getParameter("id")==null) 
		{
			List<Compte> comptes=Context.getSingleton().getDAOCompte().findAll();
			request.setAttribute("listeCompte", comptes);
			getServletContext().getRequestDispatcher("/WEB-INF/comptes.jsp").forward(request, response);
		}
		//findById
		else 
		{
			int id = Integer.parseInt(request.getParameter("id"));
			Compte compte = Context.getSingleton().getDAOCompte().findById(id);
			if(compte instanceof Eleve) 
			{
				Eleve e = (Eleve) compte;
				request.setAttribute("eleve", e);
				getServletContext().getRequestDispatcher("/WEB-INF/updateEleve.jsp").forward(request, response);
			}
			else if(compte instanceof Prof) {
				Prof p = (Prof) compte;
				request.setAttribute("prof", p);
				getServletContext().getRequestDispatcher("/WEB-INF/updateProf.jsp").forward(request, response);
			}
			
			
		}

		

	}

//
//	//Update / Insert / Delete
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		if(request.getParameter("tache").equals("insert")) 
//		{
//			if(request.getParameter("typeCompte").equals("Eleve")) 
//			{
//
//				Eleve c = new Eleve(request.getParameter("login"),request.getParameter("login"),request.getParameter("password"),request.getParameter("tel"),request.getParameter("numero"),request.getParameter("voie"),request.getParameter("ville"),request.getParameter("cp"));
//				Context.getSingleton().getDAOCompte().insert(c);
//			}
//			else if(request.getParameter("typeCompte").equals("Prof"))
//			{
//				Prof s = new Prof(request.getParameter("login"),request.getParameter("password"),request.getParameter("metier"));
//				Context.getSingleton().getDAOCompte().insert(s);
//			}
//			
//			//sinon c'est le Prof qui fait un nouveau compte
//			if(request.getSession().getAttribute("connected")!=null) 
//			{
//				response.sendRedirect("compte");
//			}
//			
//			//Si on est pas encore connecté, c'est une inscription
//			else {
//				response.sendRedirect("home");
//			}
//			
//			
//		}
//
//		else if(request.getParameter("tache").equals("update")) 
//		{
//			int id = Integer.parseInt(request.getParameter("id"));
//			int version = Integer.parseInt(request.getParameter("version"));
//			if(request.getParameter("typeCompte").equals("Eleve")) 
//			{
//				Eleve c = new Eleve(id,request.getParameter("login"),request.getParameter("password"),request.getParameter("tel"),request.getParameter("numero"),request.getParameter("voie"),request.getParameter("ville"),request.getParameter("cp"));
//				c.setVersion(version);
//				Context.getSingleton().getDAOCompte().update(c);
//			}
//			else if(request.getParameter("typeCompte").equals("Prof"))
//			{
//				Prof s = new Prof(id,request.getParameter("login"),request.getParameter("password"),request.getParameter("metier"));
//				s.setVersion(version);
//				Context.getSingleton().getDAOCompte().update(s);
//				
//			}
//			
//			response.sendRedirect("compte");
//		}
//
//		else if(request.getParameter("tache").equals("delete"))
//		{
//			int id = Integer.parseInt(request.getParameter("id"));
//			Context.getSingleton().getDAOCompte().delete(id);
//			response.sendRedirect("compte");
//		}
//
//		
//

	}

}
