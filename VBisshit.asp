<%@ Language=VBScript %>
<%
    Dim dealerGroups(5), groupsMaster(5)
	Response.Write UBound(groupsMaster) & "<br>"
    'can't do this, it is a fixed array
    'Redim Preserve groupsMaster(4)


    Dim NotFixed()
	'Response.Write UBound(NotFixed)
    Redim Preserve NotFixed(4)
	Response.Write UBound(NotFixed) & "<br>"

	'Response.Write groupsMaster.GetLength(0)
	'Response.Write groupsMaster.GetUpperBound(0)
	
	Sub InvokingMethod() 
		Dim defVar, intVar, valVar, refVar
		defVar = "gamma"
		intVar = 9
		valVar = "alpha"
		refVar = "omega"
		Response.Write "Before <br/>"
		Response.Write "defVar: " & defVar & "<br/>"
		Response.Write "intVar: " & intVar & "<br/>"
		Response.Write "varVar: " & valVar & "<br/>"
		Response.Write "refVar: " & refVar & "<br/>"

		'ByRef and ByVal in VBScript - Stack Overflow <http://stackoverflow.com/questions/1537819/byref-and-byval-in-vbscript>
		Call SubMethod (defVar, intVar, valVar, refVar)
		Response.Write "After <br/>"
		Response.Write "defVar: " & defVar & "<br/>"
		Response.Write "intVar: " & intVar & "<br/>"
		Response.Write "varVar: " & valVar & "<br/>"
		Response.Write "refVar: " & refVar & "<br/>"
	End Sub 

	'By default, arguments are passed as ByRef. 
	'ByRef and ByVal Parameters <https://msdn.microsoft.com/en-us/library/ee478101(v=vs.84).aspx>
	Sub SubMethod( defVar, intVar, ByVal valVar, ByRef refVar )
		defVar = "ammag"
		intVar = intVar * 10
		valVar = "beta"
		refVar = "forge"
	End Sub

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>    
    <title>VB Samples - Arrays</title>   
	<meta http-equiv="X-UA-Compatible" Content="IE=Edge" />

<script type="text/javascript">
	var foolurl=document.url;
</script>
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
	
	<% response.write "<script type=""text/javascript"">" %>
	<% response.write "alert(""I hate vbscript"")" %>
	<% response.write "</script>" %>
	
	<% Call InvokingMethod %>
</body>
<script type="text/javascript">
	alert(window.location.href);
</script>
</html>

