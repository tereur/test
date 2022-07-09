package com.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.object.UV;

/**
 * Servlet implementation class ValidateUV
 */
@WebServlet("/ValidateUV")
public class ValidateUV extends HttpServlet implements javax.servlet.Servlet{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateUV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
            if(request.getParameter("valeur")!=null) {
		       UV uv=new UV(request.getParameter("valeur"));
		    if (!uv.recherche((request.getParameter("valeur")).toUpperCase())) {
		    	 response.getWriter().write("invalide");
		    }else {
		    	 response.getWriter().write("valide");	
		    }
            }
            if(request.getParameter("valeur2")!=null) {
 		       UV uv=new UV(request.getParameter("valeur2"));
 		    if (uv.confirme_sauve((request.getParameter("valeur2")).toUpperCase())) {
 		    	 response.getWriter().write("invalide");
 		       	
 		    }else {
 		    	 response.getWriter().write("valide");
 		    }
             }
		   
		  }

	    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
