<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Suppliers | Inventory System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #f8f9fc;
            --accent-color: #4e73df;
            --text-color: #5a5c69;
            --success-color: #1cc88a;
            --danger-color: #e74a3b;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-image: url('https://www.gep.com/prod/s3fs-public/blog-images/smart-inventory-management-system.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #4b2c1a;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: white !important;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            padding: 1rem;
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color) !important;
            display: flex;
            align-items: center;
        }

        .navbar-brand i {
            margin-right: 0.5rem;
        }

        .nav-link {
            color: var(--text-color) !important;
            font-weight: 600;
            padding: 0.5rem 1rem;
            border-radius: 0.35rem;
            transition: all 0.2s ease;
        }

        .nav-link:hover {
            background-color: rgba(78, 115, 223, 0.1);
            color: var(--primary-color) !important;
        }

        .nav-link.active {
            background-color: var(--primary-color);
            color: white !important;
        }

        .card {
            border: none;
            border-radius: 0.5rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }

        .card-header {
            background-color: white;
            border-bottom: 1px solid #e3e6f0;
            padding: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1.25rem;
        }

        .btn-secondary {
            background-color: #858796;
            border-color: #858796;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            border-radius: 0.35rem;
        }

        .btn-secondary:hover {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .page-title {
            font-weight: 700;
            color: #5a5c69;
        }

        footer {
            background-color: white !important;
            box-shadow: 0 -0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            padding: 1.5rem 0;
            flex-shrink: 0;
            margin-top: auto;
        }

        .content-wrapper {
            flex: 1 0 auto;
        }

        .table {
            background-color: white;
            border-radius: 0.5rem;
            overflow: hidden;
        }

        .table thead {
            background-color: var(--secondary-color);
        }

        .table th {
            font-weight: 700;
            color: var(--text-color);
            border-top: none;
        }

        .btn-danger {
            background-color: var(--danger-color);
            border-color: var(--danger-color);
        }

        .btn-success {
            background-color: var(--success-color);
            border-color: var(--success-color);
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container">
        <a class="navbar-brand" href="/">
            <i class="fas fa-boxes"></i>
            Inventory System
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-box me-1"></i> Stock
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/stock/add"><i class="fas fa-plus-circle me-1"></i> Add Stock</a></li>
                        <li><a class="dropdown-item" href="/stock/list"><i class="fas fa-list me-1"></i> View Stock</a></li>
                        <li><a class="dropdown-item" href="/expiry/view"><i class="fas fa-calendar-alt me-1"></i> Expiry View</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-users me-1"></i> Users
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/user/add"><i class="fas fa-user-plus me-1"></i> Add User</a></li>
                        <li><a class="dropdown-item" href="/user/list"><i class="fas fa-user-friends me-1"></i> View Users</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-shopping-cart me-1"></i> Orders
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/order/add"><i class="fas fa-cart-plus me-1"></i> Add Order</a></li>
                        <li><a class="dropdown-item" href="/order/list"><i class="fas fa-clipboard-list me-1"></i> View Orders</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/report/dashboard"><i class="fas fa-chart-bar me-1"></i> Reports</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/alert/dashboard"><i class="fas fa-bell me-1"></i> Alerts</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-truck me-1"></i> Suppliers
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/supplier/add"><i class="fas fa-plus-circle me-1"></i> Add Supplier</a></li>
                        <li><a class="dropdown-item" href="/supplier/list"><i class="fas fa-list me-1"></i> View Suppliers</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="content-wrapper">
    <div class="container py-5">
        <div class="page-header">
            <h1 class="page-title">
                <i class="fas fa-truck me-2 text-primary"></i>
                Supplier List
            </h1>
            <a href="/supplier/add" class="btn btn-primary">
                <i class="fas fa-plus-circle me-1"></i> Add New Supplier
            </a>
        </div>

        <c:if test="${not empty success}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${success}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="card mt-4">
            <div class="card-header">
                <h5>Available Suppliers</h5>
            </div>
            <div class="card-body">
                <c:if test="${empty suppliers}">
                    <div class="alert alert-info" role="alert">
                        <i class="fas fa-info-circle me-2"></i> No suppliers available.
                    </div>
                </c:if>

                <c:if test="${not empty suppliers}">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Contact</th>
                                <th>Email</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="supplier" items="${suppliers}">
                                <tr>
                                    <td>${supplier.id}</td>
                                    <td>${supplier.name}</td>
                                    <td>${supplier.contact}</td>
                                    <td>${supplier.email}</td>
                                    <td>
                                        <a href="/supplier/edit/${supplier.id}" class="btn btn-sm btn-success">
                                            <i class="fas fa-edit"></i> Edit
                                        </a>
                                        <form action="/supplier/delete/${supplier.id}" method="post" class="d-inline">
                                            <button type="submit" class="btn btn-sm btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this supplier?')">
                                                <i class="fas fa-trash"></i> Delete
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<footer class="bg-white py-4 border-top">
    <div class="container text-center">
        <p class="mb-0 text-muted"><b>
            © 2025 Inventory Management System | All rights reserved
        </b></p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>