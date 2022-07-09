package com.object;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.bdd.bdd;

public class UV {

	private String code;

	public UV() {
		// TODO Auto-generated constructor stub
	}
	public UV(String code) {
		// TODO Auto-generated constructor stub
		this.code=code;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	public boolean recherche(String code) {
		
		 Statement statement = null;
		    ResultSet resultat = null;
			bdd BDD =new bdd();
		    
		    try {
		        statement =BDD.getConnexion().createStatement();

		        // Exécution de la requête
		        //resultat = statement.executeQuery("SELECT *FROM salle;");
		        resultat = statement.executeQuery("SELECT COUNT(*)  AS total FROM UV WHERE codeuv='"+code+"';");
		        int total=0;
		        while (resultat.next()) {
		            total = resultat.getInt("total");
		            }
		        if(total!=0)
		        	return true;
		        else
		        	return false;
		    	
		    } catch (SQLException e) {
		    	return false;
		    	 
		    	
		    }
			
		
	}
	
	public boolean confirme_sauve(String code) {
		
		 Statement statement = null;
		    ResultSet resultat = null;
			bdd BDD =new bdd();
		    
		    try {
		        statement =BDD.getConnexion().createStatement();

		        resultat = statement.executeQuery("SELECT COUNT(*)  AS total FROM repart WHERE fk_uv='"+code+"';");
		        int total=0;
		        while (resultat.next()) {
		            total = resultat.getInt("total");
		            }
		        if(total!=0)
		        	return true;
		        else
		        	return false;
		    	
		    } catch (SQLException e) {
		    	return false;
		    	 
		    	
		    }
			
		
	}

}
