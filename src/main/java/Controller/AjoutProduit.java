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

import Model.Produit;

/**
 * Servlet implementation class AjoutProduit
 */
@WebServlet("/AjoutProduit")
public class AjoutProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutProduit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(request.getParameter("id"));
		String libelle = request.getParameter("libelle");
		String chemin = request.getParameter("cheminimage");
		double prix = Double.parseDouble(request.getParameter("prix"));
		List<Produit> liste = new ArrayList<Produit>();
		
		Produit newp = new Produit();
		
		newp.setId(id);
		newp.setLibelle(libelle);
		newp.setCheminImage(chemin);
		newp.setPrix(prix);
		
		 try {
	        	
	            FileInputStream fis = new FileInputStream("C:\\Users\\steve\\eclipse-workspace\\java-ecommerce\\produits.txt");
	            ObjectInputStream ois = new ObjectInputStream(fis);
	            liste = (ArrayList<Produit>) ois.readObject();
	            ois.close();
	            
	        } catch (Exception e) {
	        	
	            e.printStackTrace();
	            
	        }
		 
	        liste.add(newp);
	        
	        try {
	        	
	            FileOutputStream fs = new FileOutputStream("C:\\Users\\steve\\eclipse-workspace\\java-ecommerce\\produits.txt");
	            ObjectOutputStream os = new ObjectOutputStream(fs);
	            os.writeObject(liste);
	            os.close();
	            
	        } catch (Exception e) {
	        	
	            e.printStackTrace();
	            
	        }
	        
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
