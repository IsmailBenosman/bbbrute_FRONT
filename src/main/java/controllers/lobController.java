package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import compte.Admin;
import util.Context;

@WebServlet("/lobTest")
@MultipartConfig
public class lobController extends HttpServlet {

   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Admin a = (Admin) Context.getSingleton().getDAOCompte().findById(id);
		request.setAttribute("profil", a);
		request.getRequestDispatcher("/WEB-INF/showLob.jsp").forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin a = new Admin("Abid", "Jordan", "jordan", "jordan", LocalDate.parse("1993-02-23"), 900000000,"Griffondor");
		 
		 Part filePart = request.getPart("file"); //Recup le fichier qu'on upload
		
		
		 InputStream fileContent = filePart.getInputStream();
		 
		 a.setPhoto(fileContent.readAllBytes());
		 
		 System.out.println(a.getPhotoEncoded64().length());
		 Context.getSingleton().getDAOCompte().insert(a);
		 
		 response.sendRedirect("lobTest?id=7");
	}
	

}
