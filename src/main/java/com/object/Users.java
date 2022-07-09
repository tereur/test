package com.object;

import java.net.UnknownHostException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.bdd.bdd;

public class Users   {
	 private bdd BDD =new bdd();
	 Statement statement = null;
	 ResultSet resultat = null;
	 private int id ;
	 private String nom ;
	 private String   prenom ;
	 private String   email ;
	 private String  role ;
	 private String   facebook;
	 private String   instargram ;
	 private String   mobile ;
	 private String   adress ;
	 private String  phone  ;
	 private String  image  ;
	 private String  twitter ;
	 private String  date ;
	 
	public Users() {
		// TODO Auto-generated constructor stub
		
	}

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getInstargram() {
		return instargram;
	}
	public void setInstargram(String instagrame) {
		this.instargram = instagrame;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}
	// differents methodes inplements pour l user
	

	//fonction d authentification debut
	
	public boolean authentifie(String login, String password) {
		// TODO Auto-generated method stub
		 try {
			 statement  =BDD.getConnexion().createStatement();
			 String rep="select count(*) as total from administrateur where login='"+login+"'and password='"+password+"';";
			 

		        // Exécution de la requête
		        resultat = statement.executeQuery(rep);
		       while(resultat.next()) {
		    	   if(resultat.getInt("total")>0)
		    		   return true;
		       }
			 
		 }catch(Exception e) {
			 System.out.append(e.getMessage());
		 }	
		return false;
	}
	//fonction d authentification debut
	
	
	
	//fonction recuperation d information d user debut
	public void recuper(String login, String password) {
		// TODO Auto-generated method stub
		 try {
			 statement  =BDD.getConnexion().createStatement();
			 String rep="select * from administrateur where login='"+login+"'and password='"+password+"';";
			 

		        // Exécution de la requête
		        resultat = statement.executeQuery(rep);
		       while(resultat.next()) {
		    	   this.setId(resultat.getInt("id"));
		    	   this.setAdress(resultat.getString("adress"));
		    	   this.setEmail(resultat.getString("email"));
		    	   this.setRole(resultat.getString("role"));
		    	   this.setInstargram(resultat.getString("instagrame"));
		    	   this.setFacebook(resultat.getString("facebook"));
		    	   this.setPhone(resultat.getString("mobile"));
		    	   this.setMobile(resultat.getString("phone"));
		    	   this.setPrenom(resultat.getString("prenom"));
		    	   this.setNom(resultat.getString("nom"));
		    	   this.setTwitter(resultat.getString("twitter"));
		    	   this.setImage(resultat.getString("image"));
		    	   System.out.append("c est moi"+resultat.getString("twitter")+resultat.getString("images"));
		       }
			 
		 }catch(Exception e) {
			 System.out.append("erreur"+e.getMessage());
		 }	
		
	}
	//fonction recuperation d information d user fin
	
	
	
	
// fonction de mise a jour d un user debut
	public void update(String nom2, String prenom2, String email2, String phone2, String mobile2, String adress2) {
		// TODO Auto-generated method stub
		
		
		try {
			PreparedStatement statement;
			statement = BDD.getConnexion().prepareStatement("update administrateur set nom=?,prenom=?, email=?, phone=?,mobile=?,adress=? where id="+this.getId());
		
			
         statement.setString(1, nom2);
         statement.setString(2,prenom2 );
         statement.setString(3, email2);
         statement.setString(4,phone2 );
         statement.setString(5, mobile2 );
         statement.setString(6, adress2 );
        
         statement.executeUpdate();
      
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		
	}finally {
        // Fermeture de la connexion
        try {
            if (BDD.getConnexion()!= null)
            	BDD.getConnexion().close();
        } catch (SQLException ignore) {
        }}
	}
//fonction de mise a jour fin
	
	
	
	//fonction gestion d admins envoi d email debut
	public boolean newusers( String email,String mobile,String role)  {
		String login=generlogin(email);
		String password=generpassword(login);
			if(email(email,login , password)) {
			return newadmins(email,login,password,mobile,role);
			}
		
		return false;
	}
	//fonction gestion d admins envoi d email fin
	

	
	
	
	//fonction envoi d email debut
	public boolean email(String email,String login , String password1) {
		String username = "recusd01@gmail.com";
		String password = "kfnxvyqcyvxkdnek";
		// Etape 1 : Cr�ation de la session
		  Properties props = new Properties();
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable","true");
		  props.put("mail.smtp.host","smtp.gmail.com");
		  props.put("mail.smtp.port","587");
		  Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
		  protected PasswordAuthentication getPasswordAuthentication() {
		  return new PasswordAuthentication(username, password);
		  }
		  });
		  try {
		  // Etape 2 : Cr�ation de l'objet Message
		  Message message = new MimeMessage(session);
		  message.setFrom(new InternetAddress("recusd01@gmail.com"));
		  message.setRecipients(Message.RecipientType.TO,
		  InternetAddress.parse(email));
		  message.setSubject("Administrateur");
		  message.setText("votre login et mot de passe sont les suivant:\n login:  "+login+"\n password:  "+password1);
		  // Etape 3 : Envoyer le message
		  
		  Transport.send(message);
		 
		  System.out.println("Message_envoye");
		  } catch (Exception mex) {
			  
		         mex.printStackTrace();
		         System.out.print(mex.getMessage());
		         return false;
		  } 
		
		return true;
	}
	//fonction envoie d email fin
	
	
	
	
	//fonction gener le login debut
 	public String generlogin(String email) {
            		int i=0;
            		String login="";
        while((email.charAt(i))!='@'){
        	login=login+email.charAt(i);
        	i++;
        }
		return login;
	}

 	//fonction gener le login fin
 	
 	
 	
 	
 	//fonction gener le password debut
 	public String generpassword(String login) {
		int i=0;
		String password="";
        
		while(i<8) {
			Random random= new Random();
			int value=random.nextInt(login.length());
		   password=password+login.charAt(value);
			i++;
		}
           return password;
}

 	//fonction gener le password fin
 	
 	
 	
 	// liste des  admins differents de celui connecter 
 	public  List<Users> All() {
	    List<Users>user= new ArrayList<Users>();
	    Statement statement = null;

	    ResultSet resultat = null;
	    try {
	        statement =BDD.getConnexion().createStatement();
	        
	        // Ex�cution de la requ�te
	        resultat = statement.executeQuery("SELECT *FROM administrateur WHERE id!="+this.getId());
	        // R�cup�ration des donn�es
	        while (resultat.next()) {
	            String nom = resultat.getString("nom");
	            String phone=resultat.getString("phone");
	            String date= resultat.getString("date");
	            String grade=resultat.getString("role");
	            String image=resultat.getString("image");
	            String email=resultat.getString("email");
	             
              Users user2=new Users();
              user2.setPhone(phone);
              user2.setImage(image);
              user2.setNom(nom);
              user2.setDate(date);
              user2.setRole(grade);
              user2.setEmail(email);
              user.add(user2);
	        }
	    } catch (SQLException e) {
	    	
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
	    
	    return user;
	}

 	//fonction liste des admins fin
 	
 	
 	
 	
 	
 	//fonction d ajout admins debut
 	
 	
	public boolean newadmins(String email, String login, String password, String mobile,String role) {

		try {
			PreparedStatement statement;
			statement = BDD.getConnexion().prepareStatement("INSERT INTO administrateur(email,login,password,phone,date,role)VALUES(?,?,?,?,?,?)");
			DateTime dt = new DateTime();
		
			DateTimeFormatter formatter = DateTimeFormat.forPattern("dd/MM/yyyy HH:mm:ss" );
			String date = dt.toString( formatter );
			statement.setString(1,email);
	         statement.setString(2,login); 
	         statement.setString(3,password); 
	         statement.setString(4,mobile); 
	         statement.setString(5,date); 
	         statement.setString(6,role); 
	         statement.executeUpdate();
	         System.out.println("insertion reussi");
		return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
	}
	} 	
	
	//fonction d ajout d admins fin	
	
	
	//fonction recherche d un mail debut

public boolean rechercher(String email) {
	
	 Statement statement = null;
	    ResultSet resultat = null;
	    
	    try {
	        statement =BDD.getConnexion().createStatement();

	        // Ex�cution de la requ�te
	        resultat = statement.executeQuery("SELECT COUNT(*)  AS total FROM administrateur WHERE email='"+email+"';");
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

//fonction recherche d un mail fin



//fonction delete debut
public boolean delete(String email) {
	try {
		PreparedStatement statement;
		statement = BDD.getConnexion().prepareStatement("delete from administrateur  where email='"+email+"';");
		
     
     statement.executeUpdate();
     return true;
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
		
	}
}

//fonction delete  fin



//fonction de promotion debut
public boolean promu(String role,String email) {
	try {
		PreparedStatement statement;
		statement = BDD.getConnexion().prepareStatement("update administrateur set role=? where email='"+email+"';");
		statement.setString(1,role);
     statement.executeUpdate();
     return true;
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
		
	}
}


//fonction de promotion fin
}



