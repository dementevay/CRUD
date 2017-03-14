<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>

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

        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #aaa;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 0px;
            overflow: hidden;
            word-break: normal;
            border-color: #aaa;
            color: #333;
            background-color: #fff;
            border-top-width: 1px;
            border-bottom-width: 1px;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 0px;
            overflow: hidden;
            word-break: normal;
            border-color: #aaa;
            color: #0099FF;
            background-color: #FFFFFF;
            border-top-width: 1px;
            border-bottom-width: 1px;
        }

        .tg .tg-qsvf {
            font-size: 18px;
            vertical-align: top
        }

        .tg .tg-13pz {
            font-size: 18px;
            text-align: center;
            vertical-align: top
        }

        .tg .tg-yw4l {
            vertical-align: top
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
                <input name="isAdmin" form="searchForm" type="radio" value="false">NO
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
    <h2>Searching results:</h2>


    <c:if test="${!empty resultPages.pageList}">
    <table class="tg">
        <tr>
            <th class="tg-13pz">Id</th>
            <th class="tg-qsvf">Name</th>
            <th class="tg-qsvf">Age</th>
            <th class="tg-qsvf">Is Admin</th>
            <th class="tg-qsvf">Created date</th>
            <th class="tg-qsvf">Edit</th>
            <th class="tg-qsvf">Remove</th>
        </tr>
        <c:forEach items="${resultPages.pageList}" var="user">
            <tr>
                <td class="tg-yw4l">${user.id}</td>
                <td class="tg-yw4l">${user.name}</td>
                <td class="tg-yw4l">${user.age}</td>
                <td class="tg-yw4l">
                    <c:if test="${user.admin}">
                        yes
                    </c:if>
                    <c:if test="${!user.admin}">
                        no
                    </c:if>

                </td>
                <td class="tg-yw4l"><fmt:formatDate value="${user.createdDate}" pattern="dd-MM-yyyy HH:mm:ss"/></td>
                <td class="tg-yw4l"><a href="/edit=${user.id}">edit</a></td>
                <td class="tg-yw4l"><a href="/remove=${user.id}">remove</a></td>
            </tr>
        </c:forEach>

        <tr>
            <td style="border-style:hidden"><a <c:if test="${resultPages.firstPage}">hidden</c:if>  href="/search${prevPageRequest}">Prev</a></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"><a <c:if test="${resultPages.lastPage}">hidden</c:if>  href="/search${nextPageRequest}">Next</a></td>
        </tr>
        </c:if>
        <c:if test="${empty resultPages.pageList}">
            no user.
        </c:if>

    </table>
</div>
</body>
</html>
