<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit user</title>
    <style>
        body {
            font: 11pt Arial, Helvetica, sans-serif;
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

    <br>
    <h3>Search form:</h3>
    <table>
        <tr>
            <td>
                <input name="name" disabled placeholder="User name">

            </td>
        </tr>
        <tr>

            <td>
                User age range:
                <input name="ageFrom" style="width: 50px" type="number" min="0" step="1" disabled placeholder="From">
                -
                <input name="ageUntil" style="width: 50px" type="number" min="0" step="1" disabled placeholder="Until">
            </td>
        </tr>
        <tr>
            <td>
                Is admin? <input name="isAdmin" disabled type="radio" value="true">yes
                <input name="isAdmin" disabled type="radio" value="false">no
                <input name="isAdmin" disabled type="radio" checked value="">Any
            </td>
        </tr>

        <tr>
            <td>
                <input type=submit disabled value="Search">
            </td>
        </tr>
    </table>
</div>
<div id="content">
    <h2>Edit user </h2>


    <c:url var="editAction" value="/update"/>

    <form:form id="editForm" action="${editAction}" commandName="user" method="post">
        <table>

            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="name">
                        <spring:message text="Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="age">
                        <spring:message text="Age"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="age"/>
                </td>
            </tr>
            <tr>
                <td>
                    <spring:message text="Is admin"/>

                </td>
                <td>
                    <form:checkbox path="admin" id="admin"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="createdDate">
                        <spring:message text="Created date"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="createdDate"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="createdDate">
                        <spring:message text="dd-MM-yyyy HH:mm:ss"/>
                    </form:label>
                </td>
            </tr>
            <tr>
                <td colspan="2">

                    <input type=submit
                           value="<spring:message text="Save changes"/>"/>

                </td>
            </tr>
        </table>
    </form:form>
    <c:if test="${isInvalidArguments}">
        User field can't be empty and age value must be more than 0. Please try again.
    </c:if>
</div>
</body>
</html>
