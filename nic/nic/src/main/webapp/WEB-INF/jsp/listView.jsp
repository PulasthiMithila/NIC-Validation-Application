<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
    <title>Personal Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<br><br>

<div class="container-fluid" style="background-color: darkgray">
    <div class="container">
        <div class="row">
            <div class="col-xs-10">
                <h1>NIC Validated Information</h1>
            </div>
            <div class="col-xs-2" style="padding-bottom: 5px">
                <button type="button" class="btn btn-primary" style="float: right" name="back" onclick="history.back()"><< Back</button>
            </div>
        </div>
    </div>
</div>

<br>
<br>
<div class="container">

    <table border="1" class="table table-striped table-hover table-responsive-xs">
        <THEAD>
        <tr>
            <th>Name</th>
            <th>Address</th>
            <th>Nationality</th>
            <th>NIC</th>
            <th>Birthday</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Acton</th>
        </tr>
        </THEAD>
        <tbody>

        <c:forEach items="${personLists}" var="person">
        <tr>
            <td> ${person.name}</td>
            <td> ${person.address}</td>
            <td> ${person.nationality}</td>
            <td> ${person.nic}</td>
            <td> ${person.birthday}</td>
            <td> ${person.age}</td>
            <td> ${person.gender}</td>
            <td><a href="/showFormForUpdate/${person.id}" class="btn btn-primary">Update</a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>