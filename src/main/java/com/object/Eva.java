package com.object;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.bdd.bdd;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


public class Eva {
	private String faceva;
private String nomeva;
private String sessionEva;
private String email;
private String salles;
private String[] uv;
private String[] salle;
private String uvs;
private String date;
private int nbf;
bdd BDD=new bdd();
	public Eva() {
		// TODO Auto-generated constructor stub
		faceva=null;
		nomeva=null;
		sessionEva=null;
		nbf=0;
	}
	public Eva(String examen , String[] uv ) {
		this.sessionEva=examen;
		this.uv=uv;
		
	}
	public String getUvs() {
		return uvs;
	}
	public void setUvs(String uvs) {
		this.uvs = uvs;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSalles() {
		return salles;
	}
	public void setSalles(String salles) {
		this.salles = salles;
	}
	public String getNomeva() {
		return nomeva;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setNomeva(String nomeva) {
		this.nomeva = nomeva;
	}
	
	public String getSessionEva() {
		return sessionEva;
	}
	public void setSessionEva(String sessionEva) {
		this.sessionEva = sessionEva;
	}
	public String[] getSalle() {
		return salle;
	}
	public void setSalle(String[] salle) {
		this.salle = salle;
	}
	public String[] getUv() {
		return uv;
	}
	public void setUv(String[] uv) {
		this.uv = uv;
	}
	public int getNbf() {
		return nbf;
	}
	public void setNbf(int nbf) {
		this.nbf = nbf;
	}
	public String getFaceva() {
		return faceva;
	}
	public void setFaceva(String faceva) {
		this.faceva = faceva;
	}
	  
	
	//affichageur de la repatiton dans un tableu HTML debut
	public String repartition() {
       String affiche="<table class=table><caption align='center'>liste des repartions effectuer cliquer pour sauvegarder</caption>"
       		+ " <thead> <tr> <th>Filiere</th>"
       		+ " <th >Salle</th>"
       		+ " <th >Etudiants</th>"
       		+ " <th >Effectifs</th></tr>"
       		+ " </thead>"
       		+ " <tbody>";
       int len=this.getSalle().length;
       String[][] liste=new String[this.getUv().length][len];
       liste=partage(this.getSalle(),this.getUv());
       for(int i=0; i<this.getUv().length; i++) {
    	affiche=affiche+"<tr><th rowspan="+len+">"+this.uv[i]+"</th>"; 
    	   for(int j=0; j<len; j++) {
    		   affiche=affiche+"<td ><b>Amphi</b> "+this.salle[j]+"</td><td> <b>"+ liste[i][j]+"</b></td></tr>";
    	   }
    	  
       }
       
       affiche=affiche+"</tbody>"
       		+ "</table>";
      
		return affiche;
	}
	//affichageur de la repatiton dans un tableu HTML fin
	
	
	
	//fonction etu_nbr retourner le nombre d etudiants dans une uv debut
	public int etu_nbr(String uvs) {
		bdd BDD=new bdd();
		 Statement statement = null;
		    ResultSet resultat = null;
		    int nombre=-1;
		    try {
		        statement =BDD.getConnexion().createStatement();
              
		        // Ex�cution de la requ�te
		        resultat = statement.executeQuery("SELECT COUNT (*) AS total FROM etudiant_uv WHERE fk_uv='"+ uvs+"';");
                
		        // R�cup�ration des donn�es
		        while (resultat.next()) {
		           nombre=resultat.getInt("total");
		        }
		        
               
		    } catch (SQLException e) {
		    } finally {
		        // Fermeture de la connexion
		        try {
		            if (resultat != null)
		                resultat.close();
		            if (statement != null)
		                statement.close();
		            if (BDD.getConnexion()!= null)
		            	BDD.getConnexion().close();
		        } catch (SQLException ignore) {
		        }
		    }
		
		return nombre;
	}
	//fonction etu_nbr retourner le nombre d etudiants dans une uv fin
	
	
	

	//fonction qui retourer le tableau de repatiton debut
	 public String[][] partage(String salle[],String uv[]) {
		 int[] nombre=new int[salle.length];
		 String[][] listetd=new String[uv.length][salle.length];
		 int  place=0;
		 int  places=0;
		 int premier=0;
		 int total=0;
		 for(int i=0; i<salle.length; i++)
			  places=places+place(salle[i]);
		 int etud_nbr=0;
		 
		
		 if(uv.length==1) {
				  etud_nbr=etu_nbr(uv[0]);
				  
				 place=(int)(places*2)/3 ;
						
		
			 for(int i=0; i<salle.length; i++) {
				 
					 nombre[i]=(int) (etud_nbr*(place(salle[i])*2)/3)/place;
					 total+=nombre[i];
					 if(i==(salle.length-1) && !(total==etud_nbr)) {
						 nombre[i]++;
							 
					 }if(nombre[i]!=0) {
					     listetd[0][i]="De "+ liste(premier,uv[0])+" a "+liste(nombre[i]+premier-1,uv[0])+"   </td><td>  "+nombre[i];
						 }else {
							 listetd[0][i]="aucun etudiant inscrit"+"   </td><td>  "+nombre[i];
						 }
				     premier=nombre[i];
			 }
			 
		 }else {
			 if(uv.length==2) {
			 
				for(int j=0; j<uv.length;j++) {
					etud_nbr=etu_nbr(uv[j]);
					total=0;
			 for(int i=0; i<salle.length; i++) {
				     
				 if(uv[j]==Max(uv)) {
					
				 place=(int)(places*2)/3 ;
						
					 nombre[i]=(int) (etud_nbr*(place(salle[i])*2)/3)/place;
					 
				 }
				 if(uv[j]==Min(uv)) {
					 
					 place=(int)(places)/3 ;
					 nombre[i]=(int) (etud_nbr*(place(salle[i]))/3)/place;
				 }
				 total+=nombre[i];
				 if(i==(salle.length-1) && !(total==etud_nbr)) {
					 nombre[i]++;
						 
				 }
				 if(nombre[i]!=0) {
				     listetd[j][i]="De "+ liste(premier,uv[j])+" a "+liste(nombre[i]+premier-1,uv[j])+"   </td><td>  "+nombre[i];
					 }else {
						 listetd[j][i]="aucun etudiant inscrit"+"   </td><td>  "+nombre[i];
					 }
			     premier=nombre[i];
			 }
			 premier=0;
			 
		 }
				}else {
					 place=(int)(places)/3 ;
						for(int j=0; j<uv.length;j++) {
							etud_nbr=etu_nbr(uv[j]);
							total=0;
					 for(int i=0; i<salle.length; i++) {
						 
							 nombre[i]=(int) (etud_nbr*(place(salle[i]))/3)/place;
							 total+=nombre[i];
							 if(i==(salle.length-1) && !(total==etud_nbr)) {
								 nombre[i]++;
									 
							 }
							 if(nombre[i]!=0) {
						     listetd[j][i]="De "+ liste(premier,uv[j])+" a "+liste(nombre[i]+premier-1,uv[j])+"   </td><td>  "+nombre[i];
							 }else {
								 listetd[j][i]="aucun etudiant inscrit"+"   </td><td>  "+nombre[i];
							 }
						     premier=nombre[i];
					 }
					 premier=0;
					 
				 }
				}
			 }
		return listetd;
		 
	 }
	//fonction qui retourer le tableau de repatiton fin
	 
	 
	 
	//fonction qui retourner le nombre de place d une salle debut 
	 public int place(String salle) {
				bdd BDD=new bdd();
				 Statement statement = null;
				    ResultSet resultat = null;
				    int nombre=-1;
				    try {
				        statement =BDD.getConnexion().createStatement();
		     
				        // Ex�cution de la requ�te
				        resultat = statement.executeQuery("SELECT capacite AS total FROM salle WHERE nom='"+ salle+"';");
		                
				        // R�cup�ration des donn�es
				        while (resultat.next()) {
				           nombre=resultat.getInt("total");
				        }
		              
		               
				    } catch (SQLException e) {
				    } finally {
				        // Fermeture de la connexion
				        try {
				            if (resultat != null)
				                resultat.close();
				            if (statement != null)
				                statement.close();
				            if (BDD.getConnexion()!= null)
				            	BDD.getConnexion().close();
				        } catch (SQLException ignore) {
				        }
				    }
				
				return nombre;
			}		 
	
	//fonction qui retourner le nombre de place d une salle debut
	 
	 
	 
	 
	 
	 //fonction qui recuperer le premier et denier nom de la liste debut 
	 public String liste(int premier , String code) {
		 bdd BDD=new bdd();
		 Statement statement = null;
		    ResultSet resultat = null;
		    String nombre="a";
		    try {
		        statement =BDD.getConnexion().createStatement();
     
		        // Ex�cution de la requ�te "select nometd,prenometd from etudiant  
		        //Where id=(select fk_etudiant from (select fk_etudiant from etudiant_uv where fk_uv='"+code+"')limit 1 offset "+premier+" );"
		        String req="select * from etudiant_uv eu, etudiant e where e.id=fk_etudiant and fk_uv='"+code+"' order by nometd asc limit 1 offset "+premier+" ;";
		        resultat = statement.executeQuery(req);
                
		        // R�cup�ration des donn�es
		        while (resultat.next()) {
		           nombre=resultat.getString("nometd")+" "+resultat.getString("prenometd");
		        }
              
              
               
		    } catch (SQLException e) {
		    	nombre="aucun etudiant inscrire";
		    	} finally {
		        // Fermeture de la connexion
		        try {
		            if (resultat != null)
		                resultat.close();
		            if (statement != null)
		                statement.close();
		            if (BDD.getConnexion()!= null)
		            	BDD.getConnexion().close();
		        } catch (SQLException ignore) {
		        }
		    }
		 return nombre;
	 }
	//fonction qui recuperer le premier et denier nom de la liste fin
	 
	 
	 
	 
	 // fonction qui retourner la filiere avec plus d etudiants debut
	 public String Max(String uv[]) {
		 String max=uv[0];
		 for(int i=0 ; i<uv.length;i++) {
			 if(etu_nbr(max)<etu_nbr(uv[i])) {
				 max=uv[i];
			 }
		 }
		 return max;
	 }
	// fonction qui retourner la filiere avec plus d etudiants fin
	 
	 
	 
	// fonction qui retourner la filiere avec moins d etudiants debut
	 public String Min(String uv[]) {
		 
		 String min=uv[0];
		 for(int i=0 ; i<uv.length;i++) {
			 if(etu_nbr(min)>etu_nbr(uv[i])) {
				 min=uv[i];
			 }
		 }
		 
		 return min;
	 }
	// fonction qui retourner la filiere avec moins d etudiants fin
	 
	 
	 
	 // fonction genere le pdf d une repartition apres sauvegarder debut
	 public String [] createPdf() throws IOException {
		 String pdfs[]= new String[this.getUv().length];
		 for(int i=0; i<this.getUv().length; i++) {
		  
			 Document document = new Document(PageSize.A4.rotate(), 10, 10, 10, 10);
		 
		 
		    try {
		    	String pdf="C:/Users/zolacdo/Desktop/Projet/SUJET_L3Y/WebContent/sauvegarder/newRepartition/"+nompdf(uv[i])+".pdf";
		     pdfs[i]="<h6> cliquer ici pour telecharger  <a href=\"sauvegarder\\newRepartition\\"+nompdf(uv[i])+".pdf\"  target=\"_blank\">"+uv[i]+"</a></h6>";
		     
		    	PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(pdf));
		      document.open();
		      Paragraph titre = new Paragraph("Repartition de la salle pour "+nompdf(uv[i]), FontFactory.getFont(FontFactory.COURIER, 18, Font.BOLD)); 
		      titre.setAlignment(Element.ALIGN_CENTER);
		      titre.setSpacingAfter(10);
		    	      document.add(titre);
		    	      PdfPTable table = new PdfPTable(3);
		  			float widths[] = { 5, 5, 8 };
		  			table.setWidths(widths);
		  			table.setHeaderRows(1);

		  			// add cell of table - header cell
		  			PdfPCell cell1;
		  			PdfPCell cell2;
		  			PdfPCell cell3;
		  			PdfPCell cell = new PdfPCell(new Phrase("UV"));
		  			cell.setBackgroundColor(new BaseColor(0, 173, 239));
		  			table.addCell(cell);

		  			cell = new PdfPCell(new Phrase("Salle"));
		  			cell.setBackgroundColor(new BaseColor(0, 173, 239));
		  			table.addCell(cell);

		  			cell = new PdfPCell(new Phrase("Etudiants \t\t\t\t ~~Effectifs"));
		  			cell.setBackgroundColor(new BaseColor(0, 173, 239));
		  			table.addCell(cell);
		  			
		  			
		  			Phrase ph;
		  			int len=this.getSalle().length;
		  	       String[][] liste=new String[this.getUv().length][len];
		  	       liste=partage(this.getSalle(),this.getUv());
		  	       
		  				cell1 = new PdfPCell();
		  				ph = new Phrase(this.uv[i]);
		  				cell1.addElement(ph);
		  			    cell1.setRowspan(len);
		  				table.addCell(cell1);
		  				 
		  	    	   for(int j=0; j<len; j++) {
		  				cell2 = new PdfPCell();
		  				ph = new Phrase(this.salle[j]);
		  				cell2.addElement(ph);
		  				cell2.setRowspan(1);
		  				table.addCell(cell2);
		  				
		  				

		  				cell3 = new PdfPCell();
		  				ph = new Phrase(liste[i][j].replace("</td><td>", "\t\t\t\t ~~"));
		  				cell3.addElement(ph);
		  				cell3.setRowspan(1);
		  				table.addCell(cell3);
		  				
		  			
		  	    	   }
		      document.add(table);
		      document.close();
		      System.out.println("Table successfully added");
		    } catch (Exception de) {
		      de.printStackTrace();
		    }
		    document.close();
	 }
	      return pdfs;  
		}
	// fonction genere le pdf d une repartition apres sauvegarder fin
	 
	 
	 // fonction qui gener le nom du pdf debut
	 public String nompdf(String code) {
		String fil="";
		 for(int i=0; i<(code.length()-2);i++) {
			 fil=fil+code.charAt(i);
		 }
		 return fil;
	 }
	// fonction qui gener le nom du pdf fin
	 
	 
	 //fonction qui retourner  tout les uv d une filiere deja repartitie uv debut
	 
	 public String[] alluv(String code) {
		return null;
		 
		 
	 }
	 //fonction qui retourner  tout les uv d une filiere deja repartitie uv fin

	 public String[] sauve(String email) {
		 bdd BDD=new bdd();
		 PreparedStatement statement;
		 String sql="";
		 DateTime dt = new DateTime();
		
			DateTimeFormatter formatter = DateTimeFormat.forPattern("dd/MM/yyyy HH:mm:ss" );
			String date = dt.toString( formatter );
		    try {
		    	for(int i=0;i<this.getUv().length;i++) {
		    	sql="insert into repart(nomrepart,session,fk_uv,salle,email,dateinsert) values(?,?,?,?,?,?);";
		        statement =BDD.getConnexion().prepareStatement(sql);
                 statement.setString(3,uv[i]);
                 String salles=salle[0];
                 for(int j=1;j<this.getSalle().length;j++) {
                  salles=salles+" "+salle[j];	 
                 }
                 statement.setString(4,salles);
                 statement.setString(1,"sauvegarder\\newRepartition\\"+nompdf(uv[i])+".pdf");
                statement.setString(5, email);
                statement.setString(6, date);
                statement.setString(2, this.getSessionEva()); 
                		       statement.executeUpdate();
		    	}
		    } catch (SQLException e) {
		    	System.out.println("erreur"+e);
		    	} finally {
		        // Fermeture de la connexion
		        try {
		            if (BDD.getConnexion()!= null)
		            	BDD.getConnexion().close();
		        } catch (SQLException ignore) {
		        }
		    }
		 
		 
		 try {
			return this.createPdf();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	 }

	 
	// liste des   differents   repartition debut 
	 	public  List<Eva> All(String code) {
		    List<Eva>evas= new ArrayList<Eva>();
		    Statement statement = null;

		    ResultSet resultat = null;
		    try {
		        statement =BDD.getConnexion().createStatement();
		        
		        // Ex�cution de la requ�te
		        resultat = statement.executeQuery("SELECT *FROM allrepart where session='"+ code +"';");
		        // R�cup�ration des donn�es
		        while (resultat.next()) {
		           
		            String email=resultat.getString("email");
		            String salles=resultat.getString("salle");
		            String uvs=resultat.getString("fk_uv");
		            String nomeva=resultat.getString("nomrepart");
		            String session=resultat.getString("session");
		            String date=resultat.getString("dateinsert");
	              Eva eva=new Eva();
	              eva.setEmail(email);
	              eva.setSalles(salles);
	              eva.setUvs(uvs);
	              eva.setNomeva(nomeva);
	              eva.setSessionEva(session);
	              eva.setDate(date);
	              evas.add(eva);
                   	              
		        }
		    } catch (SQLException e) {
		    	System.out.println("\n erreur" + e.getMessage()+"\n");
		    } finally {
		        // Fermeture de la connexion
		        try {
		            if (resultat != null)
		                resultat.close();
		            if (statement != null)
		                statement.close();
		           
		        } catch (SQLException ignore) {
		        }
		    }
		    
		    return evas;
		}

	 	//fonction liste des repartition fin
	 
}