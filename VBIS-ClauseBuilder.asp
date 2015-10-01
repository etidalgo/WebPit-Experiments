<%@ Language=VBScript %>
<!--#include virtual="Experiments/SQLHelpers.asp"-->
<%

Dim ClauseB

Set ClauseB = new ClauseBuilder
ClauseB.Add ("[Field] = ?")
ClauseB.Add ("[FieldAlpha] = ?")
ClauseB.Add ("[FieldBeta] = ?")
ClauseB.Add ("[FieldGamma] = ?")
ClauseB.Add ("[FieldDelta] = ?")

Dim str
str = ClauseB.List( " AND ")
Dim str2
str2 = ClauseB.List(", ")

%>
<!-- CDate Function <https://msdn.microsoft.com/en-us/library/2dt118h2(v=vs.84).aspx> -->
<!-- VBScript CDate Function <http://www.tutorialspoint.com/vbscript/vbscript_cdate_function.htm> -->

<html>

<head>
	<title>Another reason to dislike VBScript - ClauseBuilder Edition</title>
</head>
<body>
<%

	Response.Write str & "<br>"
	Response.Write str2 & "<br>"

%><br>

</body>
</html>

<%

%>