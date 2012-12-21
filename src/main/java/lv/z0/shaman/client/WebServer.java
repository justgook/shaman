package lv.z0.shaman.client;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.ServletException;
//import java.io.IOException;
import org.eclipse.jetty.server.Server;
//import org.eclipse.jetty.server.Request;
//import org.eclipse.jetty.server.handler.AbstractHandler;


import org.eclipse.jetty.server.Handler;
import org.eclipse.jetty.server.handler.HandlerList;
import org.eclipse.jetty.server.handler.ResourceHandler;
// import org.eclipse.jetty.server.handler.ContextHandler;

public class WebServer
{
		public static void main(String[] args) throws Exception
		{
				Server server = new Server(8080);

				ResourceHandler resource_handler = new ResourceHandler();
				resource_handler.setDirectoriesListed(true);
				resource_handler.setWelcomeFiles(new String[]{ "index.html" });
				resource_handler.setResourceBase("src/main/webapp");

				//http://wiki.eclipse.org/Jetty/Tutorial/Embedding_Jetty#Setting_Contexts
				// ContextHandler context = new ContextHandler();
				// context.setContextPath("/hello");
				// context.setResourceBase(".");
				// context.setClassLoader(Thread.currentThread().getContextClassLoader());
				// server.setHandler(context);
				
				// HandlerContext context = server.addContext("/context/*");
				// context.setResourceBase("./docroot/");
//TODO Check it for javascript / data forwarding to special handler
// http://download.eclipse.org/jetty/stable-9/apidocs/org/eclipse/jetty/server/handler/ContextHandlerCollection.html
				HandlerList handlers = new HandlerList();
				handlers.setHandlers(
					new Handler[] {
						resource_handler,
						new JavascriptHandler(),
						new defaultHandler()
					});
				server.setHandler(handlers);
				server.start();
				server.join();
		}
}