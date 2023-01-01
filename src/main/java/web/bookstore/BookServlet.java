package web.bookstore;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet(name = "BookServlet", urlPatterns = ("/BookServlet"))
public class BookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //doGet(request, response);
        String typeBook = request.getParameter("type");
        ArrayList<Book> books = new ArrayList<Book>();
        //BookServlet.class.getResourceAsStream("book-" + typeBook + ".txt");

        //File file = new File("book-" + typeBook + ".txt");
        BufferedReader br = new BufferedReader(new java.io.InputStreamReader(BookServlet.class.getResourceAsStream("/book-" + typeBook + ".txt")));
        String str;
        while((str = br.readLine()) != null) {
            String[] book = str.split(";");
            books.add(new Book(book[0], book[1], book[3], Float.parseFloat(book[2])));
        }
        request.setAttribute("books", books);
        request.getRequestDispatcher("./views/view.jsp").forward(request, response);
    }

}
