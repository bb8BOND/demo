import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class HelloWorld extends HttpServelet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    out.println("<html><head>paiza</head><body>");
    out.println("<p>Hello World!<p>");
    out.println("</body></heml>");

  }  
}
