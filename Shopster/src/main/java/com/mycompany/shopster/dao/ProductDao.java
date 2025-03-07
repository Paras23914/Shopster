package com.mycompany.shopster.dao;

import com.mycompany.shopster.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }

    // Get all products
    public List<Product> getAllProducts() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.list();
        s.close();
        return list;
    }

    // Get all products of a given category
    public List<Product> getAllProductsById(int cid) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product as p where p.category.categoryId = :id");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        s.close();
        return list;
    }

    // Get a product by its ID
    public Product getProductById(int productId) {
        Product product = null;
        try (Session session = this.factory.openSession()) {
            product = session.get(Product.class, productId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    // Delete a product
    public boolean deleteProduct(Product product) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.delete(product);
            tx.commit();
            session.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }
}
