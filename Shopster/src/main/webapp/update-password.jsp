<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Password</title>
        <%@include file="components/common_css_js.jsp" %>
        <script>
            function validateForm() {
                var password = document.getElementById("new_password").value;
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
                            </div>
                            <h3 class="text-center my-3">Update Your Password</h3>
                            <form action="UpdateServlet" method="post" onsubmit="return validateForm()">
                                <div class="form-group">
                                    <label for="new_password">New Password</label>
                                    <input name="new_password" type="password" class="form-control" id="new_password" aria-describedby="passwordHelp" placeholder="Enter new password">
                                    <small id="passwordHelp" class="form-text text-muted">
                                        Password must contain at least one digit, one lowercase letter, one uppercase letter, one special character, and be at least 8 characters long.
                                    </small>
                                </div>
                                <div class="container text-center"> 
                                    <button class="btn btn-outline-success" type="submit">Update Password</button>
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
