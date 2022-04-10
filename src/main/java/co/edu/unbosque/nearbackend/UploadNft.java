package co.edu.unbosque.nearbackend;

import co.edu.unbosque.nearbackend.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

@WebServlet(name = "uploadNft", value = "/uploadNft")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)

public class UploadNft extends HttpServlet {

    private String message;
    private UserService uService;


    public void init() {
        message = "Hello World!";
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        uService = new UserService();

        String extension="";
        String fileName="";
        String tittle = request.getParameter("titulo");
        String price = request.getParameter("precio");
        //BUSCAR
        String author = request.getParameter("username");

        String uploadPath = getServletContext().getRealPath("")+File.separator+"NFTS";


        File uploadDir = new File(uploadPath);
        // If path doesn`t exist, create it
        if (!uploadDir.exists()) uploadDir.mkdir();


        try {
            // Getting each part from the request
            for (Part part : request.getParts()) {
                // Storing the file using the same name
                extension = part.getSubmittedFileName().split(".")[1];
                fileName = uService.generateRandomString()+"."+extension+"&"+tittle;
                part.write(uploadPath + File.separator + fileName);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }


        uService.createNFT(fileName,extension,tittle,author,price,"",getServletContext().getRealPath("") + File.separator);

        // Redirecting
        response.sendRedirect("./result.html");

    }

}

