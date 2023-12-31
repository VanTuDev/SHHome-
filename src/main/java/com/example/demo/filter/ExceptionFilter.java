package com.example.demo.filter;


import com.example.demo.Utils.JsonUtils;
import com.example.demo.dto.ErrorMessage;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(filterName = "ExceptionFilter", value = "/*")
public class ExceptionFilter implements Filter {


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        try {
            chain.doFilter(request, response);
        } catch (RuntimeException e) {
            ErrorMessage errorMessage = new ErrorMessage(400, e.toString());
            JsonUtils.out(response, errorMessage, HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
