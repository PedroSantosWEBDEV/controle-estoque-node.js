var express = require('express');
var router = express.Router();
var passport = require('passport');

/* GET login page. */
router.get('/', (req, res, next) => {
    if (req.query.fail)
        res.render('login', { message: 'Usuário e/ou senha incorretos!' });
    else
        res.render('login', { message: null });
});

/* POST login page */
router.post('/',
    passport.authenticate('local', { 
        successRedirect: '/home', 
        failureRedirect: '/login?fail=true' 
    })
);

module.exports = router;