// Included librearies...
const mysql = require("mysql");
const express = require("express");
const bodyparser = require("body-parser");

// Creating an express library object named "app"...
var app = express();
app.use(bodyparser.json());

// Creating the connection to the database "crud", on the localhost...
var connection = mysql.createConnection(
{
    host     : "localhost",
    user     : "root",
    password : "",
    database : "crud",
    multipleStatements: true
});

connection.connect((error) =>
{
    if (!error)
        console.log("Connected correctly to the database! :D");
    else
        console.log("Cannot connect to the database! D:\n"+
        JSON.stringify(error, undefined, 2));
});




// Put the app listenting on the port 3000...
app.listen(3000, () => console.log("Express server running on port 3000! :D"));

// Getting all the students in a http request.
// When browser makes a request on "localhost:3000/students", it executes the
// SELECT SQL Query, on the console and display on the browser...
app.get("/students", (request, response) =>
{
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Credentials", true);

    connection.query("SELECT * FROM students", (error, rows, fields) =>
    {
        if (!error)
        {
            // console.log(rows);
            response.send(rows);
        }
        else
        {
            console.log(error);
            response.send(error);
        }
    });
});

// API URL direction to insert data into students table...
app.get("/students/insert/:name/:city/:phone", (request, response) =>
{
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Credentials", true);

    var sql = "INSERT INTO students (name, city, phone) VALUES (?, ?, ?);";
    let student = request.params;

    connection.query(sql, [student.name, student.city, student.phone],
    (error, rows, fields) =>
    {
        if (!error)
        {
            // console.log(rows);
            response.send(rows);
        }
        else
        {
            console.log(error);
            response.send(error);
        }
    });
});

// API URL direction to update data into students table...
app.get("/students/update/:number/:name/:city/:phone", (request, response) =>
{
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Credentials", true);

    var sql = "UPDATE students SET name = ?, city = ?, phone = ? WHERE number = ?";
    let student = request.params;

    connection.query(sql, [student.name, student.city, student.phone, student.number],
    (error, rows, fields) =>
    {
        if (!error)
        {
            // console.log(rows);
            response.send(rows);
        }
        else
        {
            console.log(error);
            response.send(error);
        }
    });
});

// API URL direction to delete data from students table...
app.get("/students/delete/:number", (request, response) =>
{
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Credentials", true);

    connection.query("DELETE FROM students WHERE number = ?", [request.params.number], (error, rows, fields) =>
    {
        if (!error)
        {
            // console.log("Student with number " + request.params.number + " deleted!");
            response.send("Student with number " + request.params.number + " deleted!");
        }
        else
        {
            console.log(error);
            response.send(error);
        }
    });
});

// Gets the info of an specific student...
app.get("/students/:number", (request, response) =>
{
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Credentials", true);

    connection.query("SELECT * FROM students WHERE number = ?", [request.params.number], (error, rows, fields) =>
    {
        if (!error)
        {
            // console.log(rows);
            response.send(rows);
        }
        else
        {
            console.log(error);
            response.send(error);
        }
    });
});