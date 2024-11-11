const express = require('express');
const path = require('path');
const { Pool } = require('pg'); 
const app = express();

const port = 3000;

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'Lab', 
    password: 'koliko123',
    port: 5432
});

app.use('/data', express.static(path.join(__dirname, 'data')));

app.get('/api/likovi', async (req, res) => {
    const search = req.query.search || '';  
    const atribut = req.query.atribut || 'all';  

    let query;
    if (atribut === 'all') {
        query = `SELECT * FROM likovi WHERE ime ILIKE $1 OR prezime ILIKE $1 OR videoigra_id::text ILIKE $1`; 
    } else {
        query = `SELECT * FROM likovi WHERE ${atribut} ILIKE $1`; 
    }

    try {
        const result = await pool.query(query, [`%${search}%`]); 
        res.json(result.rows);  
    } catch (err) {
        console.error(err);
        res.status(500).send('Greška pri dohvaćanju likova');
    }
});

app.get('/api/videoigre', async (req, res) => {
    const search = req.query.search || '';
    const atribut = req.query.atribut || 'all'; 

    let query;
    if (atribut === 'all') {
        query = `SELECT * FROM videoigre WHERE naziv ILIKE $1 OR zanr ILIKE $1 OR platforme ILIKE $1`; 
    } else {
        query = `SELECT * FROM videoigre WHERE ${atribut} ILIKE $1`; 
    }

    try {
        const result = await pool.query(query, [`%${search}%`]); 
        res.json(result.rows);  
    } catch (err) {
        console.error(err);
        res.status(500).send('Greška pri dohvaćanju videoigara');
    }
});


app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.get('/datatable.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'datatable.html'));
});

app.listen(port, () => {
    console.log(`Server je pokrenut na http://localhost:${port}`);
});
