<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


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
                <h1>NIC Validated Information</h1>

    </div>
</div>
<div class="container-fluid">
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <br><br>
        <p><b style="color: blue">If following information are correct, Click Save</b></p>
        <p style="color: maroon">Else go back and enter correct information</p>
        <br><br>
    <%--@elvariable id="allPersonData" type=""--%>
    <form:form action="/save" method="post" modelAttribute="allPersonData">
        <form:input type="hidden" path="id" value="${allPersonData.id}"/>
        <form:input type="hidden" path="name" value="${allPersonData.name}"/>
        <form:input type="hidden" path="address" value="${allPersonData.address}"/>
        <form:input type="hidden" path="nationality" value="${allPersonData.nationality}"/>
        <form:input type="hidden" path="nic" value="${allPersonData.nic}"/>
        <div class="row mb-3">
            <label for="birthday" class="col-sm-2 col-form-label">Birthday</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" path="birthday" value="${allPersonData.birthday}"/>
            </div>
        </div>
        <div class="row mb-3">
            <label for="age" class="col-sm-2 col-form-label">Age</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" path="age" value="${allPersonData.age}"/>
            </div>
        </div>
        <div class="row mb-3">
            <label for="gender" class="col-sm-2 col-form-label">Gender</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" path="gender" value="${allPersonData.gender}"/>
            </div>
        </div>

        <button type="button" class="btn btn-primary" style="float: right" name="back" onclick="history.back()"><< Back</button>
        <button type="submit" class="btn btn-primary" style="float: right;margin-right: 5px">Save</button>

    </form:form>
    </div>
    <div class="col-md-4"></div>
</div>
</div>
</body>
</html>