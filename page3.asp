<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Confirm Order</title>
        <link rel="stylesheet" href="./style.css"/>
        <script type="text/javascript">
            function goToNextPage() {
                var currentPath = window.location.href;
                const urlSections = currentPath.split('?')
                urlSections[0] = urlSections[0].replace("page3.asp", "page4.asp");
                window.location.href = urlSections[0];
            }

            function cancelOrder() {
                var currentPath = window.location.href;
                const urlSections = currentPath.split('?')
                urlSections[0] = urlSections[0].replace("page3.asp", "page4.asp");
                urlSections[0] = urlSections[0] + "?cancelledOrder=1";
                window.location.href = urlSections[0];
            }
        </script>
    </head>

    <body>
        <h1>SET Pizza Shop</h1>
        <div class="container">
            <div>
                <%
                    Dim name
                    name=Session("fullName")
                %>
                Ciao <%Response.Write(Split(name)(0))%>
            </div>

            <br />
            <br />

            <div id="reviewOrderID">
                <pre>please review your price for this order: </pre>
            </div>
            <br/>
            <div id="pricesummaryID" style="font-family: Segoe UI">
                <%
                    Response.Write("<pre>Pizza &emsp;         $10.00</pre>")
                    For Each topping in Request.QueryString
                        If topping="pepperoniCbNAME" Then
                            Response.Write("<pre>Pepperoni &emsp;     $1.50</pre>")

                        ElseIf topping="muchsroomsCbNAME" Then
                            Response.Write("<pre>Mushroom &emsp;      $1.00</pre>")

                        ElseIf topping="greenOlivesCbNAME" Then
                            Response.Write("<pre>Green Olives &emsp;  $1.00</pre>")

                        ElseIf topping="greenPeppersCbNAME" Then
                            Response.Write("<pre>Green Peppers &emsp; $1.00</pre>")

                        ElseIf topping="doubleCheeseCbNAME" Then
                            Response.Write("<pre>Double Cheese &emsp; $2.25</pre>")

                        End If
                    Next
                    
                %>

                <span id="price"></span>
                <script type="text/javascript">
                    getPrice();

                    function getPrice() {
                        document.getElementById("price").innerHTML = "<pre>Total &emsp;         $" + sessionStorage.getItem("currentPrice") + "</pre>";
                    }
                </script>
            </div>

            <br />
            <br />
            <div>
                <button onclick="goToNextPage()">Confirm</button>
                <br />
                <br />
                <button onclick="cancelOrder()">Cancel</button>
            </div>
        </div>
    </body>
</html>
