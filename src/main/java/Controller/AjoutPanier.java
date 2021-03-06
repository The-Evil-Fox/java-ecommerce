package Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ListePanier;
import Model.Panier;
import Model.Produit;

/**
 * Servlet implementation class AjoutPanier
 */
@WebServlet("/AjoutPanier")
public class AjoutPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutPanier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(request.getParameter("id"));
		int quantite = 1;
		
		List<Produit> liste = new ArrayList<Produit>();
		Produit produit = new Produit();
		
		try {
        	
            FileInputStream fis = new FileInputStream("C:\\Users\\steve\\eclipse-workspace\\java-ecommerce\\produits.txt");
            ObjectInputStream ois = new ObjectInputStream(fis);
            liste = (ArrayList<Produit>) ois.readObject();
            ois.close();
            
        } catch (Exception e) {
        	
            e.printStackTrace();
            
        }
		
		HttpSession session = request.getSession();
		
		for (int i = 0; i < liste.size(); i++) {
			
			if(liste.get(i).getId() == id) {
				
				produit.setId(liste.get(i).getId());
				produit.setLibelle(liste.get(i).getLibelle());
				produit.setCheminImage(liste.get(i).getCheminImage());
				produit.setPrix(liste.get(i).getPrix());
				
			}
			
		}
		
		Panier panier = new Panier(produit, quantite);
		
		ListePanier listepanier = new ListePanier();
		
		if(session.getAttribute("listepanier") != null) {
		
			listepanier = (ListePanier) session.getAttribute("listepanier");
			
		} else {
			
			session.setAttribute("listepanier", listepanier);
			
		}
		
		boolean alreadyExist = false;
		
		for(Panier p : listepanier.getListe()) {
			
			if(p.getProduit().getLibelle().equals(panier.getProduit().getLibelle())) {
				
				p.setQuantite(p.getQuantite() + 1);
				alreadyExist = true;
				
			}
			
		}
		
		if(alreadyExist == false) {
			
			listepanier.getListe().add(panier);
			
		}
		
		double montantTotal = 0;
		int quantiteTotale = 0;
		
		for(Panier p : listepanier.getListe()) {
			
			montantTotal += p.getProduit().getPrix() * p.getQuantite();
			quantiteTotale += p.getQuantite();
			
		}
		
		listepanier.setMontantTotal(montantTotal);
		listepanier.setQuantiteTotale(quantiteTotale);
		
		request.setAttribute("listepanier", listepanier);
        request.setAttribute("produits", liste);
        this.getServletContext().getRequestDispatcher("/WEB-INF/affichage-produits.jsp").
		forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
