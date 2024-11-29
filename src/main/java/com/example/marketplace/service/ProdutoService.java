package com.example.marketplace.service;

import com.example.marketplace.model.Produto;
import com.example.marketplace.repository.ProdutoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProdutoService {

    private final ProdutoRepository produtoRepository;

    public ProdutoService(ProdutoRepository produtoRepository) {
        this.produtoRepository = produtoRepository;
    }

    public List<Produto> getAllProdutos() {
        return produtoRepository.findAll();
    }

    public Produto saveProduto(Produto produto) {
        return produtoRepository.save(produto);
    }
}
