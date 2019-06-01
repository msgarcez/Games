/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.Usuario;

/**
 *
 * @author danie
 */
public class UsuarioDAO {
    private final Connection connection;

    public UsuarioDAO() {
        connection = ConnectionFactory.getConnection();
    } 
    public void inserir(Usuario usuario) {
        try {
           PreparedStatement ps = connection.prepareStatement("insert into usuario (id, nome_usuario, senha, nome, email, admin) values (default,?,?,?,?,?)");
            ps.setString(1, usuario.getNome_usuario());
            ps.setString(2, usuario.getSenha());
            ps.setString(3, usuario.getNome());
            ps.setString(4, usuario.getEmail());
            ps.setString(5, usuario.getAdmin());
            ps.execute();
        } catch (Exception e) {
            System.out.println("erro:" +e.getMessage());
        }
    }
}
