<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="entity.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<style>.header, .footer {
    background-color: #343a40;
    color: white;
    padding: 20px 0;
}
.header h1, .footer p {
    margin: 0;
} .footer {
      position: fixed;
      bottom: 0;
      width: 100%;
      text-align: center;
  }
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header class="header">
    <div class="container">
        <h1 class="text-center">E.com</h1>
    </div>
</header>
<div class="container mt-5">
    <h1 class="text-center mb-4">Shopping Cart</h1>

    <%
        // Retrieve the cart and grandTotal attributes
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) request.getAttribute("cart");
        Double grandTotal = (Double) request.getAttribute("grandTotal");

        // Debugging output
        System.out.println("Cart in JSP: " + cart);
        System.out.println("Grand Total in JSP: " + grandTotal);
    %>

    <% if (cart != null && !cart.isEmpty()) { %>
    <table class="table">
        <thead>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        <tr>

        <% for (CartItem item : cart.values()) { %>
            <%System.out.println(item); %>
            <td><%= item.getProductName() %></td>
            <td>₹<%= item.getProductPrice() %></td>
            <td><%= item.getQuantity() %></td>
            <td>₹<%= item.getProductPrice() * item.getQuantity() %></td>
        </tr>
        <% } %>
        <tr>
            <td colspan="3" class="text-end"><strong>Grand Total:</strong></td>
            <td>₹<%= grandTotal %></td>
        </tr>
        </tbody>
    </table>
    <% } else { %>
    <p class="text-center">Your cart is empty.</p>

    <% }
        System.out.println("nooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"); %>

    <div class="text-center mt-4">
        <div class="text-center mt-4">
            <button class="btn btn-primary" onclick="window.open('invoice.jsp', '_blank', 'width=800,height=600')">Print Invoice</button>
            <a href="downloadInvoice" class="btn btn-success">Download Invoice</a>
        </div>

        <a href=# class="btn btn-success mt-3">Proceed to Checkout</a>
    </div>
</div>
<footer class="footer">
    <div class="container">
        <p>&copy; Made by PrasarRanjan. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
