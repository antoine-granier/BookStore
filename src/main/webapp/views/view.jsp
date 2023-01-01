<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>BookStore</title>
  <link rel="stylesheet" type="text/css" href="./styles/header.css" />
  <link rel="stylesheet" type="text/css" href="./styles/default.css" />
  <link rel="stylesheet" type="text/css" href="./styles/reset.css" />
  <link rel="stylesheet" type="text/css" href="./styles/footer.css" />
</head>
<script language="javascript" type="text/javascript">
  function addToCart(name, author, description, price) {
    let oldItems = JSON.parse(localStorage.getItem('cart')) || [];
    const newItem = {
      name: name,
      author: author,
      description: description,
      price: price
    }
    oldItems.push(newItem);
    localStorage.setItem('cart', JSON.stringify(oldItems));
    disableBtn();
  }

  function disableBtn() {
    if (localStorage.getItem('cart') !== null && JSON.parse(localStorage.getItem('cart')).length !== 0) {
      const btns = document.getElementsByClassName("add-cart");
      const local = JSON.parse(localStorage.getItem('cart'));
      for (let i = 0; i < btns.length; i++) {
        local.map(book => {
          if(btns[i].parentNode.children[0].innerText === book.name) {
            btns[i].disabled = true;
          }
        })
      }
    }
  }
</script>
<body onload="disableBtn()">
<%@include file="./header.html" %>
  <c:if test="${books.isEmpty()}">
    <div>
      <h2>No result</h2>
    </div>
  </c:if>
  <c:if test="${!books.isEmpty()}">
    <div class="books-container">
    <c:forEach items="${books}" var="book">
      <div class="book-card">
        <p class="book-name">${book.name}</p>
        <p class="book-author">${book.author}</p>
        <p class="book-description">${book.description}</p>
        <p class="book-price">${book.price} €</p>
        <button class="add-cart" onclick="addToCart('${book.name}', '${book.author}', '${book.description}', '${book.price}')">Add to cart</button>
      </div>
    </c:forEach>
    </div>
  </c:if>
<%@include file="./footer.html" %>
</body>
</html>