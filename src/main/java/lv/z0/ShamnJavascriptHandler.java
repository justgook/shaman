package lv.z0;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
// import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.handler.AbstractHandler;

public class ShamnJavascriptHandler extends AbstractHandler
{
		public void handle(String target,
										   Request baseRequest,
										   HttpServletRequest request,
										   HttpServletResponse response)
				throws IOException, ServletException
		{

				// System.out.println(baseRequest);
				response.setContentType("text/html;charset=utf-8");
				response.setStatus(HttpServletResponse.SC_OK);
				baseRequest.setHandled(true);//if false - skip this handler
				response.getWriter().println("<h1>Hello Im ShamnJavascriptHandler</h1>");
		}
}