/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartaoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartaoCreditoBean;

/**
 *
 * @author danie
 */
public class CartaoServlet extends HttpServlet {

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
        RequestDispatcher rd = null;
        HttpSession session = request.getSession();
        CartaoDAO cdao = new CartaoDAO();
        CartaoCreditoBean cbean = new CartaoCreditoBean();
        if(acao.equalsIgnoreCase("inserir")){
            cbean.setNumero(request.getParameter("numero"));
            cbean.setData(Date.valueOf(request.getParameter("data_validade")));
            cbean.setNome_cartao(request.getParameter("nome_cartao"));
            cbean.setBandeira(request.getParameter("bandeira"));
            cbean.setVezes(Integer.parseInt(request.getParameter("vezes")));
            cbean.setId_usuario(Integer.parseInt(String.valueOf(session.getAttribute("id_usuario"))));
            cbean.setCvv(Integer.parseInt(request.getParameter("cvv")));
            cdao.inserir(cbean);
            rd= request.getRequestDispatcher("Altera_User.jsp");
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
