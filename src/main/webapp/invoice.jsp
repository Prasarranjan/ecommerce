<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="entity.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Invoice</title>
    <style>
        /* Basic styles for print layout */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        } .footer {
              position: fixed;
              bottom: 0;
              width: 100%;
              text-align: center;
          }
        .header h1 {
            margin: 0;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .table th, .table td {
            border: 1px solid #000;
            padding: 8px;
            text-align: left;
        }
        .table th {
            background-color: #f4f4f4;
        }
        .total {
            font-weight: bold;
            text-align: right;
        }
       .header, .footer {
             background-color: #343a40;
             color: white;
             padding: 20px 0;
         }
        .header h1, .footer p {
            margin: 0;
        }
        @media print {
            .header h1 {
                font-size: 24px;
            }
            .btn {
                display: none;
            }
        }
    </style>
</head>
<body>
<header class="header">
    <div class="container">
        <h1 class="text-center">E.com</h1>
    </div>
</header>
<div class="container">
    <div class="header">
        <h1>Invoice</h1>
        <p>Thank you for your purchase!</p>
    </div>

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
        <%
            Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
            double grandTotal = 0.0;
            if (cart != null) {
                for (CartItem item : cart.values()) {
                    double itemTotal = item.getProductPrice() * item.getQuantity();
                    grandTotal += itemTotal;
        %>
        <tr>
            <td><%= item.getProductName() %></td>
            <td>₹<%= item.getProductPrice() %></td>
            <td><%= item.getQuantity() %></td>
            <td>₹<%= itemTotal %></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

    <div class="total">
        Grand Total: ₹<%= grandTotal %>
    </div>
</div>
<footer class="footer">
    <div class="container">
        <p>&copy; Made by PrasarRanjan. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
