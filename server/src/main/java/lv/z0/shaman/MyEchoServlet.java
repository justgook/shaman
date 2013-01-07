package lv.z0.shaman;
import org.eclipse.jetty.websocket.servlet.WebSocketServlet;
import org.eclipse.jetty.websocket.servlet.WebSocketServletFactory;

/**
 * Example servlet for most basic form.
 */
@SuppressWarnings("serial")
public class MyEchoServlet extends WebSocketServlet
{
    @Override
    public void configure(WebSocketServletFactory factory)
    {
        factory.register(MyEchoSocket.class);
    }
}