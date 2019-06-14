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
import model.CategoriaBean;
import model.ProdutoBean;

/**
 *
 * @author danie
 */
public class CategoriaDAO {

    private Connection conexao;

    public CategoriaDAO() {
        try {
            this.conexao = ConnectionFactory.getConnection();
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
    PreparedStatement ps = null;

    //método para INSERIR um novo produto
    public void inserir(CategoriaBean categoria) {
        try {
            ps = conexao.prepareStatement("insert into categoria (nome) values (?)");
            ps.setString(1, categoria.getNome());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void alterar(CategoriaBean categoria) {
        try {
            PreparedStatement stmt = conexao.prepareStatement("update categoria set nome=? where id=?");
            stmt.setString(1, categoria.getNome());
            stmt.setInt(2, categoria.getId());
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List listarCategoriaCombo() throws SQLException {
        try {
            PreparedStatement ps = conexao.prepareStatement("select id, nome from categoria order by id");
            ResultSet rs = ps.executeQuery();
            List<CategoriaBean> listaCategoria = new ArrayList<CategoriaBean>();
            while (rs.next()) {
                CategoriaBean categoria = new CategoriaBean();
                categoria.setId(rs.getInt("id"));
                categoria.setNome(rs.getString("nome"));
                listaCategoria.add(categoria);
            }
            ps.close();
            rs.close();
            return listaCategoria;
        } catch (Exception e) {
            System.out.println("erro: " + e.getMessage());
            return null;
        }
    }

    public List selecionaCategoriaId(int id) {
        try {
            ps = conexao.prepareStatement("Select id, nome from categoria where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<CategoriaBean> listaCategoria = new ArrayList<CategoriaBean>();
            while (rs.next()) {
                CategoriaBean categoria = new CategoriaBean();
                categoria.setId(rs.getInt("id"));
                categoria.setNome(rs.getString("nome"));
                listaCategoria.add(categoria);
            }
            return listaCategoria;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public CategoriaBean selecionaPorId(int id) {
        try {
            ps = conexao.prepareStatement("Select id, nome from categoria where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            CategoriaBean categoria = new CategoriaBean();
            while (rs.next()) {
                categoria.setId(rs.getInt("id"));
                categoria.setNome(rs.getString("nome"));
            }
            return categoria;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void excluir(int id) {
        try {

            PreparedStatement ps = conexao.prepareStatement("delete  from categoria where id=?");
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            System.out.println("erro:" + e.getMessage());
        }
    }
}
