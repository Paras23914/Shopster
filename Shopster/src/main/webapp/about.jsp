<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>About Page</title>
    <%@include file="components/common_css_js.jsp" %>
    <style>
        .hero-section {
            background: url('images/hero-bg.jpg') no-repeat center center/cover;
            height: 400px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .hero-section h1 {
            font-size: 3rem;
            margin: 0;
        }
        .mission-section, .team-section, .footer-section {
            padding: 40px 0;
            text-align: center;
        }
        .team-section .team-member {
            margin: 20px;
        }
        .team-section .team-member img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
        }
        .footer-section {
            background: #333;
            color: white;
        }
    </style>
</head>
<body>
    <%@include file="components/navbar.jsp" %>

    <!-- Hero Section -->
    <div class="hero-section">
        <h1>Welcome to Shopster</h1>
    </div>

    <!-- Mission Section -->
    <div class="container mission-section">
        <h2>Our Mission</h2>
        <p>
            At Shopster, our mission is to provide our customers with a wide variety of high-quality products at competitive prices. 
            We are committed to offering the best shopping experience by continuously improving our services and bringing the latest products to our customers.
        </p>
    </div>

<!--     Team Section 
    <div class="container team-section">
        <h2>Meet Our Team</h2>
        <div class="row">
            <div class="col-md-4 team-member">
                <img src="images/team1.jpg" alt="Team Member 1">
                <h4>John Doe</h4>
                <p>CEO</p>
            </div>
            <div class="col-md-4 team-member">
                <img src="images/team2.jpg" alt="Team Member 2">
                <h4>Jane Smith</h4>
                <p>CTO</p>
            </div>
            <div class="col-md-4 team-member">
                <img src="images/team3.jpg" alt="Team Member 3">
                <h4>Mike Johnson</h4>
                <p>COO</p>
            </div>
        </div>
    </div>-->

    <!-- Footer Section -->
    <div class="footer-section">
        <div class="container">
            <p>&copy; Shopster 2024 - All Rights Reserved</p>
        </div>
    </div>

    <%@include file="components/common_modals.jsp" %>   
</body>
</html>
