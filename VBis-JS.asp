<%@ Language=VBScript %>
<!--#include virtual="experiments/includes/utils.inc"-->
<%
Dim someAspVar, notherAspVar
someAspVar = false
notherAspVar = true

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>    
    <title>VB to JS follies</title>   

<script type="text/javascript">
	var someVar = <% Call ToJsBool(someAspVar) %>;
	var someOtherVar = <% =ToJsBoolStr(notherAspVar) %>;

</script>
</head>
<body>


	

</body>

</html>

