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
import model.CartaoCreditoBean;

/**
 *
 * @author danie
 */
public class CartaoDAO {
    private Connection conexao;
    public CartaoDAO(){
        try {
            this.conexao = ConnectionFactory.getConnection();
        } catch (Exception e) {
            System.out.println("Erro: "+e.getMessage());
        }
    }
    PreparedStatement ps = null;
    public void inserir(CartaoCreditoBean cartao) {
        try {
            ps = conexao.prepareStatement("insert into cartao_credito (numero, data_validade, nome_cartao, bandeira, vezes, id_usuario, cvv) values (?,?,?,?,?,?,?)");             
            ps.setString(1, cartao.getNumero());
            ps.setDate(2, cartao.getData());
            ps.setString(3, cartao.getNome_cartao());
            ps.setString(4, cartao.getBandeira());
            ps.setInt(5, cartao.getVezes());
            ps.setInt(6, cartao.getId_usuario());
            ps.setInt(7, cartao.getCvv());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //método para verificar se alguem usuario tem cartão de crédito
    public int existe(int id){
        try {
            ps = conexao.prepareStatement("SELECT count(c.id_usuario) as cartao FROM cartao_credito c, usuario u WHERE c.id_usuario=u.id and u.id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            int count = 0;
            while(rs.next()){
                count = rs.getInt("cartao");
            }
            ps.close();
            rs.close();
            return count;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
