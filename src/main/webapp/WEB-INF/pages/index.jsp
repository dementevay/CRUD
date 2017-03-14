<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CRUD</title>

    <style>
        body {
            font: 11pt Courier New, Courier, monospace;
            margin: 0;
        }

        h1 {
            font-size: 36px;
            margin: 0;
            color: #0099FF;
        }

        h2 {
            margin-top: 0;
        }

        #header {
            background: #FFFFFF;
            padding: 10px;

        }

        #sidebar {
            float: left;
            border: 1px solid #333;
            width: 20%;
            padding: 5px;
            margin: 10px 10px 20px 5px;
        }

        #content {
            margin: 10px 5px 20px 25%;
            padding: 5px;
            border: 0px solid #333;
        }

        #footer {
            background: #333;
            padding: 5px;
            color: #000000;
            clear: left;
        }
    </style>


</head>
<body>
<div id="header"><h1>Create Read Update Delete</h1></div>
<div id="sidebar">
    <p><a href="/users">Show all users</a></p>
    <p><a href="/addUser">Add new user</a></p>
    <form method="get" action="/search" target="_self" id="searchForm"/>
    <br>
    <h3>Search form:</h3>
    <table>
        <tr>
            <td>
                <input name="name" form="searchForm" placeholder="User name">
                <input name="page" form="searchForm" hidden value="0"/>
            </td>
        </tr>
        <tr>

            <td>
                User age range:
                <input name="ageFrom" style="width: 50px"  type="number" min="0" step="1" form="searchForm" placeholder="From">
                -
                <input name="ageUntil" style="width: 50px"  type="number" min="0" step="1" form="searchForm" placeholder="Until">
            </td>
        </tr>
        <tr>
            <td>
                Is admin? <input name="isAdmin" form="searchForm" type="radio" value="true">yes
                <input name="isAdmin" form="searchForm" type="radio" value="false">no
                <input name="isAdmin" form="searchForm" type="radio" checked value="">Any
            </td>
        </tr>

        <tr>
            <td>
                <input type=submit form="searchForm" value="Search">
            </td>
        </tr>
    </table>
</div>
<div id="content">
    <h2>CRUD Application </h2>
    <p>JavaRush Test </p>

</div>




</body>
</html>
