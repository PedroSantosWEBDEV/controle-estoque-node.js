var express = require('express');
var router = express.Router();
var clienteModel = require('../models/clienteModel');

module.exports.getNovoCliente = (req, res, next) => {
        res.render('novocliente');            
    
};

module.exports.getEditCliente = (req, res, next) => {
  var id = req.params.id;
  clienteModel.editarCliente(id, req, res, next);
  // res.render('editclient');            

};

module.exports.insereNovoCliente = (req, res, next) =>{
  var formcliente = req.body;
  // console.log(formclient);
  clienteModel.insereNovoCliente(formcliente, req, res, next);

}

module.exports.atualizarNovoCliente = (req, res, next) =>{
  var formcliente = req.body;
  var id = req.params.id;
  clienteModel.atualizarNovocliente(formcliente,id, req, res, next);

}

module.exports.listaClientes = (req, res, next) =>{
      
  clienteModel.listaClientes(req, res, next);

};

module.exports.deleteCliente = (req, res, next) => {
  let id = req.params.id;
  clienteModel.deleteCliente(id, req, res, next);
};



