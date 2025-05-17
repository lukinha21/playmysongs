package com.example.playmysongs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@WebServlet(name = "UploadServlet", value = "/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String uploadPath = getServletContext().getRealPath("/") + "musicas"; // Caminho onde as músicas serão salvas

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); // Cria o diretório se não existir
        }

        String nomeMusica = request.getParameter("nomeMusica");
        String estiloMusica = request.getParameter("estiloMusica");
        String cantor = request.getParameter("cantor");

        // Validar nome da música, estilo e cantor
        if (!validarNomeMusica(nomeMusica) || !validarEstilo(estiloMusica) || !validarCantor(cantor)) {
            response.getWriter().println("Erro: Informações inválidas.");
            return;
        }

        Part filePart = request.getPart("file");
        String fileName = extractFileName(filePart); // Extrai o nome do arquivo
        String fileExtension = getFileExtension(fileName);
        String newFileName = nomeMusica + "_" + estiloMusica + "_" + cantor + fileExtension;

        filePart.write(uploadPath + File.separator + newFileName); // Salva o arquivo com o novo nome

        response.getWriter().println("Arquivo enviado com sucesso!");
    }

    // Método para extrair o nome do arquivo do cabeçalho do Part
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    // Método para obter a extensão do arquivo
    private String getFileExtension(String fileName) {
        int lastIndex = fileName.lastIndexOf(".");
        return lastIndex != -1 ? fileName.substring(lastIndex) : "";
    }

    // Métodos de validação
    private boolean validarNomeMusica(String nomeMusica) {
        // Verifica se o nome da música contém apenas letras, números, espaço em branco e underline
        return nomeMusica.matches("[\\w\\s]+");
    }

    private boolean validarEstilo(String estiloMusica) {
        // Verifica se o estilo da música contém apenas letras, números, espaço em branco e underline
        return estiloMusica.matches("[\\w\\s]+");
    }

    private boolean validarCantor(String cantor) {
        // Verifica se o nome do cantor contém apenas letras, espaço em branco e underline
        return cantor.matches("[\\w\\s]+");
    }
}
