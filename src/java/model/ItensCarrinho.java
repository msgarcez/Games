/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author danie
 */
public class ItensCarrinho {

    private ProdutoBean produto;
    private Integer quantidade;

    public ItensCarrinho(ProdutoBean produto) {
        this.produto = produto;
        quantidade = 1;
    }

    public ItensCarrinho(ProdutoBean produto, Integer quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
    }

    public ProdutoBean getProduto() {
        return produto;
    }

    public void setProduto(ProdutoBean produto) {
        this.produto = produto;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
    
    public void aumentarQuantidade() {
        this.quantidade++;
    }
    
    public void diminuirQuantidade() {
        this.quantidade--;
    }
    
    public double valorTotal() {
        double valor = getQuantidade() * produto.getPreco();
        return valor;
    }
}

