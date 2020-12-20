<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Title</title>
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
</head>

<div class="form-style-2">
    <div class="form-style-2-heading">
        <form method="get" action="${pageContext.request.contextPath}/">
            <input type="submit" value="Home">
        </form>
    </div>
</div>


<div class="form-style-2">
    <div class="form-style-2-heading">
        All quotes!
    </div>
    <table>
        <tr>
            <th>Top</th>
            <th>Quot</th>
            <th>Score</th>
            <th>Posted by</th>
            <th>Vote</th>
        </tr>
        <c:forEach items="${quotes}" var="quote">

            <tr>
                <td>${quotes.indexOf(quote)+1}</td>
                <td>${quote.quot}</td>
                <td>${quote.score}</td>
                <td>${quote.author.login}</td>

                <form method="post" action="${pageContext.request.contextPath}/quotes?id=${quote.id}">
                    <td><input type="submit" id="up" name="score" value="+" /></td>
                    <td><input type="submit" id="down" name="score" value="-" /></td>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>

</html>
