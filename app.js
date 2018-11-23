const express = require('express')
const app = express()

const port = process.env.PORT || 8080;

const mysql = require('mysql2');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'myhoursdb'
});

connection.query(
    'SELECT * FROM `User`',
    function(err, results, fields) {
      console.log(results); // results contains rows returned by server
      console.log(fields); // fields contains extra meta data about results, if available
    }
  );

app.get('/', (req, res) => res.send('Welcome to myHours.'))

app.listen(port, () => console.log('Example app listening on port ${port}!'))

app.get('/home', (req, res) => res.send('index.html'))

