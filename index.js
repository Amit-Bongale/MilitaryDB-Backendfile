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

// SOLDIER Queries

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
  const { soldier_id, name, dob, gender, address, salary } = req.body;

  let query = `INSERT INTO soldier(soldier_id, name, dob, gender, address, Salary) VALUES (? , ? , ? , ? , ? ,?)`;

  db.query(query, [soldier_id, name, dob, gender, address, salary ], (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    
  });
});


app.post('/viewsoldiers', (req, res) => {

  const soldier_id = req.body.soldier_id;

  let query = `SELECT  *  FROM soldier WHERE soldier_id = ?`;
  db.query(query,[soldier_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    console.log(query);

    res.json(results);
  });
});



app.post('/updatesoldier', (req, res) => {
  const { soldier_id , name, dob, gender, address, salary } = req.body;

  let query =
  `UPDATE soldier SET 
  name = '${name}',
  dob = '${dob}',
  gender = '${gender}',
  address = '${address}',
  salary = '${salary}'
  WHERE soldier_id = '${soldier_id}'`;

  db.query(query,  (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    console.log(query);
    console.log('Soldier updated successfully');
    res.status(200).send('Soldier updated successfully');
    
  });
});



app.post('/deletesoldier', (req, res) => {

  const soldier_id = req.body.soldier_id;

  let query = `DELETE FROM soldier WHERE soldier_id = ?`;
  console.log(query);
  db.query(query,[soldier_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
   
  });
});


app.post('/deleteposting', (req, res) => {

  const post_id = req.body.post_id;

  let query = `DELETE FROM posting WHERE post_id = ?`;

  db.query(query,[post_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    console.log(query);
  });
});


app.post('/searchsoldier', (req, res) => {

  const soldier = req.body.soldier;

  let search = `'%${soldier}%'`

  let query = `SELECT * FROM SOLDIER WHERE SOLDIER_ID LIKE ${search} OR NAME LIKE ${search}`;

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



// POSTINGS Queries

app.post('/postingdetails', (req, res) => {
  console.log(req.body.car)
  let query = `SELECT * FROM posting`;
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

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});