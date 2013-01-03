package lv.z0.shaman.client;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.handler.AbstractHandler;

public class JavascriptHandler extends AbstractHandler
{
		public void handle(String target,
										   Request baseRequest,
										   HttpServletRequest request,
										   HttpServletResponse response)
				throws IOException, ServletException
		{

				response.setContentType("text/html;charset=utf-8");
				response.setStatus(HttpServletResponse.SC_OK);
				baseRequest.setHandled(true); //if false - skip this handler
				response.getWriter().println("<h1>Hello Im ShamanJavascriptHandler</h1>");
		}
}