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

  app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/index.html'));
});
app.listen(port, () => console.log('Example app listening on port ${port}!'));

app.use('/static', express.static(path.join(__dirname, 'public')))
app.get('/home', (req, res) => res.send('index.html'));

let myLabels = document.querySelectorAll('.lbl-toggle');

Array.from(myLabels).forEach(label => {
  label.addEventListener('keydown', e => {
    // 32 === spacebar
    // 13 === enter
    if (e.which === 32 || e.which === 13) {
      e.preventDefault();
      label.click();
    };
  });
});