 package com.ajax;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangeProfil
 */
@WebServlet("/ChangeProfil")
public class ChangeProfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	    public static final int TAILLE_TAMPON = 10240;
	    public static final String CHEMIN_FICHIERS = "/profil/"; // chemin ou l image est enregistre
	    
	     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeProfil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String source=request.getParameter("file").replace("blob:http://localhost:8080/", "")+request.getParameter("type").replace("image/", ".");

		System.out.print(source+"\n");
		URL url = new URL("http://localhost:8080/UV_PROJET/");
		URLConnection connection = url.openConnection();
	    BufferedInputStream intt = new BufferedInputStream(connection.getInputStream());
	    System.out.println(((HttpURLConnection) connection).getResponseCode()+"\n");
        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		byte[] buf = new byte[1024];
		int n = 0;
		while (-1!=(n=in.read()))
		{
		   out.write(buf, 0, n);
		}
		out.close();
		in.close();
		byte[] responses = out.toByteArray();
		FileOutputStream fos = new FileOutputStream("C:\\Users\\zolacdo\\Desktop\\applicationweb\\SUJET_L3Y\\WebContent\\profil\\"+source);
		fos.write(responses);
		fos.close();
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   	
}
			        
		
	
	public static boolean copier(File source, File dest){
	    try{
	        // Declaration et ouverture des flux
	        java.io.FileInputStream sourceFile = new java.io.FileInputStream(source);
	 
	        try{
	            java.io.FileOutputStream destinationFile = null;
	 
	            try{
	                destinationFile = new FileOutputStream(dest);
	 
	                // Lecture par segment de 0.5Mo
	                byte buffer[] = new byte[512 * 1024];
	                int nbLecture;
	 
	                while ((nbLecture = sourceFile.read(buffer)) != -1){
	                    destinationFile.write(buffer, 0, nbLecture);
	                }
	            } finally {
	                destinationFile.close();
	            }
	        } finally {
	            sourceFile.close();
	        }
	    } catch (IOException e){
	        e.printStackTrace();
	        return false; // Erreur
	    }
	 
	    return true; // Résultat OK
	}
	 
	    public static boolean deplacer(File source, File destination) {
	        if (!destination.exists()) {
	            // On essaye avec renameTo
	            boolean result = source.renameTo(destination);
	            if (!result) {
	                // On essaye de copier
	                result = true;
	                result &= copier(source, destination);
	                if (result) {
	                    result &= source.delete();
	                }
	 
	            }
	            return (result);
	        } else {
	            // Si le fichier destination existe, on annule ...
	            return (false);
	        }
	    }
	 
	 
}
