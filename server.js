const express = require('express');
const path = require('path');
const { Pool } = require('pg'); 
const app = express();

// Postavite port za slušanje
const port = 3000;

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'Lab', 
    password: 'koliko123',
    port: 5432
});

app.use('/data', express.static(path.join(__dirname, 'data')));

// Ruta za dohvat likova s filtriranjem
app.get('/api/likovi', async (req, res) => {
    const search = req.query.search || '';  // Dohvatite 'search' parametar iz URL-a
    const atribut = req.query.atribut || 'all';  // Dohvatite atribut za filtriranje

    let query;
    if (atribut === 'all') {
        query = `SELECT * FROM likovi WHERE ime ILIKE $1 OR prezime ILIKE $1 OR videoigra_id::text ILIKE $1`; // Pretraživanje po svim atributima
    } else {
        query = `SELECT * FROM likovi WHERE ${atribut} ILIKE $1`; // Pretraživanje prema specifičnom atributu
    }

    try {
        const result = await pool.query(query, [`%${search}%`]);  // Parametrizirani upit
        res.json(result.rows);  // Vratite filtrirane podatke
    } catch (err) {
        console.error(err);
        res.status(500).send('Greška pri dohvaćanju likova');
    }
});

// Ruta za dohvat videoigara s filtriranjem
app.get('/api/videoigre', async (req, res) => {
    const search = req.query.search || '';  // Dohvatite 'search' parametar iz URL-a
    const atribut = req.query.atribut || 'all';  // Dohvatite atribut za filtriranje

    let query;
    if (atribut === 'all') {
        query = `SELECT * FROM videoigre WHERE naziv ILIKE $1 OR zanr ILIKE $1 OR platforme ILIKE $1`; // Pretraživanje po svim atributima
    } else {
        query = `SELECT * FROM videoigre WHERE ${atribut} ILIKE $1`; // Pretraživanje prema specifičnom atributu
    }

    try {
        const result = await pool.query(query, [`%${search}%`]);  // Parametrizirani upit
        res.json(result.rows);  // Vratite filtrirane podatke
    } catch (err) {
        console.error(err);
        res.status(500).send('Greška pri dohvaćanju videoigara');
    }
});

// Ruta za isporuku početne stranice
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Ruta za isporuku stranice sa tablicom
app.get('/datatable.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'datatable.html'));
});

// Pokrenite server na određenom portu
app.listen(port, () => {
    console.log(`Server je pokrenut na http://localhost:${port}`);
});
