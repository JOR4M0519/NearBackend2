package co.edu.unbosque.nearbackend;

import co.edu.unbosque.nearbackend.dtos.User;
import co.edu.unbosque.nearbackend.services.UserService;


import java.io.*;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {
    private String message;
    private UserService uService;

    public void init() {
        message = "Hello World!";
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        uService = new UserService();
        uService.setRuta(getServletContext().getRealPath("").replace("NEArBackend-1.0-SNAPSHOT","")+ "classes"+File.separator+"Users.csv");
        
        List<User> users = new UserService().getUsers().get();

        User userFounded = users.stream().filter(user -> username.equals(user.getUsername()) && password.equals(user.getPassword()))
                .findFirst().orElse(null);

        if (username.equals(userFounded.getUsername()) && password.equals(userFounded.getPassword())) {

            if (userFounded == null) {

                response.sendRedirect("./401.html");

            } else {
                request.setAttribute("name", userFounded.getName());
                RequestDispatcher dispatcher = request.getRequestDispatcher("./index.jsp");

                try {

                    dispatcher.forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}