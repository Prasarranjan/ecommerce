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
    <div class="row mb-4">
        <div class="col-md-3">
            <h5>Filter by Category</h5>
            <select class="form-select" id="categoryFilter">
                <option value="all">All</option>
                <option value="jeans">Jeans</option>
                <option value="shirt">Shirt</option>
                <option value="tshirt">T-Shirt</option>
                <option value="hoodie">Hoodie</option>
                <option value="traditional">Traditional</option>
            </select>
        </div>
    </div>

    <!-- Product Cards -->
    <div class="row" id="productCards">
        <!-- Example Card -->
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="img01.jpg" class="card-img-top" alt="Jeans">
                <div class="card-body">
                    <h5 class="card-title">Trigger Jeans</h5>
                    <p class="card-text">$49.99</p>
                    <!-- Quantity Select -->
                    <div class="mb-3">
                        <label for="quantity1" class="form-label">Quantity</label>
                        <select class="form-select" id="quantity1">
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

        <!-- Add more product cards below -->
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="img02.jpg" class="card-img-top" alt="Shirt">
                <div class="card-body">
                    <h5 class="card-title">Raymond Shirt</h5>
                    <p class="card-text">$34.99</p>
                    <!-- Quantity Select -->
                    <div class="mb-3">
                        <label for="quantity2" class="form-label">Quantity</label>
                        <select class="form-select" id="quantity2">
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

        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="img03.jpg" class="card-img-top" alt="T-Shirt">
                <div class="card-body">
                    <h5 class="card-title">Nike T-Shirt</h5>
                    <p class="card-text">$29.99</p>
                    <!-- Quantity Select -->
                    <div class="mb-3">
                        <label for="quantity3" class="form-label">Quantity</label>
                        <select class="form-select" id="quantity3">
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

        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="img04.jpg" class="card-img-top" alt="Hoodie">
                <div class="card-body">
                    <h5 class="card-title">Puma Hoodie</h5>
                    <p class="card-text">$59.99</p>
                    <!-- Quantity Select -->
                    <div class="mb-3">
                        <label for="quantity4" class="form-label">Quantity</label>
                        <select class="form-select" id="quantity4">
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
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
