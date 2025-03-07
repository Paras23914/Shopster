
package com.mycompany.shopster.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author samee
 */
public class FactoryProvider {
    private static SessionFactory factory;
    
    public static SessionFactory getFactory()
    {
        try {
            if(factory == null){
               factory =  new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        }
        } catch (Exception e) {
        }
        
        return factory;
    }
}
