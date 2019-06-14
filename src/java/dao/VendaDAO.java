/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.VendaBean;

/**
 *
 * @author danie
 */
public class VendaDAO {
    private Connection conexao;
    public VendaDAO(){
        try {
            this.conexao = ConnectionFactory.getConnection();
        } catch (Exception e) {
            System.out.println("Erro: "+e.getMessage());
        }
    }
    PreparedStatement ps = null;
    //método para INSERIR um novo cliente
    public void inserir(VendaBean venda) {
        try {
            ps = conexao.prepareStatement("insert into venda (data, total, id_usuario, id_endereco, id_cartao) values (?,?,?,?,?)");             
            ps.setDate(1, venda.getDate());
            ps.setDouble(2, venda.getTotal());
            ps.setInt(3, venda.getId_usuario());
            ps.setInt(4, venda.getId_endereco());
            ps.setInt(5, venda.getId_cartao());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
