package co.edu.unbosque.nearbackend;

import co.edu.unbosque.nearbackend.dtos.User;
import co.edu.unbosque.nearbackend.services.UserService;
import java.io.*;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "account", value = "/account")
public class Account extends HttpServlet {
    private String message;
    private UserService uService;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("./index.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String username = request.getParameter("usernameData");

        uService = new UserService();
        uService.setRuta(getServletContext().getRealPath("").replace("NEArBackend-1.0-SNAPSHOT","")+ "classes"+File.separator+"Users.csv");

        List<User> users = uService.getUsers().get();

        User userFounded = users.stream().filter(user -> username.equals(user.getUsername()))
                .findFirst().orElse(null);

        request.setAttribute("name", userFounded.getName());
        request.setAttribute("lastname", userFounded.getLastname());
        request.setAttribute("role", userFounded.getRole());
        request.setAttribute("FCoins", userFounded.getFcoins());
        PersonalListfiles p = new PersonalListfiles();
        p.setEmail(username);
        RequestDispatcher dispatcher = request.getRequestDispatcher("./account.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}
