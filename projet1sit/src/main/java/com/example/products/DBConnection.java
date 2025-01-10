package com.example.products;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() throws ClassNotFoundException, 
	SQLException {
		 String url = "jdbc:mysql://localhost:3306/gestion_contacts";
		 String user = "root";
		 String password = "";// chez la plupart le champ est vide
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 return DriverManager.getConnection(url, user, password);
		}

	public static void main(String[] args) {
	    try {
	        Connection con = DBConnection.getConnection();
	        if (con != null) {
	            System.out.println("Connexion réussie !");
	        } else {
	            System.out.println("Échec de la connexion.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}


