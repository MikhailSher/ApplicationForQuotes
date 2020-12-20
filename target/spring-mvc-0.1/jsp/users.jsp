<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Title</title>
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
</head>

<div style="position:absolute;bottom:65%;right:0;"  class="form-style-2">
    <div class="form-style-2-heading">
        Hello <c:out value="${user}" />!
    </div>

    <form method="get" action="${pageContext.request.contextPath}/exit/">
        <input type="submit" value="Exit">
    </form>
    <form method="get" action="${pageContext.request.contextPath}/allQuotes/">
        <input type="submit" value="All Quotes">
    </form>
    <form method="get" action="${pageContext.request.contextPath}/myQuotes/">
        <input type="submit" value="My Quotes">
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
