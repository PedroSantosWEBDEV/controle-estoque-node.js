var express = require('express');
var router = express.Router();
var controller = require('../controllers/cliente');

router.get('/novocliente', controller.getNovoCliente);
router.post('/novocliente', controller.insereNovoCliente);

router.get('/editcliente/:id', controller.getEditCliente);
router.post('/editcliente/:id', controller.atualizarNovoCliente)

router.get('/listaclientes/delete/:id', controller.deleteCliente);
router.get('/listaclientes', controller.listaClientes);


  
module.exports = router;