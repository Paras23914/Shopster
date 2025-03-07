<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5"> Your selected items</h3>

                            <div class="cart-body">
                                <!-- Your cart items will be displayed here -->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <!--form details-->
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5"> Your details for order</h3>
                                <form action="OrderConfirmationServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Your name</label>
                                        <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Your Phone Number</label>
                                        <input value="<%= user.getUserPhone() %>" type="text" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Contact number">
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Your shipping address</label>
                                        <textarea class="form-control" id="address" placeholder="Enter your address" rows="3"><%= user.getUserAddress() %></textarea>
                                    </div>

                                    <div class="container text-center"> 
                                        <button type="submit" class="btn btn-outline-success">Order Now</button>
                                        <a href="index.jsp" class="btn btn-outline-primary">Continue Shopping</a>
                                    </div>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/common_modals.jsp" %>        
    </body>
</html>
