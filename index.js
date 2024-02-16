const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
const port = 3000;

// Enable CORS for all routes
app.use(cors());

// MySQL Connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'military',
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
  } else {
    console.log('Connected to MySQL');
  }
});

// Express Middleware
app.use(express.json());


// API Routes

app.post('/soldierdetails', (req, res) => {
  console.log(req.body.car)
  let query = `SELECT * FROM soldier`;
  console.log(query);
    db.query(query, (err, results) => {
      
      if (err) {
        res.status(500).send('Internal Server Error');
        return;
      }
      
      console.log(results)
      res.json(results);
      
    });
  }
);



app.post('/insertsoldier', (req, res) => {
  const { soldier_id, name, dob, gender, address, Salary } = req.body;

  // Use parameterized query to prevent SQL injection
  let query = `INSERT INTO soldier(soldier_id, name, dob, gender, address, Salary) VALUES (? , ? , ? , ? , ? ,?)`;

  db.query(query, [soldier_id, name, dob, gender, address, Salary ], (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    
  });
});



app.post('/deletesoldier', (req, res) => {

  const soldier_id = req.body.soldier_id;

  let query = `DELETE FROM soldier WHERE soldier_id = ?`;

  db.query(query,[soldier_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
  });
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});