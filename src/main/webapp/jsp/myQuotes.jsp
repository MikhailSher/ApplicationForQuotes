<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Title</title>
    <link href="/css/styles.css" rel="stylesheet" type="text/css">
</head>

<div class="form-style-2">
    <div class="form-style-2-heading">
        Please add new quote!
    </div>

    <form method="post" action="${pageContext.request.contextPath}/saveQuote/">
        <label for="quot">Quot
            <input class="input-field" type="text" id="quot" name="quot">
        </label>
        <input type="submit" value="Save">
    </form>
</div>

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
            <th>Change</th>
        </tr>
        <c:forEach items="${quotes}" var="quote">

            <tr>
                <td>${quotes.indexOf(quote)+1}</td>
                <td>${quote.quot}</td>
                <td>${quote.score}</td>
                <td>${quote.author.login}</td>

                <form method="post" action="${pageContext.request.contextPath}/saveQuote?id=${quote.id}">

                    <td><label for="quot">
                        <input class="input-field" type="text" id="quotC" name="quot">
                    </label></td>
                    <td><input type="submit" value="Change"></td>
                </form>
                <form method="post" action="${pageContext.request.contextPath}/delete?id=${quote.id}">
                <td> <input type="submit" value="Delete"></td>
                </form>
            </tr>
        </c:forEach>
    </table>
</div>

</html>
