<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Thank You</title>
        <link rel="stylesheet" href="./style.css"/>
        <script type="text/javascript">
            function isCancelledOrder() {
                let u = new URL(window.location.href);
                let url = new URLSearchParams(u.search);
                let cancelledOrder = url.get("cancelledOrder");
                if (cancelledOrder != null) {
                    document.getElementById("greetingID").innerHTML += "Your order cancellation was processed!";
                    document.getElementById("paymentChoiceID").innerHTML = "<pre>You chose to cancel your pizza purchase</pre>";
                }
                else {
                    document.getElementById("greetingID").innerHTML += "Thank you for your purchase!";
                    document.getElementById("paymentChoiceID").innerHTML = "<pre>You chose to go with your pizza purchase,<br /> would you like to give me extra-tips?</pre>";
                }
            }
        </script>
    </head>

    <body>
        <h1>SET Pizza Shop</h1>
        <div class="container">
            <%name=Session("fullName") %>
            <div id="greetingID"><%Response.Write(name) %>, </div>
            <br />
            <div id="paymentChoiceID"></div>
            <script type="text/javascript">
                isCancelledOrder();
            </script>
        </div>
    </body>
</html>