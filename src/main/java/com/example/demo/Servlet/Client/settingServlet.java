package com.example.demo.Servlet.Client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "settingServlet", value = "/client/settingView")
public class settingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getRequestDispatcher("WEB-INF/views/client/").forward(req,resp);
        req.getRequestDispatcher("WEB-INF/views/client/settingView.jsp").forward(req,resp);

    }
}
