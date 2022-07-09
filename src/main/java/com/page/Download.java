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

/**
 * Servlet implementation class Download
 */
@WebServlet("/Download")
public class Download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Download() {
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
		if(request.getParameter("fichier")!=null) {
		String fil_niv=request.getParameter("fichier");
		response.getWriter().append("succes "+fil_niv);
		}else {
			 request.setAttribute("evas",(new Eva()).All(request.getParameter("session")));
				this.getServletContext().getRequestDispatcher("/WEB-INF/liste.jsp").forward(request, response);
		}
	}
	}

}
