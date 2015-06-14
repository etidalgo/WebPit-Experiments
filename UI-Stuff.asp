<%@ Language=VBScript %>
<%
    Dim something
	If Request.Form.Count > 0 Then	
       something = Request.Form("CboM_Groups[]")
	End If	

Dim someVar(5)
someVar(1) = "beta"
someVar("2") = "gamma"
someVar(5) = "epsilon"
'someVar("delta") = "eta"

Response.Write someVar("1") & "<br>"
'Response.Write someVar("delta") & "<br>"
Response.Write someVar(5) & "<br>"

%>



<html>
<head>
</head>
<body>
	<form name="HTMLFormElements" action="ui-stuff.asp" method="post" id="HTMLFormElements">
		<select multiple name="CboM_Groups[]" id="CboM_Groups" size=4>
		   <option value="1">CLU</option>
		   <option value="2">Credit Risk</option>
		   <option value="3">Pricing</option>
		</select> 
        <input type="submit" name="submitbutton" value="submit" />
	</form>
</body>
</html>

