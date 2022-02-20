package Model;

import java.io.Serializable;

public class Produit implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int id;
	private String libelle;
	private double prix;
	private String cheminImage;
	
	public Produit() {
		
		
	}
	
	public Produit(int id, String libelle, double prix) {
		super();
		this.id = id;
		this.libelle = libelle;
	}
	
	public Produit(int id, String libelle, double prix, String cheminImage) {
		super();
		this.id = id;
		this.libelle = libelle;
		this.prix = prix;
		this.cheminImage = cheminImage;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public double getPrix() {
		return prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}

	public String getCheminImage() {
		return cheminImage;
	}

	public void setCheminImage(String cheminImage) {
		this.cheminImage = cheminImage;
	}

	@Override
	public String toString() {
		return "Produit [id=" + id + ", libelle=" + libelle + ", prix=" + prix + ", cheminImage=" + cheminImage + "]";
	}
	
	

}
