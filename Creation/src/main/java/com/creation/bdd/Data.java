
package com.creation.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.creation.beans.User;

public class Data {	
	    private Connection connexion;
	    
	    public List<User> recupererUsers() {
	        List<User> Users = new ArrayList<User>();
	        Statement statement = null;
	        ResultSet resultat = null;

	        loadDatabase();
	        
	        try {
	            statement = connexion.createStatement();

	            // Exécution de la requête
	            resultat = statement.executeQuery("SELECT nom, mot_de_passe FROM utilisateurs;");

	            // Récupération des données
	            while (resultat.next()) {
	                String nom = resultat.getString("nom");
	                String mot_de_passe = resultat.getString("mot_de_passe");
	                
	                User User = new User();
	                User.setNom(nom);
	                User.setMot_de_passe(mot_de_passe);
	                
	                Users.add(User);
	            }
	        } catch (SQLException e) {
	        } finally {
	            // Fermeture de la connexion
	            try {
	                if (resultat != null)
	                    resultat.close();
	                if (statement != null)
	                    statement.close();
	                if (connexion != null)
	                    connexion.close();
	            } catch (SQLException ignore) {
	            }
	        }
	        
	        return Users;
	    }
	    
	    private void loadDatabase() {
	        // Chargement du driver
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	        }

	        try {
	            connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/creation", "root", "");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public void ajouterUser(User User) {
	        loadDatabase();
	        
	        try {
	            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO utilisateurs(nom, mot_de_passe) VALUES(?, ?);");
	            preparedStatement.setString(1, User.getNom());
	            preparedStatement.setString(2, User.getMot_de_passe());
	            
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
}

