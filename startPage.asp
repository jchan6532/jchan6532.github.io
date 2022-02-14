<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>SET Pizza Shop</title>
        <link rel="stylesheet" href="./style.css"/>

        <script type="text/javascript">

            function checkName() {
                let spaceRegEx = new RegExp(/^[a-zA-Z]\w+\s+[a-zA-Z]\w+$/);
                var name = document.getElementById("NameTbID").value;

                if (spaceRegEx.test(document.getElementById("NameTbID").value) == false) {
                    console.log(spaceRegEx.test(document.getElementById("NameTbID").value));
                    document.getElementById("errorMsgID").innerHTML = "<pre>Entry must be your first and last name separated by a space >:(<pre>";
                    return false;
                }
                else {
                    formSubmit();
                    document.getElementById("errorMsgID").innerHTML = "";
                    return true;
                }
            }

            function formSubmit() {
                var form = document.getElementById("nameFormID");
                var path = window.location.href;
                path = path.replace("startPage.asp", "page2.asp");
                form.action = path;
            }
        </script>

    </head>

    <body>
        <h1>SET Pizza Shop</h1>
        <div class="container">
            <form id="nameFormID" action="/" method="get">

                <div id="NameID">
                    <label for="NameTbID">Please enter full name: </label>
                    <input type="text" name="NameTbNAME" value="" id="NameTbID" placeholder="Jane Doe" required />
                </div>

                <br />

                <div id="errorMsgID" style="color: red"></div>

                <br />

                <button type="submit" onclick="return checkName()">Submit</button>

            </form>
        </div>
    </body>
</html>