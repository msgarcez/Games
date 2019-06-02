/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.UsuarioBean;

/**
 *
 * @author danie
 */
public class UsuarioDAO {
    private Connection conexao;
    public UsuarioDAO(){
        try {
            this.conexao = ConnectionFactory.getConnection();
        } catch (Exception e) {
            System.out.println("Erro: "+e.getMessage());
        }
    }
    
    //método para INSERIR um novo cliente
    public void inserir(UsuarioBean usuario) {
        try {
           PreparedStatement ps = conexao.prepareStatement("insert into usuario (nome_usuario, senha, nome, email, administrador) values (?,?,?,?,?)");             
            ps.setString(1, usuario.getNome_usuario());
            ps.setString(2, usuario.getSenha());
            ps.setString(3, usuario.getNome());
            ps.setString(4, usuario.getEmail());
            ps.setString(5, usuario.getAdmin());
            ps.execute();
            ps.close();
        } catch (Exception e) {
            System.out.println("erro:" +e.getMessage());
        }
    }
}
