// Variables globales //
var selectedRecordNumber;

function login()
{
    // Generic Login implementation...
    // Ignore this fool implementation...
    var username = "arhcoder";
    var password = "12345678"

    // Gets the info of the text bars...
    var xusername = document.getElementById("username-bar").value;
    var xpassword = document.getElementById("password-bar").value;

    // Checks if the user and password are corrects...
    if (xusername === username && xpassword === password)
    {
        document.getElementById("alert").style.display = "none";
        return true;
    }
    else
    {
        document.getElementById("alert").style.display = "block";
        return false;
    }
}

function changeSelectedRecordNumber(number)
{
    selectedRecordNumber = number;
}
async function setStudentTitleLabel()
{
    // Gets the url number argument...
    let searchParams = new URLSearchParams(window.location.search);
    let number = searchParams.get("number");
    if (searchParams.has("number") && number)
    {
        // Hace la petición a la API corriendo en localhost:3000/students/number
        // para encontrar el nombre del alumno seleccionado :3
        const response = await fetch("http://localhost:3000/students/" + number);
        const json = await response.json();
        document.getElementById("studentTitleLabel").innerHTML = "<b>CURSOS</b> de " + json[0].name;
        document.getElementById("appTitle").innerHTML = "Cursos de " + json[0].name;
    }
}

function drawNewStudentRecord(row)
{
    var tableBody = document.getElementById("mainTable").getElementsByTagName("tbody")[0];
    var newRow = tableBody.insertRow(tableBody.rows.length);
    let rowHTMLContent =
    "<td>"+row.number+"</td>"+
    "<td>"+row.name+"</td>"+
    "<td>"+row.city+"</td>"+
    "<td>"+row.phone+"</td>"+
    "<td><a href=\"#editStudentModal\" class=\"edit\" id=\"edit" + row.number +"\" onclick=\"changeSelectedRecordNumber(" + row.number +"); setFormToUpdateARecord();\" data-toggle=\"modal\"><i class=\"material-icons\" data-toggle=\"tooltip\" title=\"Editar\">&#xE254;</i></a>"+
    "<a href=\"#deleteStudentModal\" class=\"delete\" id=\"delete" + row.number +"\" onclick=\"changeSelectedRecordNumber(" + row.number +");\" data-toggle=\"modal\"><i class=\"material-icons\" data-toggle=\"tooltip\" title=\"Borrar\">&#xE872;</i></a>" +
    "<a href=\"/Frontend/courses.html\" class=\"courses\" id=\"courses" + row.number +"\" onclick=\"location.href=this.href+'?number='+"+row.number+";return false; changeSelectedRecordNumber(" + row.number +");\" data-toggle=\"modal\"><i class=\"material-icons\" data-toggle=\"tooltip\" title=\"Más\">&#xE5D2;</i></a></td></tr>";
    newRow.innerHTML = rowHTMLContent;
}
function drawNewCourseRecord(row)
{
    var tableBody = document.getElementById("mainTable").getElementsByTagName("tbody")[0];
    var newRow = tableBody.insertRow(tableBody.rows.length);
    let rowHTMLContent =
    "<td>"+row.id+"</td>"+
    "<td>"+row.name+"</td>"+
    "<td>"+row.subject+"</td>"+
    "<td>"+row.level+"</td></tr>";
    newRow.innerHTML = rowHTMLContent;
}
function drawNewScoreRecord(row, score)
{
    var tableBody = document.getElementById("mainTable").getElementsByTagName("tbody")[0];
    var newRow = tableBody.insertRow(tableBody.rows.length);
    let rowHTMLContent =
    "<td>"+row.id+"</td>"+
    "<td>"+row.name+"</td>"+
    "<td>"+score+"</td></tr>";
    newRow.innerHTML = rowHTMLContent;
}

async function selectFromStudents()
{
    // Hace la petición a la API corriendo en localhost:3000/students...
    const response = await fetch("http://localhost:3000/students");
    const json = await response.json();

    // Recorre el JSON obtenido de las filas de "students" en la base de datos...
    for (let row = 0; row < json.length; row++)
    {
        drawNewStudentRecord(json[row]);
    }
}
async function selectFromCourses()
{
    // Gets the url number argument...
    let searchParams = new URLSearchParams(window.location.search);
    let number = searchParams.get("number");

    // Hace la petición a la API corriendo en localhost:3000/courses/student/number...
    const response = await fetch("http://localhost:3000/courses/student/" + number);
    const json = await response.json();

    // Recorre el JSON obtenido de las filas de "students" en la base de datos...
    for (let row = 0; row < json.length; row++)
    {
        drawNewCourseRecord(json[row]);
    }
}
async function selectFromScores()
{
    // Gets the url number argument...
    let searchParams = new URLSearchParams(window.location.search);
    let number = searchParams.get("number");

    // Hace la petición a la API corriendo en localhost:3000/courses/student/number...
    const response = await fetch("http://localhost:3000/courses/student/" + number);
    const json = await response.json();

    // Recorre el JSON obtenido de las filas de "students" en la base de datos...
    for (let row = 0; row < json.length; row++)
    {
        // Hace la petición a la API corriendo en localhost:3000/scores/studentNumber/courseNumber...
        const Bresponse = await fetch("http://localhost:3000/score/" + number + "/" + json[row].id);
        const newJSON = await Bresponse.json();
        drawNewScoreRecord(json[row], newJSON[0].score);
    }
}
function getScores()
{
    const urlParams = new URLSearchParams(window.location.search);
    const number = urlParams.get("number");
    location.href = "http://127.0.0.1:5500/Frontend/scores.html?number="+number;
}


async function submitRecord()
{
    // Hace la petición a la API corriendo en localhost:3000/students/insert/name/city/phone...
    await fetch("http://localhost:3000/students/insert/" +
    document.getElementById("addName").value + "/" +
    document.getElementById("addCity").value + "/" +
    document.getElementById("addPhone").value);
}
async function setFormToUpdateARecord()
{
    // Escribe en las barras de texto, los valores que se van a editar...
    // Hace la petición a la API corriendo en localhost:3000/students/number,
    // para obtener únicamente los datos del estudiante a editar...
    const response = await fetch("http://localhost:3000/students/" + selectedRecordNumber);
    const json = await response.json();
    document.getElementById("updateName").value = json[0].name;
    document.getElementById("updateCity").value = json[0].city;
    document.getElementById("updatePhone").value = json[0].phone;
}
async function updateRecord()
{
    if (selectedRecordNumber != null)
    {
        // Hace la petición a la API corriendo en localhost:3000/students/update/number/name/city/number...
        await fetch("http://localhost:3000/students/update/" +
        selectedRecordNumber + "/" +
        document.getElementById("updateName").value + "/" +
        document.getElementById("updateCity").value + "/" +
        document.getElementById("updatePhone").value);
    }
}
async function deleteRecord()
{
    if (selectedRecordNumber != null)
        // Hace la petición a la API corriendo en localhost:3000/students/delete/number...
        await fetch("http://localhost:3000/students/delete/" + selectedRecordNumber);
}