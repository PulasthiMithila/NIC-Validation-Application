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
        <div class="row">
            <div class="col-xs-10">
                <h1>NIC Validation Application</h1>
            </div>
            <div class="col-xs-2" style="padding-bottom: 5px">
                <a href ="/listPersons" class="btn btn-primary " style="float: right">View List</a>
            </div>
        </div>
    </div>
</div>

<br>
<br>
    <div class="container">

        <b STYLE="color: blue">Fill the form with correct information</b>
        <br><br>

        <%--@elvariable id="person" type=""--%>
        <form:form action="/postPersonDetails" method="post" modelAttribute="person">
            <div class="row mb-3">
                <label for="name" class="col-sm-2 col-form-label">Name :</label>
                <div class="col-sm-10">
                    <form:input type="text" class="form-control" path="name" required="Enter name"/>
                </div>
            </div>
            <div class="row mb-3">
                <label for="address" class="col-sm-2 col-form-label">Address :</label>
                <div class="col-sm-10">
                    <form:input type="text" class="form-control" path="address" required="Enter address"/>
                </div>
            </div>
            <div class="row mb-3">
                <label for="nationality" class="col-sm-2 col-form-label">Nationality :</label>
                <div class="col-sm-4">
                    <form:input type="text" class="form-control" path="nationality" required="Enter nationality"/>
                </div>
                <label for="nic" class="col-sm-2 col-form-label">NIC :</label>
                <div class="col-sm-4">
                    <form:input type="text" class="form-control" path="nic" required="Enter NIC"/>
                </div>
            </div>
            <button type="reset" value="clear" class="btn btn-primary" style="float: right">Clear</button>
            <button type="submit" class="btn btn-primary" style="float: right;margin-right: 5px">Proceed</button>

        </form:form>
    </div>
</body>
</html>
