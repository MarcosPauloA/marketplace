package com.example.marketplace.controller;

import com.example.marketplace.model.Produto;
import com.example.marketplace.service.ProdutoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/produtos")
@CrossOrigin(origins = "https://marketplace-frontend-4cz9mwecr-marcos-projects-7bf269d4.vercel.app")
public class ProdutoController {
    private final ProdutoService produtoService;

    public ProdutoController(ProdutoService produtoService) {
        this.produtoService = produtoService;
    }

    @GetMapping
    public ResponseEntity<List<Produto>> getAllProdutos() {
        return ResponseEntity.ok(produtoService.getAllProdutos());
    }

    @PostMapping
    public ResponseEntity<Produto> saveProduto(@RequestBody Produto produto) {
        return ResponseEntity.ok(produtoService.saveProduto(produto));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Produto> updateProduto(@PathVariable Long id, @RequestBody Produto produto) {
        return produtoService.getProdutoById(id)
                .map(existingProduto -> {
                    existingProduto.setNome(produto.getNome());
                    existingProduto.setDescricao(produto.getDescricao());
                    existingProduto.setPreco(produto.getPreco());
                    existingProduto.setImagemUrl(produto.getImagemUrl());
                    Produto updatedProduto = produtoService.saveProduto(existingProduto);
                    return ResponseEntity.ok(updatedProduto);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProduto(@PathVariable Long id) {
        produtoService.deleteProduto(id);
        return ResponseEntity.noContent().build();
    }
}
