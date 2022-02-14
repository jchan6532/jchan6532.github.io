<%Option Explicit%>

<%
    Dim topping
    topping = Request.QueryString("topping")

    If topping="1" Then 
        Response.Write("1.5")
    ElseIf topping="2" Then 
        Response.Write("1")
    ElseIf topping="3" Then 
        Response.Write("1")
    ElseIf topping="4" Then 
        Response.Write("1")
    ElseIf topping="5" Then 
        Response.Write("2.25")
    ElseIf topping="-1" Then 
        Response.Write("-1.5")
    ElseIf topping="-2" Then 
        Response.Write("-1")
    ElseIf topping="-3" Then 
        Response.Write("-1")
    ElseIf topping="-4" Then 
        Response.Write("-1")
    ElseIf topping="-5" Then 
        Response.Write("-2.25")
    End If
%>
