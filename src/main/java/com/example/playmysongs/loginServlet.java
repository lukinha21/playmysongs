package com.example.playmysongs;

import com.example.playmysongs.security.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login-servlet")
public class loginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String pswd = request.getParameter("pswd");

        if (login != null && !login.isEmpty() && pswd != null && !pswd.isEmpty()) {
            StringBuilder aux = new StringBuilder(pswd);
            if (login.equals(aux.reverse().toString())) {
                User user = new User(login);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("index.jsp"); // Redireciona para a página principal
                return;
            }
        }
        // Se o login falhar, redireciona de volta para a página de login
        response.sendRedirect("login.jsp");
    }
}
