//Autorizar la entrada a páginas solo cuando se este logueado

module.exports = {
    isLoggedIn(req, res, next) {
        if(req.isAuthenticated()){
            return next();
        } 
        return res.redirect('/');
    }, 

    isNotLoggedIn(req, res, next) {
        if(!req.isAuthenticated()){
            return next();
        }
        return res.redirect('/peliculas');
    }
}