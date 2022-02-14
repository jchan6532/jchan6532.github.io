<%Option Explicit%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Customize Your Pizza</title>
        <link rel="stylesheet" href="./style.css"/>
        <script type="text/javascript">
            
            function addToppingPrice(id) {
                var topping = 0;
                if (document.getElementById(id).checked == true) {
                    if (id == "pepperoniCbID") {
                        topping = 1;
                    }
                    else if (id == "muchsroomsCbID") {
                        topping = 2;
                    }
                    else if (id == "greenOlivesCbID") {
                        topping = 3;
                    }
                    else if (id == "greenPeppersCbID") {
                        topping = 4;
                    }
                    else if (id == "doubleCheeseCbID") {
                        topping = 5;
                    }
                }
                else if (document.getElementById(id).checked == false) {
                    if (id == "pepperoniCbID") {
                        topping = -1;
                    }
                    else if (id == "muchsroomsCbID") {
                        topping = -2;
                    }
                    else if (id == "greenOlivesCbID") {
                        topping = -3;
                    }
                    else if (id == "greenPeppersCbID") {
                        topping = -4;
                    }
                    else if (id == "doubleCheeseCbID") {
                        topping = -5;
                    }
                }

                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        var currentPrice = parseFloat(document.getElementById("currentPriceID").innerHTML);

                        currentPrice = currentPrice + parseFloat(this.responseText);
                        sessionStorage.setItem("currentPrice", currentPrice.toFixed(2).toString());
                        document.getElementById("currentPriceID").innerHTML = currentPrice.toFixed(2).toString();
                    }
                };
                xmlhttp.open("GET", "ajaxIncreasePrice.asp?topping=" + topping, true);
                xmlhttp.send();

            }

            function formSubmit() {
                sessionStorage.setItem("currentPrice", document.getElementById("currentPriceID").innerHTML);
                var form = document.getElementById("toppingsFormID");
                var path = window.location.href;
                path = path.replace("page2", "page3");
                form.action = path;
            }
        </script>
    </head>

    <body>
        <h1>SET Pizza Shop</h1>
        <div class="container">
            <div>
                <%
                    Dim name
                    name = Request.QueryString("NameTbNAME")

                    Session.Timeout=10
                    Session("fullName")=name
                %>
                Ciao <% Response.Write(Split(name)(0)) %>
            </div>

            <br />

            <div class="pizza" id="largeID">
                <input type="radio" id="largePizzaID" checked="checked"/>
                <label for="largePizzaID">Large Pizza $10.00</label>

                <div id="errorMsgID" style="color: firebrick">
                    you can only order one 1 large pizza <br/>
                    pizza comes with sauce and cheese
                </div>
            </div>

            <br />

            <div class="topping" id="ToppingCheckboxID">
                <form id="toppingsFormID" action="/" method="get">
                    <b>Please select your favorite topping(s): </b>
                    <br />
                    <input type="checkbox" name="pepperoniCbNAME" id="pepperoniCbID" value="1" onclick="addToppingPrice('pepperoniCbID');"/>&nbsp;
                    <label for="pepperoniCbID">pepperoni $1.50  </label>
                    <br />
                    <input type="checkbox" name="muchsroomsCbNAME" id="muchsroomsCbID" value="2" onclick="addToppingPrice('muchsroomsCbID')"/>&nbsp;
                    <label for="muchsroomsCbID">mushrooms $1.00  </label>
                    <br />
                    <input type="checkbox" name="greenOlivesCbNAME" id="greenOlivesCbID" value="3" onclick="addToppingPrice('greenOlivesCbID')"/>&nbsp;
                    <label for="greenOlivesCbID">green olives $1.00  </label>
                    <br />
                    <input type="checkbox" name="greenPeppersCbNAME" id="greenPeppersCbID" value="4" onclick="addToppingPrice('greenPeppersCbID')"/>&nbsp;
                    <label for="greenPeppersCbID">green peppers $1.00  </label>
                    <br />
                    <input type="checkbox" name="doubleCheeseCbNAME" id="doubleCheeseCbID" value="5" onclick="addToppingPrice('doubleCheeseCbID')"/>&nbsp;
                    <label for="doubleCheeseCbID">double cheese $2.25  </label>
                    <br />
                    <br />
                    <button type="submit" onclick="formSubmit()">Make It!</button>
                </form>

            </div>

            <br />

            <div class="totalPrice">
                Total Price: $<span id="currentPriceID">10.00</span>
            </div>
        </div>
    </body>
</html>
