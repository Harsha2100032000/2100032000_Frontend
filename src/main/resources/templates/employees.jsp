<!DOCTYPE html>
<head>
    <title>Employee Table</title>
    <style>
    
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        th {
        	border: 1px solid #ddd;
            background-color: #8fd7c7;
            padding: 8px;
            text-align: left;
        }

        td {
        	border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        tr:hover {
            background-color: #8fd7c7;
        }
        .full-width-button {
            width: 100%;
            display: block;
            text-align: center;
        }
         tr:nth-child(odd) {
        background-color: blue; 
    }

    tr:nth-child(even) {
        background-color: red;
    }
        
        tr:hover {
            background-color: #8fd7c7;
        }

       
        td:hover {
            background-color: yellow;
        } 
    </style>
</head>
<body>
    <h1>Employee Table</h1>
    <form action="/add">
    <input type="submit" value="Add Employee">
    </form>
    <table>
        <tr>
            <th>ID</th>
            <th>FIRST NAME
            <input type="text" oninput="filterTable()" data-column="1" placeholder="Filter">
            </th>
            <th>LAST NAME
            <input type="text" oninput="filterTable()" data-column="2" placeholder="Filter">
            </th>
            <th>GENDER
            <input type="text" oninput="filterTable()" data-column="3" placeholder="Filter">
            </th>
            <th>AGE
            <input type="number" oninput="filterTable()" data-column="4" placeholder="Filter">
            </th>
            <th>SALARY
            <input type="text" oninput="filterTable()" data-column="5" placeholder="Filter">
            </th>
            <th>DEPARTMENT
            <input type="text" oninput="filterTable()" data-column="6" placeholder="Filter">
            </th>
            <th>POSITION
            <input type="text" oninput="filterTable()" data-column="7" placeholder="Filter">
            </th>
            <th>DELETE</th>
            <th>UPDATE</th>
        </tr>
       
        <tr th:each="emp : ${emps}">
            <td th:text="${emp.id}"></td>
            <td th:text="${emp.fn}"></td>
            <td th:text="${emp.ln}"></td>
            <td th:text="${emp.gender}"></td>
            <td th:text="${emp.age}"></td>
            <td th:text="${'$'+emp.salary}"></td>
            <td th:text="${emp.dept}"></td>
             <td th:text="${emp.pos}"></td>
            
             <td>
            <form th:action="@{'/eform/' + ${emp.id} }">
            <input type="submit" class="full-width-button" value="EDIT">
            </form>
            </td>
            
            <td>
            <form th:action="@{'/delete/' + ${emp.id}}">
            <input type="submit" class="full-width-button" value="DELETE">
            </form>
            </td>
            
           
        </tr>
        
        
        
    </table>
    
    <script>
        function filterTable() {
            var filterInputs = document.querySelectorAll('input[data-column]');
            var table = document.querySelector("table");
            var tr = table.getElementsByTagName("tr");

            for (var i = 1; i < tr.length; i++) {
                var showRow = true;
                for (var j = 0; j < filterInputs.length; j++) {
                    var columnIndex = parseInt(filterInputs[j].getAttribute('data-column'));
                    var filter = filterInputs[j].value.toUpperCase();
                    var td = tr[i].getElementsByTagName("td")[columnIndex];
                    if (td) {
                        var txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) === -1) {
                            showRow = false;
                            break;
                        }
                    }
                }
                if (showRow) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    </script>
    
</body>
</html>
