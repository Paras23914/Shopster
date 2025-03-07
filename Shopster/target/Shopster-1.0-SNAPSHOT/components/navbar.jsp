<%@page import="com.mycompany.shopster.entities.User"%>
<%

    User user1 = (User) session.getAttribute("current-user");

%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Shopster</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">

                <li class="nav-item active">
                    <a class="nav-link" style="font-size: 15px;" href="#!" data-toggle="modal" data-target="#cart"> 
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart-plus-fill" style="font-size: 15px" viewBox="0 2 16 14">
                            <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0m7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0M9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0"/>
                        </svg><span class="ml-0 cart-items">(0)</span>
                    </a>
                </li>                

                <% if (user1 == null) { %>
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register </a>
                </li>
                <% } else { %>
                <li class="nav-item active">
                    <a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "index.jsp" %>"><%= user1.getUserName() %> </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="update-password.jsp">Update Password</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
                <% } %>

            </ul>
        </div>
    </div>
</nav>
