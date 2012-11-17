package lv.z0;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.handler.AbstractHandler;


import org.eclipse.jetty.server.Handler;
import org.eclipse.jetty.server.handler.HandlerList;
import org.eclipse.jetty.server.handler.ResourceHandler;

public class ShamanServer extends AbstractHandler
{
		public void handle(String target,
										   Request baseRequest,
										   HttpServletRequest request,
										   HttpServletResponse response)
				throws IOException, ServletException
		{
				response.setContentType("text/html;charset=utf-8");
				response.setStatus(HttpServletResponse.SC_OK);
				baseRequest.setHandled(true);
				response.getWriter().println("<h1>Hello World From Default HelloWorld servlet</h1>");
		}

		public static void main(String[] args) throws Exception
		{
				Server server = new Server(8080);

				ResourceHandler resource_handler = new ResourceHandler();
				resource_handler.setDirectoriesListed(true);
				resource_handler.setWelcomeFiles(new String[]{ "index.html" });

				resource_handler.setResourceBase("src/main/webapp");

				HandlerList handlers = new HandlerList();
				handlers.setHandlers(
					new Handler[] {
						resource_handler,
						new ShamanServer()
					});
				server.setHandler(handlers);
				server.start();
				server.join();
		}
}