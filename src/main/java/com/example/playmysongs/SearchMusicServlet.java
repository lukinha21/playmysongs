package com.example.playmysongs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;

@WebServlet(name = "SearchMusicServlet", value = "/searchMusic")
public class SearchMusicServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Obtém o diretório onde as músicas foram enviadas
        File musicFolder = new File(getServletContext().getRealPath("/musicas"));

        // Verifica se o diretório existe
        if (!musicFolder.exists() || !musicFolder.isDirectory()) {
            response.getWriter().println("Pasta de música não encontrada");
            return;
        }

        // Lista os arquivos de música na pasta
        File[] musicFiles = musicFolder.listFiles();
        if (musicFiles == null || musicFiles.length == 0) {
            response.getWriter().println("Nenhuma música encontrada");
            return;
        }

        // Processa a pesquisa, se houver
        String searchQuery = request.getParameter("searchQuery");
        if (searchQuery != null && !searchQuery.isEmpty()) {
            response.getWriter().println("<h2>Resultado da Pesquisa:</h2>");
            response.getWriter().println("<ul>");
            for (File musicFile : musicFiles) {
                if (musicFile.isFile() && musicFile.getName().toLowerCase().contains(searchQuery.toLowerCase())) {
                    String audioPath = request.getContextPath() + "/musicas/" + musicFile.getName();
                    response.getWriter().println("<li>" + musicFile.getName() + " <audio controls><source src=\"" + audioPath + "\" type=\"audio/mp3\"></audio></li>");
                }
            }
            response.getWriter().println("</ul>");
        }
    }
}
