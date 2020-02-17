package dao;

import org.hibernate.classic.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.User;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 * DataAccessObject actions
 * @author Netta Richer
 * @author Sagi Granot
 *
 */
public class UserDao {

    /**
     * Save User
     * @param user A User object containing the user's details
     *
     * @see model.User
     */

    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                sessionFactory = (new AnnotationConfiguration()).configure().buildSessionFactory();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }

    public boolean saveUser(User user) {
        Transaction transaction = null;
        try {
            Session session = getSessionFactory().openSession();
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(user);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * Validate User
     * @param email The user's email address
     * @param password The user's plain password
     */
    public boolean validate(String email, String password) {
        Transaction transaction = null;
        User user = null;
        try {
            SessionFactory factory = (new AnnotationConfiguration()).configure().buildSessionFactory();
            Session session = factory.openSession();
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            user = (User) session.createQuery("FROM User U WHERE U.email = :theemail AND U.password = :thepassword")
                    .setParameter("theemail", email).setParameter("thepassword", password)
                    .uniqueResult();
            if (user != null && user.getPassword().equals(password)) {
                return true;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
}