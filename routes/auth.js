var bcrypt = require('bcryptjs');
var LocalStrategy = require('passport-local').Strategy;
var autorizador = require("../autorizador");

module.exports = function(passport){ 
(async () => {
    const autorizador = require("../autorizador");
    var clientes = await autorizador.selectCustomers();
    // console.log(clientes);

    function findUser(username){
        return clientes.find(user => user.username === username);
    }
    
    function findUserById(id){
        return clientes.find(user => user.id === id);
    }
    passport.serializeUser((user, done) => {
        done(null, user.id);
    });

    passport.deserializeUser((id, done) => {
        try {
            var user = findUserById(id);
            done(null, user);
        } catch (err) {
            done(err, null);
        }
    });
    passport.use(new LocalStrategy({
        usernameField: 'username',
        passwordField: 'password'
    },
        (username, password, done) => {
            try {
                var user = findUser(username);
    
                // usuário inexistente
                if (!user) { return done(null, false) }
    
                // comparando as senhas
                var isValid = bcrypt.compareSync(password, user.password);
                if (!isValid) return done(null, false)
                
                return done(null, user)
            } catch (err) {
                done(err, false);
            }
        }
    ));
})();
}