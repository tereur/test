package com.object;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import com.bdd.bdd;

public class salle {
private String nom;
private int capacite;
private String[] fac;

bdd BDD =new bdd();
public salle(String nom,int capacite, String[] fac) {
	this.nom=nom;
    this.capacite=capacite;
    this.fac=fac;
	
}

public salle() {
	// TODO Auto-generated constructor stub
}
public int getCapacite() {
	return capacite;
}
public void setCapacite(int capacite) {
	this.capacite = capacite;
}
public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public String[] getFac() {
	return fac;
}

public void setFac(String[] fac) {
	this.fac = fac;
}

//fonction mise a jour de salle debut
public boolean update() {
	
	System.out.println(this.getNom().toUpperCase());
	return this.delete(this.getNom()) && this.sauve();
	
}
//fonction mise a jour de salle fin



//fonction delete une salle debut
public boolean delete(String nom) {
	try {
		PreparedStatement statement;
		PreparedStatement statement1;
		statement = BDD.getConnexion().prepareStatement("delete from salle  where nom='"+nom+"';");
		statement1 = BDD.getConnexion().prepareStatement("delete  from salle_fac where fk_salle='"+nom+"'");
		System.out.println("function delete :"+this.getNom());
     
     statement1.executeUpdate();
     statement.executeUpdate();
     return true;
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
		
	}finally {
        // Fermeture de la connexion
        try {
            if (BDD.getConnexion()!= null)
            	BDD.getConnexion().close();
        } catch (SQLException ignore) {
        }}
}
//fonction mise a jour d une salle fin



//fonction ajout d une salle debut
public boolean sauve() {
	
	
		try {
			PreparedStatement statement;
			PreparedStatement statement1;
			statement = BDD.getConnexion().prepareStatement("INSERT INTO salle(nom,capacite)VALUES(?,?)");
		   
			
         statement.setString(1, this.getNom().toUpperCase());
         statement.setLong(2, this.getCapacite()); 
        
         statement.executeUpdate();
         for(int i=0; i<this.getFac().length; i++) {
		    	statement1 = BDD.getConnexion().prepareStatement("INSERT INTO salle_fac VALUES(?,?)");
		    	 statement1.setString(1, this.getNom().toUpperCase());
		         statement1.setString(2, this.fac[i]);
		         statement1.executeUpdate();
		         statement1.close();
		    }
         return true;
      
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
	}finally {
        // Fermeture de la connexion
        try {
            if (BDD.getConnexion()!= null)
            	BDD.getConnexion().close();
        } catch (SQLException ignore) {
        }}
}
//fonction ajout d une salle fin




//fonction liste des salles debut
public List<salle> All() {
    List<salle> salles = new ArrayList<salle>();
    Statement statement = null;
    Statement statement1 = null;
    ResultSet resultat = null;
    ResultSet resultat1 = null;
    
    try {
        statement =BDD.getConnexion().createStatement();
        statement1 =BDD.getConnexion().createStatement();
        // Exécution de la requête
        resultat = statement.executeQuery("SELECT *FROM salle;");

        // Récupération des données
        while (resultat.next()) {
            String nom = resultat.getString("nom");
            int capacite =Integer.parseInt( resultat.getString("capacite"));
            resultat1 = statement1.executeQuery("SELECT fk_fac  FROM salle_fac  Where fk_salle='"+nom+"';");
            String[] fac = new String[6];
            int i=0;
            while (resultat1.next()) {
            	fac[i]= "  " +resultat1.getString("fk_fac");
            			i++;
            }  
           
            resultat1.close();
            salle salle = new salle(nom,capacite, fac);
            
            salles.add(salle);
           
        }
    } catch (SQLException e) {
    	
    } finally {
        // Fermeture de la connexion
        try {
            if (resultat != null)
                resultat.close();
            if (statement != null)
                statement.close();
            if (statement1 != null)
                statement1.close();
            if (BDD.getConnexion()!= null)
            	BDD.getConnexion().close();
        } catch (SQLException ignore) {
        }
    }
    
    return salles;
}
//fonction liste des salle fin



//fonction listes des salle d une faculte debut
public List<salle> Allfac(String[] uv) {
    List<salle> salles = new ArrayList<salle>();
    Statement statement = null;
    Statement statement1 = null;
    ResultSet resultat = null;
    ResultSet resultat1 = null;
	String req ="select nom,capacite from salle ";
	for(int i=0; i<uv.length; i++) {
     req =req+" intersect select nom,capacite from departement,filiere,salle_fac,salle where nom=fk_salle and fk_dep=fk_fac and fk_fil=nomDept and nomFil like '"+filiere(uv[i])+"%'";
	}
	req=req+ " group by nom;";
    try {
        statement =BDD.getConnexion().createStatement();
        statement1 =BDD.getConnexion().createStatement();
        // Exécution de la requête
        resultat = statement.executeQuery(req);

        // Récupération des données
        while (resultat.next()) {
            String nom = resultat.getString("nom");
            int capacite =Integer.parseInt( resultat.getString("capacite"));
            resultat1 = statement1.executeQuery("SELECT fk_fac  FROM salle_fac  Where fk_salle='"+nom+"';");
            String[] fac = new String[6];
            int i=0;
            while (resultat1.next()) {
            	fac[i]= "  " +resultat1.getString("fk_fac");
            			i++;
            }  
            resultat1.close();
            salle salle = new salle(nom,capacite, fac);
            
            salles.add(salle);
           
        }
    } catch (SQLException e) {
    	
    } finally {
        // Fermeture de la connexion
        try {
            if (resultat != null)
                resultat.close();
            if (statement != null)
                statement.close();
            if (statement1 != null)
                statement1.close();
            if (BDD.getConnexion()!= null)
            	BDD.getConnexion().close();
        } catch (SQLException ignore) {
        }
    }
    
    return salles;
}
//fonction listes des salle d une faculte fin



//fonction recherche d une salle debut
public boolean recherche(String code) {
	
	 Statement statement = null;
	    ResultSet resultat = null;
	    
	    try {
	        statement =BDD.getConnexion().createStatement();

	        // Ex�cution de la requ�te
	        //resultat = statement.executeQuery("SELECT *FROM salle;");
	        resultat = statement.executeQuery("SELECT COUNT(*)  AS total FROM salle WHERE nom='"+code+"';");
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
//fonction recherche d une salle fin



// fonction retourner la faculte au quel appatient une uv debut
public String filiere(String fil) {
	return "math";
}
//fonction retourner la faculte au quel appatient une uv fin

}
