package co.edu.unbosque.nearbackend;
import co.edu.unbosque.nearbackend.dtos.NFT_Picture;
import co.edu.unbosque.nearbackend.services.UserService;
import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "generalListFiles", value = "/generalListFiles")
public class GeneralListfiles extends HttpServlet {
    private String UPLOAD_DIRECTORY = "NFTS";

    private UserService uService;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Specifying the content type for the response
        response.setContentType("application/json");

        uService = new UserService();

        uService.setRuta(getServletContext().getRealPath("").replace("NEArBackend-1.0-SNAPSHOT","")+ "classes"+File.separator+"Nfts.csv");

        List<NFT_Picture> nfts = uService.getNft().get();

        // Getting an instance of the upload path
        String uploadPath = getServletContext().getRealPath("")+File.separator+UPLOAD_DIRECTORY;

        File uploadDir = new File(uploadPath);

        // Listing file names in path
        int i =1;
        //id,extension,title,author,price,likes,email_owner
        List<NFT_Picture> files = new ArrayList<NFT_Picture>();
        for (File file : uploadDir.listFiles()) {
            NFT_Picture nft = null;
            nft = nfts.stream().filter(nft_picture -> (file.getName()).equals(nft_picture.getId())).findFirst().orElse(null);
            if(nft != null){
                nft.setId(UPLOAD_DIRECTORY + File.separator + file.getName());
                if(i<5){files.add(nft); i++;}
            }
        }
        // Adding the data to response, parsing it to json using Gson library
        PrintWriter out = response.getWriter();
        out.println(new Gson().toJson(files));
    }
}
