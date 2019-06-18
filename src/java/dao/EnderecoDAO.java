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
import model.EnderecoBean;

/**
 *
 * @author danie
 */
public class EnderecoDAO {
    private Connection conexao;
    public EnderecoDAO(){
        try {
            this.conexao = ConnectionFactory.getConnection();
        } catch (Exception e) {
            System.out.println("Erro: "+e.getMessage());
        }
    }
    PreparedStatement ps = null;
    public void inserir(EnderecoBean endereco) {
        try {
            ps = conexao.prepareStatement("insert into endereco (id_usuario, complemento, endereco, estado, pais, numero, cep) values (?,?,?,?,?,?,?)");             
            ps.setInt(1, endereco.getId_usuario());
            ps.setString(2, endereco.getComplemento());
            ps.setString(3, endereco.getEndereco());
            ps.setString(4, endereco.getEstado());
            ps.setString(5, endereco.getPais());
            ps.setInt(6, endereco.getNumero());
            ps.setString(7, endereco.getCep());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //método para verificar se alguem usuario tem endereço cadastrado
    public int existe(int id){
        try {
            ps = conexao.prepareStatement("SELECT count(e.id_usuario) as end FROM endereco e, usuario u WHERE e.id_usuario=u.id and u.id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            int count = 0;
            while(rs.next()){
                count = rs.getInt("end");
            }
            ps.close();
            rs.close();
            return count;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
