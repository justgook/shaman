package lv.z0.shaman.server.PublicServer;
import lv.z0.shaman.client.*;
import org.eclipse.jetty.server.Handler;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.HandlerList;

public class PublicServer {

    void startWebServer () throws Exception {
        HandlerList handlers = new HandlerList();
        handlers.setHandlers(
                new Handler[] {
                        new JavascriptHandler(),
                });
        //TODO move to properties ServerPort
        Server server = new Server(8181);
        server.setHandler(handlers);
        server.start();
        server.join();
    }

    public void startSocketServer () {

    }

    public void getSettings (String[] args) {
//        System.out.println(args[0]);
//        http://www.mkyong.com/java/java-properties-file-examples/
//        http://stackoverflow.com/questions/10828569/regex-to-get-flags-from-console-command
//        http://weblogs.java.net/blog/kohsuke/archive/2005/05/parsing_command.html

    }

    public static void main(String[] args) throws Exception
    {
        PublicServer server = new PublicServer();
        server.getSettings(args);
        server.startWebServer();
        server.startSocketServer();
    }
}
