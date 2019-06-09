/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import model.ItensCarrinho;
import model.ProdutoBean;

/**
 *
 * @author danie
 */
public class Carrinho {

    private List<ItensCarrinho> itens;
    private int quantidade;
    private double total;

    public Carrinho() {
        itens = new ArrayList<>();
        quantidade = 0;
        total = 0;
    }
    
    public void adicionarItem(ProdutoBean produto) {
        
        boolean novoItem = true;
        
        if (itens != null)
            for (ItensCarrinho item : itens) 
                if (Objects.equals(item.getProduto().getId(), produto.getId())) {
                    novoItem = false;
                    item.aumentarQuantidade();
                }
            
        if (novoItem) {
            ItensCarrinho ic = new ItensCarrinho(produto);
            itens.add(ic); 
            quantidade++;
        }
        
        //total = subtotalDoProduto();
    }
    
    public void atualizarQuantidadeItem(ProdutoBean produto, String quantidade) {
        
        int qt = Integer.parseInt(quantidade);
        
        if (qt >= 0) {
            
            ItensCarrinho ic = null;
            for (ItensCarrinho item : itens) {
                if (Objects.equals(item.getProduto().getId(), produto.getId())) {
                    if (qt != 0) item.setQuantidade(qt);
                    else {
                        ic = item;
                        break;
                    }
                }
            }
            
            if (ic != null) itens.remove(ic);
        }
    }
    
    public int getQuantidade() {
        return quantidade;
    }

    public List<ItensCarrinho> getItens() {
        return itens;
    }

    public double getTotal() {
        return total;
    }
    
    public double subtotalDoProduto() {
        
        double valor = 0;
        for (ItensCarrinho item : itens) {
            
            ProdutoBean produto = (ProdutoBean) item.getProduto();
            valor += item.getQuantidade() * produto.getPreco();
        } 
        
        return valor;
    }
    
    public void limparCarrinho() {
        
        itens.clear();
        quantidade = 0;
        total = 0;
    }
}
