package contoller;

import model.User;
import dao.UserDao;
import util.PasswordUtils;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.*;
/**
 * ControllerServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 * @author Netta Richer
 * @author Sagi Granot
 *
 */
@WebServlet("/")
public class UserServlet extends HttpServlet {
    private UserDao userDao;
    private String salt;

    public void init() {
        userDao = new UserDao();
        salt = PasswordUtils.getSalt(30);
    }
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/login":
                    auth(request, response);
                    break;
                case "/insert":
                    insertUser(request, response);
                    break;
                default:
                    //TODO add this
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");

        String securedPassword = PasswordUtils.generateSecurePassword(request.getParameter("password"), salt);

        User newUser = new User(firstname, lastname, email, securedPassword);
        userDao.saveUser(newUser);
        response.sendRedirect("register.jsp");
    }

    private void auth(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String email = request.getParameter("email");
        String securedPassword = PasswordUtils.generateSecurePassword(request.getParameter("password"), salt);

        if (userDao.validate(email,securedPassword)) {
            //System.out.println("true"+ securedPassword);
            Cookie loginCookie = new Cookie("user",email);
            //setting cookie to expiry in 30 mins
            loginCookie.setMaxAge(30*60);
            response.addCookie(loginCookie);
            response.sendRedirect("quiz.jsp");
        }
        else {
            System.out.println(securedPassword);
            response.sendRedirect("register.jsp");
        }
    }
}
