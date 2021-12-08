
var db = require('../db');
var express = require('express');

module.exports.carregaDespesaLoja = ( req, res, next)=>{
    var connection = db();
    connection.query("select * from despesa where tipo_despesa_cd_despesa =1", function(err, result) {
      if(err){console.error(err)};
        console.log(result);
        res.render('despesaLoja', { despesa:result});
      });
  }

module.exports.carregaDespesaPessoal = ( req, res, next)=>{
    var connection = db();
    connection.query("select * from despesa where tipo_despesa_cd_despesa =2", function(err, result) {
      if(err){console.error(err)};
        console.log(result);
        res.render('despesaLoja', {despesa:result});
    });
}

module.exports.insereNovoDespesa = (despesa, req, res, next)=>{
  var connection = db();

  connection.query("insert into despesa set ?", despesa, function(err, result) {

    if(err){console.error(err);

    }else{

      res. redirect('/novaDespesa');

    }
  });
}
  