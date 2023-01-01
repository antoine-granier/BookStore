<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookStore</title>
    <link rel="stylesheet" type="text/css" href="./styles/header.css" />
    <link rel="stylesheet" type="text/css" href="./styles/reset.css" />
    <link rel="stylesheet" type="text/css" href="./styles/default.css" />
    <link rel="stylesheet" type="text/css" href="./styles/footer.css" />
</head>
<body>
<%@include file="./views/header.html" %>
<form id="form-book" action="BookServlet" method="post">
    <section class="book-type">
        <button name="type" value="thriller" type="submit">Thriller</button>
        <button name="type" value="fantastic" type="submit">Fantastic</button>
        <button name="type" value="love" type="submit">Love</button>
        <button name="type" value="manga" type="submit">Manga</button>
    </section>
</form>
<%@include file="./views/footer.html" %>
</body>
</html>