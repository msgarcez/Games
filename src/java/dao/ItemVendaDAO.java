/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ItemVendaBean;
import model.ProdutoBean;

/**
 *
 * @author danie
 */
public class ItemVendaDAO {
    private Connection conexao;
    public ItemVendaDAO(){
        try {
            this.conexao = ConnectionFactory.getConnection();
        } catch (Exception e) {
            System.out.println("Erro: "+e.getMessage());
        }
    }
    PreparedStatement ps = null;
    //método para INSERIR um novo cliente
    public void inserir(ItemVendaBean venda) {
        try {
            ps = conexao.prepareStatement("insert into item_venda (id_venda, id_produto, quantidade) values (?,?,?)");             
            ps.setInt(1, venda.getId_venda());
            ps.setInt(2, venda.getId_produto());
            ps.setInt(3, venda.getQuantidade());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List produtosMaisVendidos(){
        try {
            ps = conexao.prepareStatement("SELECT id_produto, SUM(quantidade) quantidade FROM item_venda GROUP BY id_produto ORDER BY quantidade DESC");
            ResultSet rs = ps.executeQuery();
            List<ItemVendaBean> listaProdutos = new ArrayList<ItemVendaBean>();
            while (rs.next()) {
                ItemVendaBean venda = new ItemVendaBean();
                venda.setId_produto(rs.getInt("id_produto"));
                venda.setQuantidade(rs.getInt("quantidade"));
                listaProdutos.add(venda);
            }
            return listaProdutos;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
