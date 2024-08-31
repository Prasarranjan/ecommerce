<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce App</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <!-- Heading -->
    <h1 class="text-center mb-4">E-Commerce App</h1>

    <!-- Filter Options -->
    <!-- type Name first -->
    <div class="col-md-6">
        <div class="form-group">
            <label for="typeName11">type Name</label>
            <select id="typeName11" name="typeName11" class="form-control">
                <%--                        <span id="typeError" style="color: red;"></span>--%>
                <option value="">Select Type</option>
                <%
                    // Database connection details
                    String jdbcURL = "jdbc:mysql://localhost:3306/ecom";

                    String jdbcUsername = "root";  // change to your username
                    String jdbcPassword = "prasar123";  // change to your password

                    // Query to fetch type names and IDs
                    String sql = "SELECT typeid, typename FROM producttype";

                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Load the MySQL JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establish connection to the database
                        conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                        // Execute query
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        // Populate the dropdown with type names and bind the ID as value
                        while (rs.next()) {
                            int typeid = rs.getInt("typeid");
                            String typename = rs.getString("typename");
                %>
                <option value="<%= typeid %>"><%= typename %></option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close resources
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                    }
                %>
            </select>
            <!-- Hidden input to store the selected typeId -->
            <input type="hidden" id="typeId" name="typeId">
        </div>
    </div>



    <!-- Product Cards -->
    <div class="row" id="productCards">
        <!-- Product cards will be inserted here by AJAX -->
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>



<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<!-- jQuery Script -->
<!-- Include only the full version of jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>
    $(document).ready(function() {
        // Event triggered when dropdown changes
        $('#typeName11').change(function() {
            var typeid = $(this).val();  // Get the selected value
            $.ajax({
                url: 'servlet', // Servlet handling the request
                type: 'POST',   // Using POST method
                data: {
                    typeid: typeid,
                    event: "show"
                }, // Data sent to server
                dataType: 'JSON',

                success: function(response) {
                    // Clear existing products
                    $('#productCards').empty();

                    // Ensure response is in JSON format
                    try {
                        var products = JSON.parse(response); // Parse response if needed
                    } catch (e) {
                        var products = response; // Assume response is already JSON
                    }

                    // Iterate over the products and create cards dynamically
                    $.each(products, function(index, product) {
                       console.log(product)
                        console.log($('#productCards')); // Should log the jQuery object of the element

                        var p = `
                           <div class="col-md-3 mb-4">
                            <div class="card">
                                <img src="${product.productImage}" class="card-img-top" alt="${product.productName}">
                                <div class="card-body">
                                    <h5 class="card-title">${product.productName}</h5>
                                    <p class="card-text">$${product.price.toFixed(2)}</p>
                                    <div class="mb-3">
                                        <label for="quantity${product.productId}" class="form-label">Quantity</label>
                                        <select class="form-select" id="quantity${product.productId}">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                    <a href="#" class="btn btn-primary">Add to Cart</a>
                                </div>
                            </div>
                        </div>
                        `;
                        // Append the new card to the productCards container
                        $('#productCards').append(p);
                    });
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching products: " + error); // Log errors if they occur
                }
            });
        });
    });
</script>

</body>
</html>
