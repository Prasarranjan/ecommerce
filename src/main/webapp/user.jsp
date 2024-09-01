<%@ page import="entity.Product" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce App</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <!-- Heading -->
    <h1 class="text-center mb-4">E-Commerce App</h1>

    <!-- Filter Options -->
    <div class="col-md-6">
        <div class="form-group">
            <label for="typeName11">Type Name</label>
            <select id="typeName11" name="typeName11" class="form-control">
                <option value="">Select Type</option>
                <%-- Fetch type names and IDs from database --%>
                <%
                    // Database connection details
                    String jdbcURL = "jdbc:mysql://localhost:3306/ecom";
                    String jdbcUsername = "root";  // Change to your username
                    String jdbcPassword = "prasar123";  // Change to your password

                    // Query to fetch type names and IDs
                    String sql = "SELECT typeid, typename FROM producttype";

                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

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
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                    }
                %>
            </select>
        </div>
    </div>
    <div class="container mt-5">
        <!-- Heading and Cart Button -->
        <div class="row justify-content-between align-items-center mb-4">
            <div class="col-md-3 text-start">
                <!-- Go to Cart Button -->
                <button id="goToCart" class="btn btn-success" >Go to Cart (<span id="cartCount">0</span>)</button>
            </div>
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
<!-- jQuery Script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function() {
        $('#typeName11').change(function() {
            var typeid = $(this).val();
            $.ajax({
                url: 'servlet', // Servlet handling the request
                type: 'POST',
                data: {
                    typeid: typeid,
                    event: "show"
                },
                dataType: 'json',
                success: function(response) {
                    var cardHtml = ""; // Initialize variable for card HTML

                    // Assuming response is an array of product objects
                    $.each(response, function(index, product) {
                        cardHtml += "<div class='col-md-3 mb-4'>";
                        cardHtml += "<div class='card'>";
                        cardHtml += "<img src='image/" + product.productImage + "' class='card-img-top' alt='" + product.productName + "' height='200px' width='200px'>";
                        cardHtml += "<div class='card-body'>";
                        cardHtml += "<h5 class='card-title'>" + (product.productName || 'No Name') + " <span class='badge bg-secondary'>₹" + (product.price || '0.00') + "</span></h5>"; // Product name and price
                        cardHtml += "<button class='btn btn-primary add-to-cart' data-id='" + product.productId + "' data-name='" + product.productName + "' data-price='" + product.price + "'>Add to Cart</button>";

                        // Uncomment and fix if these properties are available
                        // cardHtml += "<p class='card-text'>Email: " + (product.email || 'No Email') + "</p>";
                        // cardHtml += "<p class='card-text'>Mobile: " + (product.mobile || 'No Mobile') + "</p>";
                        // cardHtml += "<p class='card-text'>Club Name: " + (product.clubName || 'No Club Name') + "</p>";
                        // cardHtml += "<p class='card-text'>Sports Name: " + (product.sportsName || 'No Sports Name') + "</p>";
                        // cardHtml += "<p class='card-text'>Fees: $" + (product.fees || '0') + "</p>";
                        cardHtml += "</div>";
                        cardHtml += "</div>";
                        cardHtml += "</div>";
                    });

                    $('#productCards').html(cardHtml); // Insert card HTML into container
                },

                error: function(xhr, status, error) {
                    console.error("Error fetching products: " + error);
                }
            });
        });
    });
    //cart
    $(document).on('click', '.add-to-cart', function() {
        var productId = $(this).data('id'); // Use 'id' not 'productId'
        var productName = $(this).data('name'); // Use 'name' not 'productName'
        var productPrice = $(this).data('price');
        console.log('Adding to cart:', { productId, productName, productPrice }); // Debugging line
        $.ajax({
            url: 'cartServlet',
            type: 'POST',
            data: {
                productId: productId,
                productName: productName,
                productPrice: productPrice,
                action: 'addToCart'
            },
            success: function(response) {
                console.log(response)
                $('#cartCount').text(response.cartCount); // Update cart item count
                alert(productName + ' added to cart!');
            },
            error: function(xhr, status, error) {
                console.error('Error adding product to cart: ' + error);
                alert("error")
            }
        });
    });
    $(document).ready(function() {
        $('#goToCart').click(function() {
            window.location.href = 'cart.jsp'; // Go to Cart page
        });
    });


</script>


</body>
</html>
