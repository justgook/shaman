package lv.z0.shaman.core;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

@Path("/")
public class REST {
    //http://habrahabr.ru/qa/16035/
    //Посоветуйте JSON библиотеку под Java есть решение
    @GET
    public String root() {
        return "Root";
    }

    @GET
    @Path("auth")
    public String getAuth() {
        return "AUTH";
    }

    @POST
    @Path("auth")
    public String postAuth (
            @FormParam("email") String email,
            @FormParam("password") String password
            ) {
        return "Weeeppyyy \nLogin:" + email + "\nEmail" + password;
    }



//    @GET
//    public String getMessage() {
//        return "Hello World!";
//    }
}
