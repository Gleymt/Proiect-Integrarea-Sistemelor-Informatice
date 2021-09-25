<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tranzactii</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        .topnav {
            overflow: hidden;
            background-color: #333;
        }

        .topnav-right {
            float:right;
        }

        .topnav a {
            float: left;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }


        .topnav a.active {
            background-color: #4CAF50;
            color: white;
        }


        table {
            clear: left;
            border-collapse: collapse;
            width: 50%;
            color: #1b94b3;
            font-family: monospace;
            font-size: 25px;
            text-align: left;
            margin-left: 80px;
            border: 1px solid #ddd;
        }
        th {
            cursor: pointer;
            background-color: #1b94b3;
            color: white;
        }

        tr:nth-child(even) {background-color: #f2f2f2}

        .row{
            display:flex

        }
        .column-left {
            float: left;

        }
        .column-right {
            float: right;

            width: 350px;
            margin-right: 200px;
            margin-left:100px;
            padding: 20px;}

        .row:after {
            content: "";
            display: table;
            clear: both;}

        #myInput {
            background-image: url('https://img.icons8.com/android/24/000000/search.png'); /* Add a search icon to input */
            background-position: 5px 7px; /* Position the search icon */
            background-repeat: no-repeat; /* Do not repeat the icon image */
            width: 300px; /* Full-width */
            font-size: 16px; /* Increase font-size */
            padding: 6px 20px 6px 40px; /* Add some padding */
            border: 1px solid #ddd; /* Add a grey border */ /* Add some space below the input */
            margin-top: 30px;
            margin-bottom: 10px;
            margin-left: 80px;
            margin-right: 20px;
        }
        table tr{
            cursor: pointer;transition: all .25s ease-in-out;
        }
        table tr:hover{background-color: #ddd;}

        #filter{

            margin-top: 30px;
            margin-right: 10px;

        }
        #btnXls{
            margin-right: 10px;
        }

    </style>
</head>
<body>


<div class="topnav">
    <%
        if(session.getAttribute("login")==null)
        {
            response.sendRedirect("login.jsp");
        }
    %>
    <a href="index.jsp">Home</a>
    <div id="cll">
        <a href="/client">Clients</a>
    </div>
    <a class="active" href="/tranzactii">Transactions</a>
    <div id="usr">
        <a href="/userpage">Users</a>
    </div>
    <div id="log">
        <a href="/log">Logs</a>
    </div>
    <div class="topnav-right">
        <a href="reset.jsp" class="btn btn" >Reset Your Password</a>
        <a href="logout.jsp" class="btn btn ">Log Out</a>
    </div>
</div>

<c:if test="${'client' == sessionScope.login.role}">
    <style type="text/css">
        #cll{
            display:none;
        }
        #usr{
            display:none;
        }
        #log{
            display:none;
        }
    </style>
</c:if>

<c:if test="${'angajat' == sessionScope.login.role}">
    <style type="text/css">
        #usr{
            display:none;
        }
        #log{
            display:none;
        }
    </style>
</c:if>

<span class="column-left" >
<input  type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for ...">
    <select id="filter" name="filter" style="height:35px; width:120px" >
        <option value="0">ID</option>
        <option value="1">Codcl</option>
        <option value="2">Nume</option>
        <option value="3">Prenume</option>
        <option value="4">CNP</option>
        <option value="5">Suma Client</option>
        <option value="6">Suma casa</option>
    </select>
<button class="btn btn-success" id= "btnXls" onclick="exportTableToExcel('myTable', 'tranzactii')" >Xls file</button>
<button class="btn btn-danger" id="btnExport" value="Export" onclick="Export()" >PDF file</button>
</span>
<table id="myTable" class="column-left" border="1">
    <tr>
        <th onclick="sortTable(0)">ID</th>
        <th onclick="sortTable(1)">CodCl</th>
        <th onclick="sortTable(2)">Nume</th>
        <th onclick="sortTable(3)">Prenume</th>
        <th onclick="sortTable(4)">CNP</th>
        <th onclick="sortTable(5)">Suma Client</th>
        <th onclick="sortTable(6)">Suma Casa</th>
    </tr>

    <tbody>

    <c:forEach var="tranzactii" items="${listTranzactii}">

        <tr>
            <td><c:out value="${tranzactii.id}" /></td>
            <td><c:out value="${tranzactii.codcl}" /></td>
            <td><c:out value="${tranzactii.nume}" /></td>
            <td><c:out value="${tranzactii.prenume}" /></td>
            <td><c:out value="${tranzactii.cnp}" /></td>
            <td><c:out value="${tranzactii.sumacli}" /></td>
            <td><c:out value="${tranzactii.sumacs}" /></td>
        </tr>
    </c:forEach>

    </tbody>

</table>

<form class="column-right" action="" method="post" id="comenzi">
    <h2> Introduceti datele tranzactiei mai jos </h2>
    <div>
        <label>Cod Client</label>
        <input type="text" name="codcl" id="codcl" class="form-control" value="<c:out value='${tranzactii.codcl}' />">
    </div>
    <div>
        <label>ID Tranzactie</label>
        <input type="text" name="id" id="id" class="form-control" value="<c:out value='${tranzactii.id}' />">
    </div>
    <div>
        <label>CNP Client</label>
        <input type="text" name="cnp" id="cnp" class="form-control" value="<c:out value='${tranzactii.cnp}' />">
    </div>
    <div class="form-group">
        <label>Suma Client</label>
        <input type="text" name="sumacli" id="sumacli" class="form-control" value="<c:out value='${tranzactii.sumacli}' />">
    </div>
    <div class="form-group ">
        <label>Suma Casa</label>
        <input type="text" name="sumacs" id="sumacs" class="form-control" value="<c:out value='${tranzactii.sumacs}' />">
    </div>

    <div class="form-group">
        <input formaction="/tranzactii/insert" type="submit" name = "Add" class="btn btn-primary" value="Add">
        <input formaction="/tranzactii/update" type="submit" name = "Modify" class="btn btn-primary" value="Modify">
        <input formaction="/tranzactii/delete" type="submit" name = "Delete" class="btn btn-primary" value="Delete">
        <input type="reset"  name = "Reset" class="btn btn-primary" value="Reset">
    </div>

</form>

<script>
    function myFunction() {
        // Declare variables
        var e = document.getElementById("filter");
        var val = e.value;
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[val];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    var table = document.getElementById("myTable");

    for (var i = 1; i < table.rows.length; i++) {
        table.rows[i].onclick = function () {
            document.getElementById("id").value = this.cells[0].innerHTML;
            document.getElementById("codcl").value = this.cells[1].innerHTML;
            document.getElementById("cnp").value = this.cells[4].innerHTML;
            document.getElementById("sumacli").value = this.cells[5].innerHTML;
            document.getElementById("sumacs").value = this.cells[6].innerHTML;
        };
    }
</script>

<script>
    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("myTable");
        switching = true;
        // Set the sorting direction to ascending:
        dir = "asc";
        /* Make a loop that will continue until
        no switching has been done: */
        while (switching) {
            // Start by saying: no switching is done:
            switching = false;
            rows = table.rows;
            /* Loop through all table rows (except the
            first, which contains table headers): */
            for (i = 1; i < (rows.length - 1); i++) {
                // Start by saying there should be no switching:
                shouldSwitch = false;
                /* Get the two elements you want to compare,
                one from current row and one from the next: */
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                /* Check if the two rows should switch place,
                based on the direction, asc or desc: */
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                /* If a switch has been marked, make the switch
                and mark that a switch has been done: */
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                // Each time a switch is done, increase this count by 1:
                switchcount ++;
            } else {
                /* If no switching has been done AND the direction is "asc",
                set the direction to "desc" and run the while loop again. */
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }
</script>
<script>
    function exportTableToExcel(tableID, filename = ''){
        var downloadLink;
        var dataType = 'application/vnd.ms-excel';
        var tableSelect = document.getElementById(tableID);
        var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');

        // Specify file name
        filename = filename?filename+'.xls':'excel_data.xls';

        // Create download link element
        downloadLink = document.createElement("a");

        document.body.appendChild(downloadLink);

        if(navigator.msSaveOrOpenBlob){
            var blob = new Blob(['\ufeff', tableHTML], {
                type: dataType
            });
            navigator.msSaveOrOpenBlob( blob, filename);
        }else{
            // Create a link to the file
            downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

            // Setting the file name
            downloadLink.download = filename;

            //triggering the function
            downloadLink.click();
        }
    }
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.62/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
<script type="text/javascript">
    function Export() {
        html2canvas(document.getElementById('myTable'), {
            onrendered: function (canvas) {
                var data = canvas.toDataURL();
                var docDefinition = {
                    content: [{
                        image: data,
                        quality: 1,
                        width: 500,
                        scale: 3

                    }]
                };
                pdfMake.createPdf(docDefinition).download("Tranzactii.pdf");
            }
        });
    }
</script>
</body>
</html>
