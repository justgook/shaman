package lv.z0.shaman.servlet;

import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;


public class REST extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> classes = new HashSet<Class<?>>();
        classes.add(lv.z0.shaman.core.REST.class);
        return classes;
    }

}