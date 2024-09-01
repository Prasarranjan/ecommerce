<%@ page import="entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Your Cart</h1>

    <%
        // No need to redeclare 'session'; it's an implicit object in JSP
        Object cartObj = session.getAttribute("cart");
        List<Product> cart = null;

        // Check if the session attribute is not null and is of the correct type
        if (cartObj != null && cartObj instanceof List) {
            cart = (List<Product>) cartObj;
        }

        if (cart != null && !cart.isEmpty()) {
    %>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Product product : cart) {
        %>
        <tr>
            <td><%= product.getProductName() %></td>
            <td>₹<%= product.getPrice() %></td>
            <td>
                <form method="post" action="cartServlet">
                    <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                    <input type="hidden" name="action" value="remove">
                    <button type="submit" class="btn btn-danger">Remove</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div class="mt-4">
        <a href="checkout.jsp" class="btn btn-success">Proceed to Checkout</a>
    </div>
    <%
    } else {
    %>
    <p>Your cart is empty. <a href="index.jsp">Continue shopping</a></p>
    <%
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
