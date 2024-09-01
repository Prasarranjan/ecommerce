<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Website</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .hero {
            background-image: url("path/to/your/image.jpg"); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            min-height: 60vh;
            color: #fff;
        }
        .header, .footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
        }
        .header h1, .footer p {
            margin: 0;
        }
        .main-container {
            max-width: 800px;
            margin: auto;
            text-align: center;
            padding: 50px 15px;
        }
        .btn-custom {
            font-size: 1.5rem;
            padding: 15px 30px;
            margin: 10px;
            border-radius: 10px;
            transition: all 0.3s ease;
            text-decoration: none;
        }
        .btn-admin {
            background-color: #007bff;
            color: #fff;
        }
        .btn-admin:hover {
            background-color: #0056b3;
        }
        .btn-user {
            background-color: #28a745;
            color: #fff;
        }
        .btn-user:hover {
            background-color: #218838;
        }
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
        }
    </style>
</head>
<body>
<header class="header hero">
    <div class="container d-flex flex-column justify-content-center align-items-center h-100">
        <h1 class="text-center text-white display-2">E.com</h1>
        <div class="row mt-5">
            <div class="col-md-6">
                <a href="admin.jsp" class="btn btn-custom btn-admin">Admin</a>
            </div>
            <div class="col-md-6">
                <a href="user.jsp" class="btn btn-custom btn-user">User</a>
            </div>
        </div>
    </div>
</header>

<div class="container main-container">
</div>

<footer class="footer">
    <div class="container">
        <p>&copy; Made by PrasarRanjan. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>