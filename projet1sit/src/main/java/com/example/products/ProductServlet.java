package com.example.products;

import java.util.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Liste de produits
        List<Map<String, Object>> products = new ArrayList<>();

        // Produit 1
        Map<String, Object> product1 = new HashMap<>();
        product1.put("name", "Laptop");
        product1.put("price", 1200.0);
        product1.put("available", true);
        products.add(product1);

        // Produit 2
        Map<String, Object> product2 = new HashMap<>();
        product2.put("name", "Smartphone");
        product2.put("price", 800.0);
        product2.put("available", false);
        products.add(product2);

        // Produit 3
        Map<String, Object> product3 = new HashMap<>();
        product3.put("name", "Headphones");
        product3.put("price", 150.0);
        product3.put("available", true);
        products.add(product3);

        // Ajouter la liste au contexte de requête
        request.setAttribute("productList", products);

        // Transférer vers la JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/products.jsp");
        dispatcher.forward(request, response);
        
        System.out.println("Servlet exécuté !");
        System.out.println("Liste de produits : " + products);

    }
}
