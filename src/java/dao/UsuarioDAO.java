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
    
    PreparedStatement ps = null;
    //método para INSERIR um novo cliente
    public void inserir(UsuarioBean usuario) {
        try {
            ps = conexao.prepareStatement("insert into usuario (nome_usuario, senha, nome, email) values (?,?,?,?)");             
            ps.setString(1, usuario.getNome_usuario());
            ps.setString(2, usuario.getSenha());
            ps.setString(3, usuario.getNome());
            ps.setString(4, usuario.getEmail());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //método para ALTERAR cliente cadastrado
    public void alterar(UsuarioBean usuario){
        try {
            ps = conexao.prepareStatement("update usuario set nome_usuario=?, senha=?, nome=?, email=? where id=?");
            ps.setString(1, usuario.getNome_usuario());
            ps.setString(2, usuario.getSenha());
            ps.setString(3, usuario.getNome());
            ps.setString(4, usuario.getEmail());
            ps.setInt(5, usuario.getId());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //método para EXCLUIR um cliente cadastrado
    public void excluir (int id){
        try {
            ps = conexao.prepareStatement("delete  from usuario where id=?");
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }    
    }
    //método para LISTAR cliente cadastrado
    public List consultarUsuario_Nome(int id){
        try {
            ps = conexao.prepareStatement("select * from usuario where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<UsuarioBean> ListaUsuario = new ArrayList<UsuarioBean>();
            while(rs.next()){
                UsuarioBean user = new UsuarioBean();
                user.setId(rs.getInt("id"));
                user.setNome_usuario(rs.getString("nome_usuario"));
                user.setSenha(rs.getString("senha"));
                user.setNome(rs.getString("nome"));
                user.setEmail(rs.getString("email"));
                ListaUsuario.add(user);                
            }
            return ListaUsuario;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
