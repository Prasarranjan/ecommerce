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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        if ("addToCart".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));

            CartItem item = cart.getOrDefault(productId, new CartItem(productId, productName, productPrice, 0));
            item.setQuantity(item.getQuantity() + 1); // Increment quantity
            cart.put(productId, item);

            session.setAttribute("cart", cart);

            response.setContentType("application/json");
            response.getWriter().write("{\"cartCount\": " + cart.size() + "}");
        } else if ("goToCart".equals(action)) {
            request.setAttribute("cart", cart);
            request.setAttribute("grandTotal", calculateGrandTotal(cart));
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }

    }

    private double calculateGrandTotal(Map<Integer, CartItem> cart) {
        double grandTotal = 0.0;
        for (CartItem item : cart.values()) {
            grandTotal += item.getProductPrice() * item.getQuantity();
        }
        return grandTotal;
    }

}
