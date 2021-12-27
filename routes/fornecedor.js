var express = require('express');
var router = express.Router();
var controller = require('../controllers/fornecedor');

router.get('/novofornecedor', controller.getNovoFornecedor);
router.post('/novofornecedor', controller.insereNovoFornecedor);

router.get('/editfornecedor/:id', controller.getEditFornecedor);
router.post('/editfornecedor/:id', controller.atualizarNovoFornecedor)

router.get('/listafornecedores/delete/:id', controller.deleteFornecedor);
router.get('/listafornecedores', controller.listaFornecedores);


  
module.exports = router;