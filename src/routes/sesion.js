const express = require('express');
const router = express.Router(); 
const passport = require('passport');

const { isNotLoggedIn, isLoggedIn } = require('../lib/auth');

router.get('/', isNotLoggedIn, (req, res) => { 
    res.render('home');
})

router.post('/', isNotLoggedIn, (req, res, next) => {
    passport.authenticate('local.auth', {
        successRedirect: '/multiplex',
        failureRedirect: '/',
        failureFlash: true
    })(req, res, next);
})

router.get('/cerrarSesion', isLoggedIn, (req, res) => {
    req.logOut();
    res.redirect('/');
})

module.exports = router;