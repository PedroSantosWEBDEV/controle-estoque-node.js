
var db = require('../db');
var express = require('express');

module.exports.insereNovoCliente = (formcliente, req, res, next)=>{
  var connection = db();

  connection.query("insert into cliente set ?", formcliente, function(err, result) {

    if(err){console.error(err);

    }else{

      res. redirect('/novocliente');

    }
  });
}

module.exports.listaClientes = (req, res, next) =>{
  var connection = db();

  connection.query("SELECT cd_cliente, nm_razao, nm_fantasia, cd_cpf, cd_cep, ds_endereco, cd_numero, nm_bairro, nm_cidade, nm_estado, nm_pais, nm_email, cd_telvendedor1, cd_telvendedor2 FROM cliente",  function(err, result) {

    if(err){throw err};
      res.render('listaclientes', {clientes: result});

  });
};

module.exports.deleteCliente = (id, req, res,next) =>{
  var connection = db();

  connection.query("Delete from cliente where cd_cliente= ?", id, function(error, result){
    if (error){throw error;}
    
        res.redirect('/listaclientes');
  
    });

};

module.exports.editarCliente = (id,req, res, next) =>{
  var connection = db();

  connection.query("Select * from cliente where cd_cliente= ?", id, function(error, result){
    if (error){throw error;}
    res.render('editcliente', {dados:result});
    
  });

};

module.exports.atualizarNovoCliente = (id,formfornecedor, req, res, next)=>{
  var connection = db();

  connection.query('UPDATE cliente SET ? WHERE cd_cliente = ?', [id,formfornecedor], function(err, result) {

    if(err){console.error(err);

    }else{

      res. redirect('/listaclientes');

    }
  });
}


