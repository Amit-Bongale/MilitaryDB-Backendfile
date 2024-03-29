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
       res.status(500).json({ sqlMessage: err.sqlMessage });
        return;
      }
      
      console.log(results)
      res.json(results);
      
    });
  }
);


app.post('/insertsoldier', (req, res) => {
  const { soldier_id, name, dob, gender, address, salary , department_id} = req.body;

  let query = `INSERT INTO soldier(soldier_id, name, dob, gender, address, salary , department_id) VALUES (? , ? , ? , ? , ? ,? , ?)`;

  db.query(query, [soldier_id, name, dob, gender, address, salary , department_id ], (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);

    res.status(200).json({ message: 'Soldier inserted successfully'});
    
  });


});


app.post('/viewsoldiers', (req, res) => {

  const soldier_id = req.body.soldier_id;

  let query = `SELECT  *  FROM soldier WHERE soldier_id = ?`;
  db.query(query,[soldier_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
     res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
    console.log(query);

    res.json(results);
  });
});



app.post('/updatesoldier', (req, res) => {
  const { soldier_id , name, dob, gender, address, salary , department_id } = req.body;

  let query =
  `UPDATE soldier SET 
  name = '${name}',
  dob = '${dob}',
  gender = '${gender}',
  address = '${address}',
  salary = '${salary}',
  department_id = '${department_id}'
  WHERE soldier_id = '${soldier_id}'`;

  db.query(query,  (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
    console.log(query);


    res.status(200).json('Soldier updated successfully');
    
  });
});



app.post('/deletesoldier', (req, res) => {

  const soldier_id = req.body.soldier_id;

  let query = `DELETE FROM soldier WHERE soldier_id = ?`;
  console.log(query);
  db.query(query,[soldier_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);

    res.status(200).json({ message: 'Soldier inserted successfully'});
   
  });
});



app.post('/searchsoldier', (req, res) => {

  const soldier = req.body.soldier;

  let search = `'%${soldier}%'`

  let query = `SELECT * FROM SOLDIER WHERE SOLDIER_ID LIKE ${search} OR NAME LIKE ${search}`;

  console.log(query);
    db.query(query, (err, results) => {
      
      if (err) {
        res.status(500).json({ sqlMessage: err.sqlMessage });
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
        res.status(500).json({ sqlMessage: err.sqlMessage });
        return;
      }
      
      console.log(results)
      res.json(results);
      
    });
  }
);


app.post('/insertdept', (req, res) => {
  const { department_id, department_name, department_location, commander_id } = req.body;

  let query = `INSERT INTO department(department_id, department_name, department_location, commander_id) VALUES (? , ? , ? ,?)`;

  console.log(query);

  db.query(query, [department_id, department_name, department_location, commander_id ], (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }
    
    console.log(results);
    res.status(200).json({ message: 'Department inserted successfully '});
    
  });
});


app.post('/viewdepartment', (req, res) => {

  const department_id = req.body.department_id;

  let query = `SELECT  *  FROM department WHERE department_id = ?`;

  console.log(query)

  db.query(query,[department_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
    console.log(query);

    res.json(results);
  });
});



app.post('/updatedepartment', (req, res) => {
  const { department_id, department_name, department_location, commander_id } = req.body;

  let query =
  `UPDATE department SET 
  department_Name = '${department_name}',
  department_Location = '${department_location}',
  commander_id = '${commander_id}'
  WHERE department_id = '${department_id}'`;

  db.query(query,  (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
    console.log(query);
    console.log('Department updated successfully');
    
    res.status(200).json({ message: 'Department Updated successfully'});
    
  });
});



app.post('/deletedepartment', (req, res) => {

  const department_id = req.body.department_id;

  let query = `DELETE FROM department WHERE department_id = ?`;
  console.log(query);
  db.query(query,[department_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
   
  });
});



app.post('/searchdepartment', (req, res) => {

  const department = req.body.department;

  let search = `'%${department}%'`

  let query = `SELECT * FROM department WHERE department_id LIKE ${search} OR department_name LIKE ${search}`;

  console.log(query);

    db.query(query, (err, results) => {
      
      if (err) {
        res.status(500).json({ sqlMessage: err.sqlMessage });
        return;
      }
      
      console.log(results)
      res.json(results);
      
    });
  }
);




// Medals Query

app.post('/medaldetails', (req, res) => {
  console.log(req.body.car)
  let query = `SELECT * FROM medals`;
  console.log(query);
    db.query(query, (err, results) => {
      
      if (err) {
        res.status(500).json({ sqlMessage: err.sqlMessage });
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
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);

    res.status(200).json({ message: 'Medala inserted successfully'});
    
  });
});


app.post('/viewmedals', (req, res) => {

  const medal_id = req.body.medal_id;

  let query = `SELECT  *  FROM medals WHERE medal_id = ?`;
  db.query(query,[medal_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
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
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
    console.log(query);
    console.log('Medal updated successfully');
    
    res.status(200).json({ message: 'Medals Updated successfully'});
    
  });
});



app.post('/deletemedal', (req, res) => {

  const medal_id = req.body.medal_id;

  let query = `DELETE FROM medals WHERE medal_id = '${medal_id}'`;
  console.log(query);
  db.query(query, (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
   
  });
});


app.post('/searchmedals', (req, res) => {

  const medal = req.body.medals;

  let search = `'%${medal}%'`

  let query = `SELECT * FROM medals WHERE medal_id LIKE ${search} OR medal_name LIKE ${search} OR soldier_id LIKE ${search}`;

  console.log(query);

    db.query(query, (err, results) => {
      
      if (err) {
        res.status(500).json({ sqlMessage: err.sqlMessage });
        return;
      }
      
      console.log(results)
      res.json(results);
      
    });
  }
);



// Operation Query

app.post('/operationdetails', (req, res) => {
  console.log(req.body.car)
  let query = `SELECT * FROM operation`;
  console.log(query);
    db.query(query, (err, results) => {
      
      if (err) {
        res.status(500).json({ sqlMessage: err.sqlMessage });
        return;
      }
      
      console.log(results)
      res.json(results);
      
    });
  }
);



app.post('/insertoperation', (req, res) => {
  const { operation_id, operation_name, outcome, start_date, end_date,department_id, soldier_id } = req.body;

  let query = `INSERT INTO operation(operation_id, operation_name, outcome, start_date, end_date, department_id, soldier_id) VALUES (? , ? , ? , ? , ? , ?, ? )`;

  db.query(query, [operation_id, operation_name, outcome, start_date, end_date, department_id, soldier_id ], (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);

      res.status(200).json({ message: 'Operations inserted successfully'});
  });
});


app.post('/viewoperations', (req, res) => {

  const operation_id = req.body.operation_id;

  let query = `SELECT  *  FROM operation WHERE operation_id = ?`;
  db.query(query,[operation_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
     res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
    console.log(query);

    res.json(results);
  });
});



app.post('/updateoperation', (req, res) => {
  const { operation_id, operation_name, outcome, start_date, end_date, department_id, soldier_id } = req.body;

  let query =
  `UPDATE operation SET 
  operation_name = '${operation_name}',
  outcome = '${outcome}',
  start_date = '${start_date}',
  end_date = '${end_date}',
  department_id = '${department_id}',
  soldier_id = '${soldier_id}'
  WHERE operation_id = '${operation_id}'`;

  db.query(query,  (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
    console.log(query);
    console.log('Operation updated successfully');
    
    res.status(200).json({ message: 'Operation Updated successfully'});
    
  });
});



app.post('/deleteoperation', (req, res) => {

  const operation_id = req.body.operation_id;

  let query = `DELETE FROM operation WHERE operation_id = ?`;
  console.log(query);
  db.query(query,[operation_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
     res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
   
  });
});
  

app.post('/searchoperation', (req, res) => {

  const operation = req.body.operation;

  let search = `'%${operation}%'`

  let query = `SELECT * FROM operation WHERE operation_id LIKE ${search} OR operation_name LIKE ${search}`;

  console.log(query);

    db.query(query, (err, results) => {
      
      if (err) {
       res.status(500).json({ sqlMessage: err.sqlMessage });
        return;
      }
      
      console.log(results)
      res.json(results);
      
    });
  }
);



// Posting Query

app.post('/postingdetails', (req, res) => {
  console.log(req.body.car)
  let query = `SELECT * FROM posting`;
  console.log(query);
    db.query(query, (err, results) => {
      
      if (err) {
       res.status(500).json({ sqlMessage: err.sqlMessage });
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
      res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    res.status(200).json({ message: 'Posting inserted successfully'});
    console.log(results);

  });

});


app.post('/viewpostings', (req, res) => {

  const post_id = req.body.post_id;

  let query = `SELECT  *  FROM posting WHERE post_id = ?`;
  db.query(query,[post_id],(err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
     res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
    console.log(query);

    res.json(results);
  });
});



app.post('/updateposting', (req, res) => {
  const { post_id, start_date, end_date, soldier_id, location } = req.body;

  let query =
  `UPDATE posting SET 
  post_id = '${post_id}',
  start_date = '${start_date}',
  end_date = '${end_date}',
  soldier_id ='${soldier_id}',
  location = '${location}'
  WHERE post_id = '${post_id}'`;

  db.query(query,  (err, results) => {

    if (err) {
      console.error('Error inserting data:', err);
     res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
    console.log(query);
    console.log('Posting updated successfully');
    
    res.status(200).json({ message: 'Posting Updated successfully'});
    
  });
});



app.post('/deleteposting', (req, res) => {

  const post_id = req.body.post_id;

  let query = `DELETE FROM posting WHERE post_id = ?`;
  console.log(query);
  db.query(query,[post_id],(err, results) => {
    
    if (err) {
      console.error('Error inserting data:', err);
     res.status(500).json({ sqlMessage: err.sqlMessage });
      return;
    }

    console.log(results);
   
  });
});


app.post('/searchposting', (req, res) => {

  const posting = req.body.posting;

  let search = `'%${posting}%'`

  let query = `SELECT * FROM posting WHERE post_id LIKE ${search} OR soldier_id LIKE ${search} OR location LIKE ${search}`;

  console.log(query);

    db.query(query, (err, results) => {
      
      if (err) {
       res.status(500).json({ sqlMessage: err.sqlMessage });
        return;
      }
      
      console.log(results)
      res.json(results);
      
    });
  }
);



// Home Views

app.post('/searchalldetails', (req, res) => {

  const data = req.body.data;

  let searchdata = `'%${data}%'`

  let query = `SELECT * FROM soldier_details WHERE soldier_id LIKE ${searchdata} OR soldier_name LIKE ${searchdata}`;

  console.log(query);
    db.query(query, (err, results) => {
      
      if (err) {
       res.status(500).json({ sqlMessage: err.sqlMessage });
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
       res.status(500).json({ sqlMessage: err.sqlMessage });
        return;
      }
      
      console.log(results)
      res.json(results);
      
    });
  }
);



app.post('/countdepartments', (req, res) => {

  let query = `SELECT * FROM count_departments`;

  console.log(query);
    db.query(query, (err, results) => {
      
      if (err) {
       res.status(500).json({ sqlMessage: err.sqlMessage });
        return;
      }
      
      console.log(results)
      res.json(results);
      
    });
  }
);


app.post('/operationsummary', (req, res) => {

  let query = `SELECT * FROM operation_summary`;

  console.log(query);
    db.query(query, (err, results) => {
      
      if (err) {
       res.status(500).json({ sqlMessage: err.sqlMessage });
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