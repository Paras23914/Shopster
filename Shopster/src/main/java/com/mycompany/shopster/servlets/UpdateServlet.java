package com.mycompany.shopster.servlets;

import com.mycompany.shopster.entities.User;
import com.mycompany.shopster.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UpdateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            try {
                HttpSession httpSession = request.getSession();
                User user = (User) httpSession.getAttribute("current-user");

                if (user == null) {
                    out.println("User is not logged in");
                    return;
                }

                String newPassword = request.getParameter("new_password");

                // Password validation
                String passwordPattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
                if (!Pattern.matches(passwordPattern, newPassword)) {
                    out.println("Password must contain at least one digit, one lowercase letter, one uppercase letter, one special character, and be at least 8 characters long.");
                    return;
                }

                // Update user password
                Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();

                user.setUserPassword(newPassword);
                hibernateSession.update(user);

                tx.commit();
                hibernateSession.close();

                httpSession.setAttribute("message", "Password updated successfully");
                response.sendRedirect("index.jsp");
                return;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Update password servlet";
    }
}
