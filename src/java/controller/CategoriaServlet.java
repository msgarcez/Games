/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoriaDAO;
import dao.ProdutoDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import model.CategoriaBean;
import model.ProdutoBean;

/**
 *
 * @author danie
 */
public class CategoriaServlet extends HttpServlet {

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
        CategoriaDAO cdao = new CategoriaDAO();
        ProdutoDAO pdao = new ProdutoDAO();
        ProdutoBean pbean = new ProdutoBean();
        CategoriaBean categoria = new CategoriaBean();
        RequestDispatcher rd = null;
        HttpSession session = request.getSession();
        if(acao.equalsIgnoreCase("cadastrar")){
            categoria.setNome(request.getParameter("nome"));
            cdao.inserir(categoria);
            rd = request.getRequestDispatcher("administrativa.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            categoria = cdao.selecionaPorId(id);
            session.setAttribute("categoria", categoria);
            rd = request.getRequestDispatcher("Edita_Categoria.jsp");
            rd.forward(request, response);
        }
        if(acao.equalsIgnoreCase("alterar_categoria")){
            int id = Integer.parseInt(request.getParameter("id"));
            categoria.setId(id);
            categoria.setNome(request.getParameter("nome"));
            cdao.alterar(categoria);
            rd = request.getRequestDispatcher("Altera_Categoria.jsp");
            rd.forward(request, response);
        }
        if(acao.equalsIgnoreCase("excluir")){
            int id = Integer.parseInt(request.getParameter("id"));
            cdao.excluir(id);
            rd = request.getRequestDispatcher("administrativa.jsp");
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
