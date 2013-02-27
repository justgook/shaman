package lv.z0.shaman.core.models;

import junit.framework.TestCase;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


import java.util.List;

public class UserTest extends TestCase {
    private SessionFactory sessionFactory;

    @Override
    protected void setUp() throws Exception {
        // A SessionFactory is set up once for an application
        sessionFactory = new Configuration()
                .configure() // configures settings from hibernate.cfg.xml
                .buildSessionFactory();
    }

    @Override
    protected void tearDown() throws Exception {
        if ( sessionFactory != null ) {
            sessionFactory.close();
        }
    }

    public void testAddUser() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(new User("name", "password1"));
        session.save( new User("name2","password2") );
        session.getTransaction().commit();
        session.close();
    }

    @SuppressWarnings({ "unchecked" })
    public void testListUsers(){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List result = session.createQuery( "from User" ).list();
        for ( User user: (List<User>) result ) {
            System.out.println("User (" + user.getName() + ") : " + user.getPassword());
        }
        session.getTransaction().commit();
        session.close();
    }
}
