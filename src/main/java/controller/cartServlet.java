package controller;

import entity.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/cartServlet")
public class cartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve action parameter to check what the user wants to do
        String action = request.getParameter("action");

        // Initialize the cart for the session if it doesn't exist
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        if ("addToCart".equals(action)) {
            System.out.println("iam here");
            // Get product data from request
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));

            // Add product to the cart or update quantity if already present
            CartItem item = cart.getOrDefault(productId, new CartItem(productId, productName, productPrice, 0));
            item.setQuantity(item.getQuantity() + 1); // Increment quantity
            cart.put(productId, item);

            // Update cart in the session
            session.setAttribute("cart", cart);

            // Return the updated cart size to the client
            response.setContentType("application/json");
            response.getWriter().write("{\"cartCount\": " + cart.size() + "}");
        }


        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
        // Other actions like "removeFromCart" or "clearCart" could be handled here
    }


}
