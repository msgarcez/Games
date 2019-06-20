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
    //método para ALTERAR cliente cadastrado
    public void alterar(CartaoCreditoBean cartao) {
        try {
            ps = conexao.prepareStatement("update cartao_credito set numero=?, data_validade=?, nome_cartao=?, bandeira=?, vezes=? where id=?");
            ps.setString(1, cartao.getNumero());
            ps.setDate(2, cartao.getData());
            ps.setString(3, cartao.getNome_cartao());
            ps.setString(4, cartao.getBandeira());
            ps.setInt(5, cartao.getVezes());
            ps.setInt(6, cartao.getId());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List selecionaCartaoId(int id){
        try {
            ps = conexao.prepareStatement("Select c.id, c.numero, c.data_validade, c.nome_cartao , c.bandeira, c.vezes, c.cvv, c.id_usuario from cartao_credito c, usuario u where c.id_usuario = u.id and u.id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<CartaoCreditoBean> listaCartao = new ArrayList<CartaoCreditoBean>();
            while(rs.next()){
                CartaoCreditoBean cbean = new CartaoCreditoBean();
                cbean.setId(rs.getInt("id"));
                cbean.setNumero(rs.getString("numero"));
                cbean.setData(rs.getDate("data_validade"));
                cbean.setNome_cartao(rs.getString("nome_cartao"));
                cbean.setBandeira(rs.getString("bandeira"));
                cbean.setVezes(rs.getInt("vezes"));
                cbean.setCvv(rs.getInt("cvv"));
                cbean.setId_usuario(rs.getInt("id_usuario"));
                listaCartao.add(cbean);
            }
            return listaCartao;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public CartaoCreditoBean selecionaEnderecoPorId(int id){
        try {
            ps = conexao.prepareStatement("Select id from cartao_credito where id_usuario=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
                CartaoCreditoBean produto = new CartaoCreditoBean();
            while(rs.next()){
                produto.setId(rs.getInt("id"));          
            }
            return produto;
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
    //método para EXCLUIR um cartao cadastrado
    public void excluir(int id) {
        try {
            ps = conexao.prepareStatement("delete  from cartao_credito where id=?");
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
