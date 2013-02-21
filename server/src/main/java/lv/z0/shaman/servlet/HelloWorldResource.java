package lv.z0.shaman.servlet;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

@Path("/helloworld")
public class HelloWorldResource {
    //http://habrahabr.ru/qa/16035/
//       Посоветуйте JSON библиотеку под Java есть решение

    @GET
    public String getMessage() {
        return "Hello World!";
    }
}
