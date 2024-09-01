package controller;

import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/orderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (cart != null && !cart.isEmpty()) {
            // Logic to save order details in the database can be placed here

            // Clear the cart after order is placed
            session.setAttribute("cart", null);

            // Redirect to a success page
            response.sendRedirect("orderConfirmation.jsp");
        } else {
            // Redirect to cart if cart is empty
            response.sendRedirect("cart.jsp");
        }
    }
}

