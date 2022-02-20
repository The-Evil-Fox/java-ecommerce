package Model;

import java.io.Serializable;

public class Utilisateur implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String nom;
	private String prenom;
	private String password;
	private String email;
	private int privileges;
	
	public Utilisateur() {
		
		
		
	}
	
	public Utilisateur(String nom, String prenom, String password, String email, int privileges) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.password = password;
		this.email = email;
		this.privileges = privileges;
	}
	
	public Utilisateur(String nom, String prenom, String email, int privileges) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.privileges = privileges;
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
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	public int getPrivileges() {
		return privileges;
	}

	public void setPrivileges(int privileges) {
		this.privileges = privileges;
	}
	

}
