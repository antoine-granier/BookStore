<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" type="text/css" href="../styles/header.css" />
    <link rel="stylesheet" type="text/css" href="../styles/default.css" />
    <link rel="stylesheet" type="text/css" href="../styles/reset.css" />
    <link rel="stylesheet" type="text/css" href="../styles/footer.css" />
</head>
<script>

    function deleteItem(name) {
        const local = Array.from(JSON.parse(localStorage.getItem('cart')))
        let newLocal = [];
        local.map(book => {
            if (book.name !== name) {
                newLocal.push(book);
            }
        })
        if(newLocal.length === 0) {
            localStorage.removeItem("cart")
        } else {
            localStorage.setItem('cart', JSON.stringify(newLocal));
        }
        loadCart();
    }

    function loadCart() {
        const cartList = document.getElementById("cart-list");
        const total = document.getElementById("total");
        total.innerHTML = "";
        if (localStorage.getItem('cart') !== null && JSON.parse(localStorage.getItem('cart')).length !== 0) {
            const bookList = Array.from(JSON.parse(localStorage.getItem('cart')));
            let totalPrice = 0;
            let cartHtml = "";
            bookList.map(book => {
                totalPrice += +(book.price);
                cartHtml += "<div class='cart-item'><div class='cart-item-left'><p class='book-name'>" + book.name + "</p><p class='book-author'>" + book.author + "</p></div><div class='cart-item-left'><img src=\"../icon/trash.svg\" onclick='deleteItem(\"" + book.name + "\")'/><p class='book-price'>" + book.price + " €</p></div></div>"
            })
            cartList.innerHTML = cartHtml;
            total.innerHTML = "<p class='total-text'>TOTAL</p><div class='cart-item-left'><a href='payment.jsp'><button style='border: none' class=\"add-cart\">Pay</button></a><p class='book-price'>" + totalPrice.toFixed(2) + " €</p></div>";
        } else {
            cartList.innerHTML = "<p>No product added to your cart</p>"
        }
    }
</script>
<%@include file="./header.html" %>
<body onload="loadCart()">
    <div id="cart-list" class="cart-list"></div>
    <div id="total" class="total"></div>
</body>
<%@include file="./footer.html" %>
</html>
