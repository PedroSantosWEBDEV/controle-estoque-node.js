var db = require('../db');
var express = require('express');



module.exports.carregaRelatorio = (req, res, next) => {
    var connection = db();
    let title = '';
    let sql = '';
    
    if (req.body.reportControl == 1){
        title = 'Produtos Mais Vendidos';
        sql = "SELECT estoque_cd_produto, ds_produto, sum(qt_produto) as qt_soma FROM saida_produto GROUP BY estoque_cd_produto, ds_produto;";
    }
    
    if (req.body.reportControl == 2){
        sql = "SELECT estoque_cd_produto, ds_produto, sum(qt_produto) as qt_soma FROM saida_produto GROUP BY estoque_cd_produto, ds_produto ORDER BY sum(qt_produto) DESC;";
        titulo = 'Produtos Menos Vendidos';
    }
    if(req.body.reportControl == 3){
        sql = "Select cd_produto as estoque_cd_produto, ds_produto, qt_estoque as qt_soma from produto where qt_estoque <= 5 order by qt_estoque DESC;";
        title = 'Produtos com Estoque Mínimo';
    }

    if(req.body.reportControl == 4){
      sql = "Select cd_produto as estoque_cd_produto, ds_produto, qt_estoque as qt_soma from produto where qt_estoque > 5 order by qt_estoque ASC";
      title = 'Produtos com Estoque Máximo';
  }

    if(sql && title){
        connection.query(sql, function(error, result){
            if(error){throw error};
            res.render('relatorio', {produtos: result, title:title});
        });
    }else{
        res.render('relatorio', {produtos: [], title:'Erro'});
    }
}

module.exports.carregaRelatorioProdutos = (req, res, next) => {
    var connection = db();
   connection.query("Select * from produto", function(error, result){
       if(error){throw error};
       res.render('relatorioProdutos',{ produtos:result});
   })
}

module.exports.carregaRelatorioFornecedores = (req, res, next) => {
    var connection = db();
    connection.query("Select * from fornecedor", function(error, result){
       if(error){throw error};
       res.render('relatorioFornecedores', {fornecedor:result});
   })
}

module.exports.getInfoFornecedor = (id, req, res, next) => {
    var connection = db();
   connection.query("Select * from fornecedor where cd_fornecedor = ?",id, function(error, result){
       if(error){throw error};
       res.render('infoFornecedor',{fornecedor:result});
   })
}