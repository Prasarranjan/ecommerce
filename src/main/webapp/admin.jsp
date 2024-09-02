<%@ page import="java.sql.*" %>
<%@ page import="Dao.jdbc" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Admin - Add Products</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
        }
        .navbar {
            background-color: #343a40;
            padding: 15px;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .product-card {
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            border: 1px solid #dee2e6;
            transition: transform 0.2s ease-in-out;
        }
        .product-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">E-Commerce Admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Header -->
<header class="header">
    <div class="container">
        <h1>E-Commerce Product Management</h1>
    </div>
</header>

<!-- Main Content -->
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 mx-auto">
            <h2 class="text-center mb-4">Add New Product</h2>

            <!-- Product Form -->
            <form id="productForm" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="productName">Product Name</label>
                    <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter product name" required>
                    <input type="hidden" name="event" value="formproduct">
                </div>
                <div class="form-group">
                    <label for="productPrice">Product Price (₹)</label>
                    <input type="number" class="form-control" id="productPrice" name="productPrice" placeholder="Enter product price" required>
                </div>

                <div class="form-group">
                    <label for="productCategory">Product Category</label>
                    <select id="productCategory" name="typeid" class="form-control" required>
                        <option value="">Select Category</option>
                        <%
                            Connection conn = jdbc.getConnection();

                            String sql = "SELECT typeid, typename FROM producttype";
                                 Statement stmt = conn.createStatement();
                                 ResultSet rs = stmt.executeQuery(sql);
                            {
                                while (rs.next()) {
                                    int typeid = rs.getInt("typeid");
                                    String typename = rs.getString("typename");
                        %>
                        <option value="<%= typeid %>"><%= typename %></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="productImage">Product Image</label>
                    <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Add Product</button>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Prasar Ranjan. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<!-- jQuery Script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>$(document).ready(function () {
    $('#productForm').on('submit', function (e) {
        e.preventDefault();

// Prevent default form submission

        var formData = new FormData(this); // Use FormData to handle file uploads
        $.ajax({
            url: 'productServlet', // The Servlet URL
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            success: function (response) {
                if (response.trim() === "done") {
                    alert('Product added successfully!');
                    // Optionally reset the form
                    $('#productForm')[0].reset();
                } else {
                    alert('Failed to add product: ' + response.message);
                }
            },
            error: function (xhr, status, error) {
                alert('Error: ' + error);
            }
        });
    });
});
</script>
</body>
</html>
