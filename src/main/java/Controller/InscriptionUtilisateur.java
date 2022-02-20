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

import Model.Utilisateur;

/**
 * Servlet implementation class InscriptionUtilisateur
 */
@WebServlet("/InscriptionUtilisateur")
public class InscriptionUtilisateur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionUtilisateur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		int privileges = 0;
		
		List<Utilisateur> listeUtilisateurs = new ArrayList<Utilisateur>();
		
		try {
        	
            FileInputStream fis = new FileInputStream("C:\\Users\\steve\\eclipse-workspace\\java-ecommerce\\utilisateurs.txt");
            ObjectInputStream ois = new ObjectInputStream(fis);
            listeUtilisateurs = (ArrayList<Utilisateur>) ois.readObject();
            ois.close();
            
        } catch (Exception e) {
        	
            e.printStackTrace();
            
        }
		
		Utilisateur connectedUser = new Utilisateur(nom, prenom, password, email, privileges);
		
		listeUtilisateurs.add(connectedUser);
		
		try {
        	
            FileOutputStream fs = new FileOutputStream("C:\\Users\\steve\\eclipse-workspace\\java-ecommerce\\utilisateurs.txt");
            ObjectOutputStream os = new ObjectOutputStream(fs);
            os.writeObject(listeUtilisateurs);
            os.close();
            
        } catch (Exception e) {
        	
            e.printStackTrace();
            
        }
		
		HttpSession session = request.getSession();
		
		session.setAttribute("user", connectedUser);
		this.getServletContext().getRequestDispatcher("/AfficherListe").
		forward(request, response);
		
		
		
		
	}

}
