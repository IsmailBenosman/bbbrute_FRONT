package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import module.Modules;
import compte.Compte;
import compte.Eleve;
import util.Context;

	@WebServlet("/profil")
	public class ProfilController extends HttpServlet {
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			if(request.getParameter("id")==null) 
			{
				Integer id = ((Compte) request.getSession().getAttribute("connected")).getId();
				List<Modules> uE= Context.getSingleton().getDAOModules().findAllById(id);
				request.setAttribute("listeModule", uE);
				request.getRequestDispatcher("/WEB-INF/profil.jsp").forward(request, response);
			}
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			doGet(request, response);
		}

	}
