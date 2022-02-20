package Controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import Model.*;

/**
 * Servlet implementation class SupprimerProduit
 */
@WebServlet("/SupprimerProduit")
public class SupprimerProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupprimerProduit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int idproduit = Integer.parseInt(request.getParameter("id"));
		
		ArrayList<Produit> listeproduits = new ArrayList<Produit>();
		
		try {
        	
            FileInputStream fis = new FileInputStream("C:\\Users\\steve\\eclipse-workspace\\java-ecommerce\\produits.txt");
            ObjectInputStream ois = new ObjectInputStream(fis);
            listeproduits = (ArrayList<Produit>) ois.readObject();
            ois.close();
            
        } catch (Exception e) {
        	
            e.printStackTrace();
            
        }
		
		for (int i = 0; i < listeproduits.size(); i++) {
			
			if(listeproduits.get(i).getId() == idproduit) {
				
				listeproduits.remove(i);
				break;
				
			}
			
		}
		
		try {
        	
            FileOutputStream fs = new FileOutputStream("C:\\Users\\steve\\eclipse-workspace\\java-ecommerce\\produits.txt");
            ObjectOutputStream os = new ObjectOutputStream(fs);
            os.writeObject(listeproduits);
            os.close();
            
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
        request.setAttribute("produits", listeproduits);
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
