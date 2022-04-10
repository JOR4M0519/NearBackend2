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

        List<User> users = new UserService().getUsers().get();

        User userFounded = users.stream().filter(user -> username.equals(user.getUsername()))
                .findFirst().orElse(null);

        request.setAttribute("name", userFounded.getName());
        request.setAttribute("lastname", userFounded.getLastname());
        request.setAttribute("role", userFounded.getRole());
        request.setAttribute("FCoins", userFounded.getFcoins());


        RequestDispatcher dispatcher = request.getRequestDispatcher("./account.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
        System.out.println(username);
    }
}
