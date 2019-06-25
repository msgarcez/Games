/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartaoDAO;
import dao.EnderecoDAO;
import dao.ItemVendaDAO;
import dao.ProdutoDAO;
import dao.VendaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartaoCreditoBean;
import model.EnderecoBean;
import model.ItemVendaBean;
import model.ProdutoBean;
import model.VendaBean;

/**
 *
 * @author danie
 */
public class VendaServlet extends HttpServlet {

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
        ProdutoDAO pdao = new ProdutoDAO();
        ProdutoBean pbean = new ProdutoBean();

        ItemVendaDAO ivdao = new ItemVendaDAO();
        ItemVendaBean ibean = new ItemVendaBean();

        HttpSession session = request.getSession();

        VendaBean vbean = new VendaBean();
        VendaDAO vdao = new VendaDAO();

        EnderecoDAO edao = new EnderecoDAO();
        EnderecoBean ebean = new EnderecoBean();

        CartaoCreditoBean cbean = new CartaoCreditoBean();
        CartaoDAO cdao = new CartaoDAO();

        Date data = new Date();
        SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd");
        if (acao.equalsIgnoreCase("adicionar_venda")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            pbean = pdao.selecionaPorId(id);
            double total = pbean.getPreco() * quantidade;
            int est = pbean.getEstoque() - quantidade;
            ebean = edao.selecionaEnderecoPorId(Integer.parseInt(String.valueOf(session.getAttribute("id_usuario"))));
            int id_endereco = ebean.getId();

            cbean = cdao.selecionaEnderecoPorId(Integer.parseInt(String.valueOf(session.getAttribute("id_usuario"))));
            int id_cartao = cbean.getId();

            vbean.setTotal(total);
            vbean.setId_usuario(Integer.parseInt(String.valueOf(session.getAttribute("id_usuario"))));
            vbean.setId_endereco(id_endereco);
            vbean.setId_cartao(id_cartao);
            vbean.setDate(formatador.format(data));
            vdao.inserir(vbean);
            session.setAttribute("venda", vbean);

            pbean.setEstoque(est);
            pbean.setId(id);
            vdao.alterar_estoque(pbean);
            
            //inserir item_venda teste
            List<ProdutoBean> produtos = (List<ProdutoBean>) session.getAttribute("carrinho");
            for (ProdutoBean produto : produtos){
                ItemVendaBean ivb = new ItemVendaBean();
                ivb.setId_produto(produto.getId());
                ivb.setId_venda(vdao.ulti_insert());
                ivb.setQuantidade(produto.getQuantidade());
                ivdao.inserir(ivb);
            }
            
            rd = request.getRequestDispatcher("index.jsp");
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
