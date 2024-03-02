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

  let query = `INSERT INTO soldier(soldier_id, name, dob, gender, address, salary) VALUES (? , ? , ? , ? , ? ,?)`;

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



// Department Query

app.post('/departmentdetails', (req, res) => {

  let query = `SELECT * FROM department`;
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


app.post('/insertdept', (req, res) => {
  const { department_id, department_name, department_location, soldier_id } = req.body;

  let query = `INSERT INTO department(department_id, department_name, department_location, soldier_id) VALUES (? , ? , ? ,?)`;

  console.log(query);

  db.query(query, [department_id, department_name, department_location, soldier_id ], (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }
    
    console.log(results);
    
  });
});


app.post('/viewdepartment', (req, res) => {

  const department_id = req.body.department_id;

  let query = `SELECT  *  FROM department WHERE department_id = ?`;

  console.log(query)

  db.query(query,[department_id],(err, results) => {

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



app.post('/updatedepartment', (req, res) => {
  const { department_id, department_name, department_location, soldier_id } = req.body;

  let query =
  `UPDATE department SET 
  department_Name = '${department_name}',
  department_Location = '${department_location}',
  soldier_id = '${soldier_id}'
  WHERE department_id = '${department_id}'`;

  db.query(query,  (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    console.log(query);
    console.log('Department updated successfully');
    res.status(200).send('Department updated successfully');
    
  });
});



app.post('/deletedepartment', (req, res) => {

  const department_id = req.body.department_id;

  let query = `DELETE FROM department WHERE department_id = ?`;
  console.log(query);
  db.query(query,[department_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
   
  });
});




// Medals Query

app.post('/medaldetails', (req, res) => {
  console.log(req.body.car)
  let query = `SELECT * FROM medals`;
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




app.post('/insertmedal', (req, res) => {
  const { medal_id, medal_name, soldier_id } = req.body;

  let query = `INSERT INTO  MEDALS(medal_id, medal_name, soldier_id) VALUES (? , ? , ?)`;

  db.query(query, [medal_id, medal_name, soldier_id ], (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    
  });
});


app.post('/viewmedals', (req, res) => {

  const medal_id = req.body.medal_id;

  let query = `SELECT  *  FROM medals WHERE medal_id = ?`;
  db.query(query,[medal_id],(err, results) => {

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



app.post('/updatemedal', (req, res) => {
  const { medal_id, medal_name, soldier_id } = req.body;

  let query =
  `UPDATE medals SET 
  medal_name = '${medal_name}',
  soldier_id = '${soldier_id}'
  WHERE medal_id = '${medal_id}'`;

  db.query(query,  (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    console.log(query);
    console.log('Medal updated successfully');
    res.status(200).send('Medal updated successfully');
    
  });
});



app.post('/deletemedal', (req, res) => {

  const medal_id = req.body.medal_id;

  let query = `DELETE FROM medals WHERE medal_id = ?`;
  console.log(query);
  db.query(query,[medal_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
   
  });
});



// Operation Query

app.post('/operationdetails', (req, res) => {
  console.log(req.body.car)
  let query = `SELECT * FROM operation`;
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



app.post('/insertoperation', (req, res) => {
  const { operation_id, operation_name, outcome, start_date, end_date, soldier_id } = req.body;

  let query = `INSERT INTO operation(operation_id, operation_name, outcome, start_date, end_date, soldier_id) VALUES (? , ? , ? , ? , ? , ? )`;

  db.query(query, [operation_id, operation_name, outcome, start_date, end_date, soldier_id ], (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    
  });
});


app.post('/viewoperations', (req, res) => {

  const operation_id = req.body.operation_id;

  let query = `SELECT  *  FROM operation WHERE operation_id = ?`;
  db.query(query,[operation_id],(err, results) => {

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



app.post('/updateoperation', (req, res) => {
  const { operation_id, operation_name, outcome, start_date, end_date, soldier_id } = req.body;

  let query =
  `UPDATE operation SET 
  operation_name = '${operation_name}',
  outcome = '${outcome}',
  start_date = '${start_date}',
  end_date = '${end_date}',
  soldier_id = '${soldier_id}'
  WHERE operation_id = '${operation_id}'`;

  db.query(query,  (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    console.log(query);
    console.log('Operation updated successfully');
    res.status(200).send('Operation updated successfully');
    
  });
});



app.post('/deleteoperation', (req, res) => {

  const operation_id = req.body.operation_id;

  let query = `DELETE FROM operation WHERE operation_id = ?`;
  console.log(query);
  db.query(query,[operation_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
   
  });
});



// Posting Query

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




app.post('/insertposting', (req, res) => {
  const { post_id, start_date, end_date, soldier_id, location} = req.body;

  let query = `INSERT INTO posting(post_id, start_date, end_date, soldier_id, location) VALUES (? , ? , ? , ? , ?)`;

  db.query(query, [post_id, start_date, end_date, soldier_id, location ], (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    
  });
});


app.post('/viewpostings', (req, res) => {

  const post_id = req.body.post_id;

  let query = `SELECT  *  FROM posting WHERE post_id = ?`;
  db.query(query,[post_id],(err, results) => {

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



app.post('/updateposting', (req, res) => {
  const { post_id, start_date, end_date, location } = req.body;

  let query =
  `UPDATE posting SET 
  post_id = '${post_id}',
  start_date = '${start_date}',
  end_date = '${end_date}',
  location = '${location}'
  WHERE post_id = '${post_id}'`;

  db.query(query,  (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
    console.log(query);
    console.log('Posting updated successfully');
    res.status(200).send('Posting updated successfully');
    
  });
});



app.post('/deleteposting', (req, res) => {

  const post_id = req.body.post_id;

  let query = `DELETE FROM posting WHERE post_id = ?`;
  console.log(query);
  db.query(query,[post_id],(err, results) => {
    
    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    console.log(results);
   
  });
});




app.post('/searchalldetails', (req, res) => {

  const data = req.body.data;

  let searchdata = `'%${data}%'`

  let query = `SELECT * FROM soldierdetails WHERE soldier_id LIKE ${searchdata} OR soldier_name LIKE ${searchdata}`;

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



app.post('/countsoldiers', (req, res) => {

  let query = `SELECT * FROM count_soldier`;

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