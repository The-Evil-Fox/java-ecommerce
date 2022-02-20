package Controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
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
 * Servlet implementation class AfficherListe
 */
@WebServlet("/AfficherListe")
public class AfficherListe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfficherListe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Produit> liste = new ArrayList<Produit>();
		
		try {
        	
            FileInputStream fis = new FileInputStream("C:\\Users\\steve\\eclipse-workspace\\java-ecommerce\\produits.txt");
            ObjectInputStream ois = new ObjectInputStream(fis);
            liste = (ArrayList<Produit>) ois.readObject();
            ois.close();
            
        } catch (Exception e) {
        	
            e.printStackTrace();
            
        }
		
		HttpSession session = request.getSession();
		
		ListePanier listepanier = new ListePanier();
		
		if(session.getAttribute("listepanier") != null) {
		
			listepanier = (ListePanier) session.getAttribute("listepanier");
			
		} else {
			
			session.setAttribute("listepanier", listepanier);
			
		}
        
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
