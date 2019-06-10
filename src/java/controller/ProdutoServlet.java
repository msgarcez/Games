/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProdutoDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ProdutoBean;

/**
 *
 * @author danie
 */
public class ProdutoServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        String acao = request.getParameter("acao");
        ProdutoDAO pdao = new ProdutoDAO();
        RequestDispatcher rd = null;
        HttpSession session = request.getSession();
        if (acao.equalsIgnoreCase("produto")) {
            ProdutoBean produto = new ProdutoBean();
            produto.setNome(request.getParameter("nome"));
            produto.setPreco(Double.parseDouble(request.getParameter("preco")));
            produto.setId_categoria(Integer.parseInt(request.getParameter("categoria")));
            produto.setEspecificacao(request.getParameter("especificacao"));
            produto.setEstoque(Integer.parseInt(request.getParameter("estoque")));
            produto.setImg(request.getParameter("img"));
            pdao.inserir(produto);
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("listar")) {
            List listaDeClientes = pdao.todosProdutos();
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("verProduto")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ProdutoBean produto = pdao.selecionaPorId(id);
            session.setAttribute("produto", produto);
            rd = request.getRequestDispatcher("Detalhes_Produtos.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
