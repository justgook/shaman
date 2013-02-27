package lv.z0.shaman.core;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 * http://www.seostella.com/ru/article/2012/03/17/osnovy-hibernate-3-na-primere-raboty-s-mysql.html
 * @author seostella.com
 */
public class DAO {
    private static final Logger log = Logger.getAnonymousLogger();
    private static final ThreadLocal session = new ThreadLocal();
    private static final SessionFactory sessionFactory =
            new AnnotationConfiguration().configure().buildSessionFactory();

    protected DAO() {
    }

    public static Session getSession() {
        Session session = (Session) DAO.session.get();
        if (session == null) {
            session = sessionFactory.openSession();
            DAO.session.set(session);
        }
        return session;
    }

    protected void begin() {
        getSession().beginTransaction();
    }

    protected void commit() {
        getSession().getTransaction().commit();
    }

    protected void rollback() {
        try {
            getSession().getTransaction().rollback();
        } catch (HibernateException e) {
            log.log(Level.WARNING, "Cannot rollback", e);
        }
        try {
            getSession().close();
        } catch (HibernateException e) {
            log.log(Level.WARNING, "Cannot close", e);
        }
        DAO.session.set(null);
    }

    public static void close() {
        getSession().close();
        DAO.session.set(null);
    }
}