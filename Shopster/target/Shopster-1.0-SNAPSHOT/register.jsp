<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
        <script>
            function validateForm() {
                var password = document.getElementById("password").value;
                var passwordPattern = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$/;
                if (!passwordPattern.test(password)) {
                    alert("Password must contain at least one digit, one lowercase letter, one uppercase letter, one special character, and be at least 8 characters long.");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img src="img/add-friend-square.jpg" style="max-width: 150px; max-height: 150px" class="img-fluid" alt="Person image">
                            </div>
                            <h3 class="text-center my-3">Sign up here !!</h3>
                            <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Here">
                                    <small id="passwordHelp" class="form-text text-muted">
                                        Password must contain at least one digit, one lowercase letter, one uppercase letter, one special character, and be at least 8 characters long.
                                    </small>
                                </div>
                                <div class="form-group">
                                    <label for="Phone">User Phone</label>
                                    <input name="user_phone" type="number" class="form-control" id="Phone" aria-describedby="emailHelp" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="Phone">User Address</label>
                                    <textarea name="user_address" style="height: 200px;" class="form-control" placeholder="Enter your address"></textarea>
                                </div>
                                <div class="container text-center"> 
                                    <button class="btn btn-outline-success" type="submit">Register</button>
                                    <button class="btn btn-outline-warning" type="reset">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
