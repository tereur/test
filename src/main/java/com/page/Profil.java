package com.page;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.object.Users;

/**
 * Servlet implementation class Profil
 */
@WebServlet("/Profil")
public class Profil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 HttpSession session =request.getSession();
			if(session.getAttribute("user")==null) 
				
				this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			else {
		request.setAttribute("user",(Users) session.getAttribute("user"));
		this.getServletContext().getRequestDispatcher("/WEB-INF/profil.jsp").forward(request, response);
	}}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String nom=request.getParameter("nom");
		String prenom=request.getParameter("prenom");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String mobile=request.getParameter("mobile");
		String adress=request.getParameter("adress");
		Users user=new Users();
		HttpSession session=request.getSession();
		 user=(Users) session.getAttribute("user");
		user.update(nom,prenom,email,phone,mobile,adress);
		
	    user.setEmail(email);
	    user.setNom(nom);
	    user.setPhone(phone);
	    user.setMobile(mobile);
	    user.setAdress(adress);
	    user.setPrenom(prenom);
	    session.setAttribute("user", user);
		doGet(request, response);
	}

}
