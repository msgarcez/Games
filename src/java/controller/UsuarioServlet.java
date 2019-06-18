/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UsuarioBean;

/**
 *
 * @author danie
 */
public class UsuarioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        UsuarioDAO udao = new UsuarioDAO();
        RequestDispatcher rd = null;
        HttpSession session = request.getSession();
        if (acao.equalsIgnoreCase("inserir")) {
            UsuarioBean usuario = new UsuarioBean();
            usuario.setNome_usuario(request.getParameter("nome_usuario"));
            usuario.setSenha(request.getParameter("senha"));
            usuario.setNome(request.getParameter("nome"));
            usuario.setEmail(request.getParameter("email"));
            udao.inserir(usuario);
            rd = request.getRequestDispatcher("Logar.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("logar")) {
            UsuarioBean usuario = new UsuarioBean();
            usuario.setNome_usuario(request.getParameter("nome_usuario"));
            usuario.setSenha(request.getParameter("senha"));
            UsuarioBean user = udao.consultarLogin(usuario);
            if (user.getNome() != null) {
                session.setAttribute("usuario", user);
                session.setAttribute("id_usuario", user.getId());
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("Logar.jsp");
            }
        }
        if (acao.equalsIgnoreCase("sair")) {
            session.invalidate();
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("inserir_admin")) {
            UsuarioBean usuario = new UsuarioBean();
            usuario.setNome_usuario(request.getParameter("nome_usuario"));
            usuario.setSenha(request.getParameter("senha"));
            usuario.setNome(request.getParameter("nome"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setAdmin(Boolean.parseBoolean(request.getParameter("admin")));
            System.out.println(usuario.getAdmin());
            udao.inserir_admin(usuario);
            rd = request.getRequestDispatcher("administrativa.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("editar")) {
            UsuarioBean usuario = new UsuarioBean();
            int id = Integer.parseInt(request.getParameter("id"));
            usuario = udao.selecionaPorId(id);
            session.setAttribute("usuario", usuario);
            rd = request.getRequestDispatcher("Edita_Usuario.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("alterar_usuario_admin")) {
            UsuarioBean usuario = new UsuarioBean();
            int id = Integer.parseInt(request.getParameter("id"));
            //nome_usuario=?, nome=?, email=?, admin=?
            usuario.setId(id);
            usuario.setNome_usuario(request.getParameter("nome_usuario"));
            usuario.setNome(request.getParameter("nome"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setAdmin(Boolean.parseBoolean(request.getParameter("admin")));
            udao.alterar_admin(usuario);
            rd = request.getRequestDispatcher("Edita_Usuario.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
