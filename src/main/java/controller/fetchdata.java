package controller;

import Dao.jdbc;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/servlet")
public class fetchdata extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        String event = req.getParameter("event");
        if (event.equals("show")){

            int typeid=Integer.parseInt(req.getParameter("typeid"));
            jdbc ed= new jdbc();
            List<Product> ser=ed.show(typeid);
            GsonBuilder gsonBuilder = new GsonBuilder();
            Gson gson = gsonBuilder.create();
            String JSONObject = gson.toJson(ser);
            out.print(JSONObject);
        }
    }
}
