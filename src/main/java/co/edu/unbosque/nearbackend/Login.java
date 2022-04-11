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
        String role = request.getParameter("role");

        RequestDispatcher dispatcher = null;
        uService = new UserService();
        uService.setRuta(getServletContext().getRealPath("").replace("NEArBackend-1.0-SNAPSHOT","")+ "classes"+File.separator+"Users.csv");
        
        List<User> users = new UserService().getUsers().get();

        User userFounded = users.stream().filter(user -> username.equals(user.getUsername()) && password.equals(user.getPassword()) && role.equals(user.getRole()) )
                .findFirst().orElse(null);


        if (userFounded == null) {
            request.setAttribute("status", "failed");
            System.out.println("failed");
            dispatcher = request.getRequestDispatcher("login.jsp");
        }
        else{
            if (username.equals(userFounded.getUsername()) && password.equals(userFounded.getPassword())) {
                request.setAttribute("name", userFounded.getName());
                request.setAttribute("role", userFounded.getRole());
                uService.setRuta(getServletContext().getRealPath("").replace("NEArBackend-1.0-SNAPSHOT","")+ "classes"+File.separator+"FCoins.csv");
                request.setAttribute("fcoins", uService.amountMoney(username));

                dispatcher = request.getRequestDispatcher("./index.jsp");
            }
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }

    }
}