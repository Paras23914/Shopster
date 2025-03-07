package com.mycompany.shopster.servlets;

import com.mycompany.shopster.dao.CategoryDao;
import com.mycompany.shopster.dao.ProductDao;
import com.mycompany.shopster.entities.Category;
import com.mycompany.shopster.entities.Product;
import com.mycompany.shopster.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {

                // Add category
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                // Save category to database
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added successfully: " + catId);
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("addproduct")) {
                // Add product
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");

                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());

                // Get category by id
                CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdoa.getCategoryById(catId);

                p.setCategory(category);

                // Save product to database
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);

                // Upload product image
                String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                System.out.println(path);

                try {
                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

                    // Read data
                    byte[] data = new byte[is.available()];
                    is.read(data);

                    // Write data
                    fos.write(data);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product added successfully: " + pName);
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("deleteproduct")) {
                // Delete product
                int pId = Integer.parseInt(request.getParameter("pId"));

                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                Product product = pdao.getProductById(pId);

                if (product != null) {
                    pdao.deleteProduct(product);

                    // Delete product image
                    String path = request.getRealPath("img") + File.separator + "products" + File.separator + product.getpPhoto();
                    File file = new File(path);
                    if (file.exists()) {
                        file.delete();
                    }

                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Product deleted successfully: " + pId);
                    response.sendRedirect("admin.jsp");
                    return;
                } else {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Product not found: " + pId);
                    response.sendRedirect("admin.jsp");
                    return;
                }
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
        return "Short description";
    }
}
