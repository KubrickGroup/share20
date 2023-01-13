var express = require('express');
var app = express();

var sql = require("mssql");

// config for the database
var config = {
    user: '',
    password: '',
    server: '', 
    database: 'lab101',
trustServerCertificate: true
};


app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.header(
      "Access-Control-Allow-Headers",
      "Origin, X-Requested-With, Content-Type, Accept"
    );
    next();
  });

  app.get('/api/queryAll', function (req, res) {
   
    var sql = require("mssql");

    // connect to the database
    sql.connect(config, function (err) {
    
        if (err) console.log(err);

        // create Request object
        var request = new sql.Request();
           
        // query to the database and get the records
        request.query('use lab101; select * from something', function (err, recordset) {
            
            if (err) console.log(err)

            // send records as a response
            res.send(recordset);
            
        });
    });
});


app.get('/api/insertNew/:itemx', function (req, res) {

    var sometext = req.params.itemx
    var somesql = `INSERT INTO something (sometext) VALUES ('${sometext}')`

    
    // connect to the database
    sql.connect(config, function (err) {
    
        if (err) console.log(err);

        // create Request object
        var request = new sql.Request();
           
        // insert a new row
        request.query(somesql, function (err, recordset) {
            
            if (err) console.log(err)

            res.send("Done");
            
        });
    });
});

var server = app.listen(8000, function () {
    console.log('Server is running..');
});