<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDIT EMPLOYEE</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    form {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        background-color: #4caf50;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<form th:action="@{'/edit/' + ${emp.id}}" method="post" th:object="${newe}">
    <input type="text" name="fn" th:value="${emp.fn}" placeholder="First Name"><br>
    <input type="text" name="ln" th:value="${emp.ln }" placeholder="Last Name"><br>
    <input type="number" name="age" th:value="${emp.age }" placeholder="Age"><br>
    <input type="text" name="dept" th:value="${emp.dept }" placeholder="Department"><br>
    <input type="submit" value="EDIT">
</form>
</body>
</html>
