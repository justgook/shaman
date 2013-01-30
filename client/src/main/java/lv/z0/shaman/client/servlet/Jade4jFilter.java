package lv.z0.shaman.client.servlet;

import de.neuland.jade4j.Jade4J;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class Jade4jFilter implements Filter {
    private FilterConfig filterConfig = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String path = req.getRequestURI();
        PrintWriter writer = response.getWriter();
        ServletContext servletContext = filterConfig.getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);
        //TODO move to config
        if (path.endsWith(".jade")) {
            //TODO remove model at all or put it to config
            Map<String, Object> model = new HashMap<String, Object>();
            model.put("company", "neuland");
            //TODO add cache possibility
            Jade4J.render(contextPath + path, model, writer);
        } else {
            chain.doFilter(request, response);
        }
//        writer.println(contextPath + path);

//        request.getRealPath();
//        String html = Jade4J.render("./index.jade");
//        HttpServletResponse httpResponse = (HttpServletResponse) response;

//        String contentType = getServletContext().getMimeType(file);



        /*
        Then we just set the appropriate headers
        and invoke the next filter in the chain:
        */
//        httpResponse.setHeader("Cache-Control", "no-cache");
//        httpResponse.setDateHeader("Expires", 0);
//        httpResponse.setHeader("Pragma", "No-cache");
//        chain.doFilter(request, response);
        /*
        this method calls other filters in the order they are
        written in web.xml
        */
    }

    @Override
    public void destroy() {
        this.filterConfig = null;
    }
}
