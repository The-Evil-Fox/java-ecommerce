package Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;

public class Panier implements Serializable {

	private static final long serialVersionUID = 1L;
	private Produit produit;
	private int quantite;
	
	public Panier() {
		
		
	}

	public Panier(Produit produit, int quantite) {
		super();
		this.produit = produit;
		this.quantite = quantite;
	}

	public Produit getProduit() {
		return produit;
	}

	public void setProduit(Produit produit) {
		this.produit = produit;
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	
	
	
}