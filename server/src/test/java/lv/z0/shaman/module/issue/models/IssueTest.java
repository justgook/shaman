package lv.z0.shaman.module.issue.models;

import java.util.Date;
import java.util.List;

import junit.framework.TestCase;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * User: gook
 * Date: 2/25/13
 * Time: 9:49 PM
 */

public class IssueTest extends TestCase {
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

    public void testAddIssue() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save( new Issue( "Our very first issue!", new Date() ) );
        session.save( new Issue( "A follow up issue", new Date() ) );
        session.getTransaction().commit();
        session.close();
    }

    @SuppressWarnings({ "unchecked" })
    public void testListIssues(){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List result = session.createQuery( "from Issue" ).list();
        for ( Issue issue : (List<Issue>) result ) {
            System.out.println("Issue (" + issue.getDate() + ") : " + issue.getTitle());
        }
        session.getTransaction().commit();
        session.close();
    }
}

