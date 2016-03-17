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

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>    
    <title>Qik for the Web</title>   
	<meta http-equiv="X-UA-Compatible" Content="IE=10" />

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
	<% response.write "alert(""Alert dispatched"")" %>
	<% response.write "</script>" %>
</body>
<script type="text/javascript">
	alert(window.location.href);
</script>
</html>

