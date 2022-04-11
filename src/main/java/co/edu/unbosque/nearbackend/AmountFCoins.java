package co.edu.unbosque.nearbackend;

import co.edu.unbosque.nearbackend.dtos.FCoins;
import co.edu.unbosque.nearbackend.dtos.User;
import co.edu.unbosque.nearbackend.services.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "money", value = "/money")
public class AmountFCoins extends HttpServlet {

    private String message;
    private UserService uService;


    public void init() {
        message = "Hello World!";
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        String fcoins = request.getParameter("cantidad");
        String username = request.getParameter("username");
        String role = request.getParameter("role");

        uService = new UserService();
        uService.setRuta(getServletContext().getRealPath("").replace("NEArBackend-1.0-SNAPSHOT","")+ "classes"+File.separator+"FCoins.csv");

        uService.createMoney(username,fcoins, getServletContext().getRealPath("") + File.separator);
        request.setAttribute("fcoins", uService.amountMoney(username));

        uService.setRuta(getServletContext().getRealPath("").replace("NEArBackend-1.0-SNAPSHOT","")+ "classes"+File.separator+"Users.csv");
        List<User> users = new UserService().getUsers().get();

        User userFounded = users.stream().filter(user -> username.equals(user.getUsername()) && role.equals(user.getRole()))
                .findFirst().orElse(null);

        request.setAttribute("role", userFounded.getRole());
        request.setAttribute("name", userFounded.getName());


        RequestDispatcher dispatcher =request.getRequestDispatcher("./index.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

}

