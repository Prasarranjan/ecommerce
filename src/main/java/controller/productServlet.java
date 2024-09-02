package controller;

import Dao.jdbc;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;


    @WebServlet("/productServlet")
    @MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
            maxFileSize = 1024 * 1024 * 10,      // 10MB
            maxRequestSize = 1024 * 1024 * 50)   // 50MB
    public class productServlet extends HttpServlet {
        private static final String UPLOAD_DIR = "image";

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String event = req.getParameter("event");
            PrintWriter out=resp.getWriter();
            if (event.equals("formproduct")) {
                String productName = req.getParameter("productName");
                int productPrice = Integer.parseInt(req.getParameter("productPrice"));
                int typeId = Integer.parseInt(req.getParameter("typeid"));

                Part filePart = req.getPart("productImage");
                System.out.println(filePart);
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                System.out.println(fileName);
                if (filePart != null) {
                    String fs = filePart.getSubmittedFileName();
                    System.out.println("File Name: " + fs);
                } else {
                    System.out.println("No file part found in the request.");
                }
                // Define the upload directory
                //  String uploadPath = getServletContext().getRealPath("/image/")+ File.separator+UPLOAD_DIR;
                String uploadPath = "/home/prasar/Documents/ecom/src/main/webapp/image";

                File uploadDir = new File(uploadPath);
                String contentType = req.getContentType();
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();  // Use mkdirs to create parent directories if necessary
                }
                System.out.println("Content-Type: " + contentType);
                System.out.println(uploadPath);
                // File uploadDir = new File(uploadPath);


                // Save the file in the specified directory
                filePart.write(uploadPath + File.separator + fileName);
                System.out.println("Upload Path: " + uploadPath);
                Product pd = new Product();
                pd.setProductName(productName);
                pd.setProductImage(fileName);
                pd.setPrice(productPrice);
                pd.setTypeId(typeId);

                int status = jdbc.saveDetails(pd);
                if (status == 1) {
                    out.println("done");
                }
                else {
                    out.println("heini");
                }

            }
        }
    }

