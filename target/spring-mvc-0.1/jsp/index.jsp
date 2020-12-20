<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Title</title>
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
</head>

<div style="position:absolute;bottom:65%;right:0;" class="form-style-2">
    <div class="form-style-2-heading">
        Please login!
    </div>

    <form method="post" action="${pageContext.request.contextPath}/login/">
        <label for="loginR">Login
            <input class="input-field" type="text" id="loginR" name="login">
        </label>
        <label for="password_signUp">Password
            <input class="input-field" type="password" id="password_signUp" name="password">
        </label>
        <input type="submit" value="Sign Up">
    </form>
</div>

<div style="position:absolute;bottom:35%;right:0;"  class="form-style-2">
    <div class="form-style-2-heading">
        Please register!
    </div>
    <form method="post" action="${pageContext.request.contextPath}/registration/">
        <label for="login">Login
            <input class="input-field" type="text" id="login" name="login">
        </label>
        <label for="password">Password
            <input class="input-field" type="password" id="password" name="password">
        </label>
        <input type="submit" value="Add user">
    </form>
</div>
<div class="form-style-2">
    <div class="form-style-2-heading">
        Just random quot!
    </div>
</div>
<div class="form-style-2">
    <div class="form-style-2-heading">
        <c:out value="${random}" />
    </div>
</div>



<div class="form-style-2">
    <div class="form-style-2-heading">
        Top 10!
    </div>
    <table>
        <tr>
            <th>Top</th>
            <th>Quot</th>
            <th>Score</th>
            <th>Posted by</th>
        </tr>
        <c:forEach items="${quotes}" var="quote">

            <tr>
                <td>${quotes.indexOf(quote)+1}</td>
                <td>${quote.quot}</td>
                <td>${quote.score}</td>
                <td>${quote.author.login}</td>

            </tr>
        </c:forEach>
    </table>
</div>
</html>
