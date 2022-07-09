package com.page;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.object.Eva;
import com.object.Users;
import com.object.salle;

/**
 * Servlet implementation class Examen
 */
@WebServlet("/Examen")
public class Examen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private  String fac="0";   
	
	int nbr_uv=0;
	String examen = null;
	Eva eva =new Eva();
	String sauve="ooooo";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Examen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("option","examen");
		 HttpSession session =request.getSession();
		 Users user=(Users)session.getAttribute("user");
			if(user==null) { 
				this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			}else {
		
		if(request.getParameter("examen")!=null) {
		  examen=request.getParameter("examen");
			 fac="1";
			request.setAttribute("etape",fac);
			
		}else {
		if(request.getParameter("nbre_fil")!=null || fac=="1") {
		    
		     fac="2";
		      nbr_uv=Integer.parseInt(request.getParameter("nbre_fil"));
			
			request.setAttribute("etape",fac);
			request.setAttribute("nbre_fil",nbr_uv);
			
		}else {
		
		if(fac=="2" ||request.getParameter("uv1")!=null) {
			sauve=request.getParameter("sauve");
			String[] uv=new String[nbr_uv];
			String[] etudiant=new String[nbr_uv];
			for(int i=0; i<nbr_uv; i++) {
				  uv[i]=(request.getParameter("uv"+(i+1))).toUpperCase();
			      etudiant[i]=uv[i]+" est de :"+eva.etu_nbr(uv[i]);
			}
			
			 eva =new Eva(examen,uv);
			 request.setAttribute("etudiants",etudiant);
			fac="3";
			salle salle=new salle();
			request.setAttribute("salles",salle.Allfac(uv));
			request.setAttribute("etape",fac);
			
		}else {
		if(fac=="3" || request.getParameter("salle")!=null) {
			 String[] salle=request.getParameterValues("salle");
			 eva.setSalle(salle);
			fac="4";
			request.setAttribute("etape",fac);
			request.setAttribute("affiche",eva.repartition());
		}else {
			if(fac=="4") {
				
			request.setAttribute("etape","5");
			request.setAttribute("pdfs",eva.sauve(user.getEmail()));
			}
		}
		}}}
		request.setAttribute("sauve",sauve);
		request.setAttribute("session",examen);
		request.setAttribute("nbre_fil",nbr_uv);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/Examen.jsp").forward(request, response);
	}
			
			
			
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		salle salle = new salle();
		if(request.getParameter("delete")!=null) {
			
			if(salle.delete(request.getParameter("delete"))) {
				request.setAttribute("erreur", "succes");
			}else {
				request.setAttribute("erreur", "erreur");
			}
		}
		
		if(request.getParameter("update")!=null) {
			String nom= request.getParameter("update");
			int capacite=Integer.parseInt(request.getParameter("capacite"));
			String[] fac=request.getParameterValues("fac");
			 salle= new salle(nom,capacite,fac);
			if(salle.update()) {
			request.setAttribute("erreur", "succes");
		}else {
			request.setAttribute("erreur", "erreur");
		}
			}
		doGet(request, response);
	}
	
	
	

}