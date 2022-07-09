package com.page;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.object.salle;

/**
 * Servlet implementation class Salle
 */
@WebServlet("/Salle")
public class Salle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Salle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setAttribute("option","room");
		if(request.getSession().getAttribute("user")==null) { 
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	    }else {
		salle salle=new salle();
		request.setAttribute("salles",salle.All());
		this.getServletContext().getRequestDispatcher("/WEB-INF/salle.jsp").forward(request, response);
		}
	   }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		salle salle = new salle();
		try {
			if(request.getParameter("add")!=null) {
		String nom= request.getParameter("nom");
		int capacite=Integer.parseInt(request.getParameter("capacite"));
		String[] fac=request.getParameterValues("fac");
		 salle= new salle(nom,capacite,fac);
		
		if(salle.sauve()) {
			request.setAttribute("erreur", "succes");
		}else {
			request.setAttribute("erreur", "erreur");
		}
		request.setAttribute("erreur", "succes");
			}
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
			
		}catch(Exception e) {
			request.setAttribute("erreur", "erreur");
			System.out.println("erreur a :"+ e.getMessage());
			
		}
		doGet(request, response);
	}

}
