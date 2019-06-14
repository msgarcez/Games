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
public class ProdutoDAO {
    private Connection conexao;
    public ProdutoDAO(){
        try {
            this.conexao = ConnectionFactory.getConnection();
        } catch (Exception e) {
            System.out.println("Erro: "+e.getMessage());
        }
    }
    
    PreparedStatement ps = null;
    //método para INSERIR um novo produto
    public void inserir(ProdutoBean produto){
        try {
            ps = conexao.prepareStatement("insert into produto (nome, preco, categoria, especificacao, estoque, img) values (?,?,?,?,?,?)");
            ps.setString(1, produto.getNome());
            ps.setDouble(2, produto.getPreco());
            ps.setInt(3, produto.getId_categoria());
            ps.setString(4, produto.getEspecificacao());
            ps.setInt(5, produto.getEstoque());
            ps.setString(6, produto.getImg());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List selecionaProdutoId(int id){
        try {
            ps = conexao.prepareStatement("Select produto.id, produto.nome, produto.preco, categoria.nome as cat, produto.especificacao, produto.estoque, produto.img from produto, categoria where produto.categoria = categoria.id and produto.id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<ProdutoBean> listaProduto = new ArrayList<ProdutoBean>();
            while(rs.next()){
                ProdutoBean produto = new ProdutoBean();
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setNome_categoria(rs.getString("cat"));
                produto.setEspecificacao(rs.getString("especificacao"));
                produto.setEstoque(rs.getInt("estoque"));
                produto.setImg(rs.getString("img"));
                listaProduto.add(produto);
            }
            return listaProduto;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ProdutoBean selecionaPorId(int id){
        try {
            ps = conexao.prepareStatement("Select produto.id, produto.nome, produto.preco, categoria.nome as cat, produto.especificacao, produto.estoque, produto.img from produto, categoria where produto.categoria = categoria.id and produto.id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
                ProdutoBean produto = new ProdutoBean();
            while(rs.next()){
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setNome_categoria(rs.getString("cat"));
                produto.setEspecificacao(rs.getString("especificacao"));
                produto.setEstoque(rs.getInt("estoque"));
                produto.setImg(rs.getString("img"));           
            }
            return produto;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //método para LISTAR todos os cliente cadastrados
    public List todosProdutos()throws SQLException{
        try {
            //criar o ps prepared stattment
            PreparedStatement ps = conexao.prepareStatement("Select produto.id, produto.nome, produto.preco, categoria.nome as cat, produto.especificacao, produto.estoque, produto.img from produto, categoria where produto.categoria = categoria.id order by produto.nome");
             
            //cria o result set rs
            ResultSet rs = ps.executeQuery();
            List<ProdutoBean> ListaClientes = new ArrayList<ProdutoBean>();
            while(rs.next()){
            //criando um objeto clientebean
            ProdutoBean produto = new ProdutoBean();
            CategoriaBean categoria = new CategoriaBean();
            produto.setId(rs.getInt("id"));
            produto.setNome(rs.getString("nome"));
            produto.setPreco(rs.getDouble("preco"));
            produto.setNome_categoria(rs.getString("cat"));
            produto.setEspecificacao(rs.getString("especificacao"));
            produto.setEstoque(rs.getInt("estoque"));
            produto.setImg(rs.getString("img"));
            
            //Adcionar o objeto a lista
            ListaClientes.add(produto);
            }
            ps.close();
            rs.close();
            return ListaClientes;
        } catch (Exception e) {
            System.out.println("erro:" +e.getMessage());
            return null;
        }
    }
    
     public void alterar(ProdutoBean produto) {
        try {
            PreparedStatement stmt = conexao.prepareStatement("update produto set nome=?, preco=?, categoria=?, especificacao=?, estoque=? where id=?");
            stmt.setString(1, produto.getNome());
            stmt.setDouble(2, produto.getPreco());
            stmt.setInt(3, produto.getId_categoria());
            stmt.setString(4, produto.getEspecificacao());
            stmt.setInt(5, produto.getEstoque());
            stmt.setInt(6, produto.getId());
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
}
