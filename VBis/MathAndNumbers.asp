<%@ Language=VBScript %>

<%

Const ToleranceVal = 0.30
Dim valOne
Dim valTwo, valThree

valOne =  Val("0.03") 
valTwo = Val("1.0")
valThree = valOne + 0.01

Dim isDiffAlpha, isDiffBeta
	isDiffAlpha = Abs(valOne - valTwo) > ToleranceVal 
	isDiffBeta = Abs(valOne - valTwo) < ToleranceVal 
	
%>

<html>

<head>
	<title>VBis - Numbers and Math Edition</title>
</head>
<body>
	valOne: <%=valOne%> or <%=CStr(valOne)%> <br/>
	valTwo: <%=valTwo%><br/>
	valThree: <%=valThree%><br/>
	ToleranceVal: <%=ToleranceVal%><br/>
	Abs(valOne - valTwo): <%=Abs(valOne - valTwo)%><br/>
	Abs(valTwo - valOne): <%=Abs(valTwo - valOne)%><br/>

	Abs(valOne - valTwo) > ToleranceVal: <%=ToBoolStr(isDiffAlpha)%><br/>
	Abs(valOne - valTwo) < ToleranceVal: <%=ToBoolStr(isDiffBeta)%><br/>
	
</body>
</html>

<%
'-----------------------------------------------------------------------------------------------
Function ToBoolStr(val) 
	If (val) THEN ToBoolStr = "true" ELSE ToBoolStr = "false" End If
End Function

Function Val(var)
	if isnumeric(var) then
		Val = CDbl(var)
	else
		Val = 0
	end if
End Function


%>