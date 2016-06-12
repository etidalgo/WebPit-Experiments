<%@ Language=VBScript %>

<%

Const ToleranceVal = 0.30
Dim valOne
Dim valTwo

valOne =  Val("0.03") 
valTwo = Val("1.0")


%>

<html>

<head>
	<title>VBis - Numbers and Math Edition</title>
</head>
<body>
	valOne: <%=valOne%><br/>
	valTwo: <%=valTwo%><br/>
	ToleranceVal: <%=ToleranceVal%><br/>
	Abs(valOne - valTwo): <%=Abs(valOne - valTwo)%><br/>
	Abs(valTwo - valOne): <%=Abs(valTwo - valOne)%><br/>

</body>
</html>

<%

Function Val(var)
	if isnumeric(var) then
		Val = CDbl(var)
	else
		Val = 0
	end if
End Function


%>