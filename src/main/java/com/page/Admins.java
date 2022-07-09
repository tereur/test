package com.page;

import java.io.EOFException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.object.Users;

/**
 * Servlet implementation class Admins
 */
@WebServlet("/Admins")
public class Admins extends HttpServlet {
	private static final long serialVersionUID = 1L;
          
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admins() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session =request.getSession();

			if(session.getAttribute("user")==null) {
				this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			}else {
			  request.setAttribute("users",((Users) session.getAttribute("user")).All());
				this.getServletContext().getRequestDispatcher("/WEB-INF/Admins.jsp").forward(request, response);
	
			}	 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Users user=new Users();	
		try {
		if(request.getParameter("add")!=null) {
		String email =request.getParameter("email");
	    String mobile=request.getParameter("mobile");
	    String role=request.getParameter("role");
	 
	     if(user.newusers(email,mobile,role)) 
	    	 request.setAttribute("erreur", "succes");
	     else
	    	 request.setAttribute("erreur", "erreur");
		
	}
	
	
	if(request.getParameter("delete")!=null) {
		
		if(user.delete(request.getParameter("delete"))) {
			request.setAttribute("erreur2", "succes");
		}else {
			request.setAttribute("erreur2", "erreur");
		}
	}
	
if(request.getParameter("compte")!=null) {
		System.out.print(request.getParameter("compte"));
		if(user.promu(request.getParameter("role"),request.getParameter("compte"))) {
			request.setAttribute("erreur2", "succes");
		}else {
			request.setAttribute("erreur2", "erreur");
		}
	}
	}catch(Exception e) {
		request.setAttribute("erreur2", "erreur");
		System.out.println("erreur a :"+ e.getMessage());
		
	}

doGet(request, response);
	
	}
	
}
