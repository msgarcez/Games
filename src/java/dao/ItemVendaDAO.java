/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.ItemVendaBean;

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
}
