const express = require('express');
const router = express.Router(); 

router.get('/', (req, res) => {
    res.render('home');
})

router.post('/', (req, res) => {
    //const book = await pool.query('SELECT * FROM libro WHERE idLibro = ?', [id])
    const { password, email } = req.body;
    res.render('home', { password, email });
})

module.exports = router;




