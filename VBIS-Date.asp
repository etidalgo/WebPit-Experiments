<%@ Language=VBScript %>
<%

	Dim prevDate
	Dim futureDate
	
	prevDate = CDate("21/08/1999 10:16:41 a.m.")
	futureDate = CDate("21/08/2025 10:16:41 a.m.")
	thisDate = Date()
	nextDate = DateAdd("d", 1, thisDate)

Public Sub DateCompare ( oneDate, notherDate )

	Response.Write "Comparing " & oneDate & " and " & notherDate  & "<br>"
	If oneDate < notherDate Then
		Response.Write " " & oneDate & " precedes " & notherDate  & "<br>"
	Else
		Response.Write " " & oneDate & " follows " & notherDate  & "<br>"
	End If
	
End Sub	
%>
<!-- CDate Function <https://msdn.microsoft.com/en-us/library/2dt118h2(v=vs.84).aspx> -->
<!-- VBScript CDate Function <http://www.tutorialspoint.com/vbscript/vbscript_cdate_function.htm> -->

<html>

<head>
	<title>Another reason to dislike VBScript</title>
</head>
<body>
<%
	Call DateCompare (prevDate, futureDate)
	Call DateCompare (prevDate, thisDate)
	Call DateCompare (futureDate, thisDate)

	'Crash: Response.Write "CDate(""Mon, 30 Nov 2015 00:00:00 GMT""): " & CDate("Mon, 30 Nov 2015 00:00:00 GMT") & "<br>"
	'Crash: Response.Write "CDate(""Mon, 30 Nov 2015 00:00:00 GMT""): " & CDate("Mon, 30 Nov 2015 00:00:00 GMT") & "<br>"
	'Crash Response.Write "CDate(""""): " & CDate("") & "<br>"
	
	Response.Write "CDate(""21/08/2015 10:16:41 a.m.""): " & CDate("21/08/2015 10:16:41 a.m.") & "<br>"
	Response.Write "Time(): " & Time() & "<br>"
	Response.Write "Date(): " & Date() & "<br>"
	Response.Write "Now(): " & Now() & "<br>"
	
	On Error Resume Next
	'This gives a type mismatch
	Response.Write "CDbl(""""): " & CDbl("") & "<br>"
	If Err.Number <> 0 Then
		Response.Write Err.Description & "<br>"
	End If
	
	Response.Write "thisDate: " & thisDate & "<br>"
	
	Response.Write "nextDate: " & nextDate & "<br>"
%><br>

</body>
</html>

<%

%>