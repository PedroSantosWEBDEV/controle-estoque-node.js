var express = require('express');
var router = express.Router();
var fornecedorModel = require('../models/fornecedorModel');

module.exports.getNovoFornecedor = (req, res, next) => {
        res.render('novofornecedor');            
    
};

module.exports.getEditFornecedor = (req, res, next) => {
  var id = req.params.id;
  fornecedorModel.editarFornecedor(id, req, res, next);
  // res.render('editfornecedor');            

};

module.exports.insereNovoFornecedor = (req, res, next) =>{
  var formfornecedor = req.body;
  // console.log(formfornecedor);
  fornecedorModel.insereNovoFornecedor(formfornecedor, req, res, next);

}

module.exports.atualizarNovoFornecedor = (req, res, next) =>{
  var formfornecedor = req.body;
  var id = req.params.id;
  fornecedorModel.atualizarNovoFornecedor(formfornecedor,id, req, res, next);

}

module.exports.listaFornecedores = (req, res, next) =>{
      
  fornecedorModel.listaFornecedores(req, res, next);

};

module.exports.deleteFornecedor = (req, res, next) => {
  let id = req.params.id;
  fornecedorModel.deleteFornecedor(id, req, res, next);
};



