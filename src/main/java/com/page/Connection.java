package com.page;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.object.Users;

/**
 * Servlet implementation class Connection
 */
@WebServlet("/Connection")
public class Connection extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private static HashMap<String, String> map = new HashMap<String, String>();
//	private static Context ctx ;
//	private static int i=0;
   /**
     * @see HttpServlet#HttpServlet()
     */
    public Connection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 **/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String lgn =request.getParameter("login");
		String pswd =request.getParameter("pswd");
		Users users=new Users();
		if(users.authentifie(lgn, pswd)) {
			request.setAttribute("option","home");
			 HttpSession session =request.getSession();
			 users.recuper(lgn, pswd);
			 session.setAttribute("user",users);
				session.setAttribute("login", lgn);
				session.setAttribute("password", pswd);
				request.setAttribute("session",session.getAttribute("login"));
			
//			try {
//				ctx = new InitialContext();
//			map.put("email"+i,users.getEmail());
//			i++;
//				ctx.rebind("ListeUtilisateur",map);
//				for(Map.Entry mapentry: map.entrySet()) {
//					System.out.println("\ncles: "+mapentry.getKey()+" values:"+(mapentry.getValue()));
//				}
//			} catch (NamingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			request.setAttribute("erreur","login ou mot de passe incorrect");
		request.setAttribute("login",lgn);
		request.setAttribute("password",pswd);
			this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);	
	}
			
	}

}
