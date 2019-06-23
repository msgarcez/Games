/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProdutoDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
        ProdutoBean pbean = new ProdutoBean();
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

            String id_produto = request.getParameter("id_produto");
            String nome = id_produto + Integer.toString((int) (Math.random() * 999999999));
            String caminho = request.getServletContext().getRealPath("img") + "/../../web/img/" + nome + ".jpg";
            System.out.println(caminho);

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
            session.setAttribute("id_produto", produto.getId());
            rd = request.getRequestDispatcher("Detalhes_Produtos.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("adicionar_carrinho")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            pbean = pdao.selecionaPorId(id);
            List<ProdutoBean> carrinho = new ArrayList<ProdutoBean>();
            if (session.getAttribute("carrinho") != null) {
                List<ProdutoBean> produtos = (List<ProdutoBean>) session.getAttribute("carrinho");
                for (ProdutoBean p : produtos) {
                    carrinho.add(p);
                }
            }
            pbean.setQuantidade(quantidade);
            carrinho.add(pbean);
            session.setAttribute("carrinho", carrinho);
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("remover_carrinho")) {
            int id = Integer.parseInt(request.getParameter("id"));
            List<ProdutoBean> carrinho = new ArrayList<ProdutoBean>();
            List<ProdutoBean> produtos = (List<ProdutoBean>) session.getAttribute("carrinho");
            for (ProdutoBean p : produtos) {
                if (p.getId() != id) {
                    carrinho.add(p);
                }
            }
            session.setAttribute("carrinho", carrinho);
            rd = request.getRequestDispatcher("carrinho.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("Editar_Produto")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ProdutoBean produto = pdao.selecionaPorId(id);
            session.setAttribute("produto", produto);
            rd = request.getRequestDispatcher("Editar_Produto.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            pbean.setId(id);
            pbean.setNome(request.getParameter("nome"));
            pbean.setPreco(Double.parseDouble(request.getParameter("preco")));
            pbean.setId_categoria(Integer.parseInt(request.getParameter("categoria")));
            pbean.setEspecificacao(request.getParameter("especificacao"));
            pbean.setEstoque(Integer.parseInt(request.getParameter("estoque")));
            pdao.alterar(pbean);
            rd = request.getRequestDispatcher("administrativa.jsp");
            rd.forward(request, response);
        }
        if (acao.equalsIgnoreCase("Excluir_Produto")) {
            int id = Integer.parseInt(request.getParameter("id"));
            pdao.excluir(id);
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
